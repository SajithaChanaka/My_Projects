package com.abc.search;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abc.entity.*;
import com.abc.login.LoginService;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;
	
	@Autowired
	LoginService loginService;

	@RequestMapping("/search-user")
	public ModelAndView searchUser() {
		ModelAndView mv = new ModelAndView();
		SearchForm form = new SearchForm();

		mv.setViewName("search-user");
		mv.addObject("searchUser", form);
		return mv;
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(@ModelAttribute("searchUser") SearchForm searchForm, Model model) {
		SearchForm form = new SearchForm();
		String keyword = searchForm.getKeyword();
		List<SearchProfile> result = searchService.search(keyword);

		model.addAttribute("keyword", keyword);
		model.addAttribute("result", result);
		model.addAttribute("searchUser", form);
		return "search-user";
	}

	@RequestMapping(value = "/view-profile", method = RequestMethod.GET)
	public ModelAndView viewProfile(@RequestParam("id") int id, HttpSession session) {
		UserProfile profile = searchService.loadUserById(id);
		ModelAndView mv = new ModelAndView();
		
		UserProfile user = loginService.getCurrentUser(session);
		int id_profile = 0;
		
		if(user != null) {
			id_profile = user.getId_profile();
		}
		
		List<UserProfile> listPeople = loginService.listPeople(id_profile);
		
		mv.setViewName("view-profile");
		
		mv.addObject("listPeople", listPeople);
		
		mv.addObject("view", profile);
		return mv;
	}
}
