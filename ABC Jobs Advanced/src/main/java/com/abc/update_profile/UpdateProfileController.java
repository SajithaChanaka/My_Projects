package com.abc.update_profile;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.abc.entity.*;
import com.abc.login.LoginService;

@Controller
public class UpdateProfileController {

	@Autowired
	UpdateProfileService updateService;

	@Autowired
	LoginService loginService;

	@RequestMapping("/edit-profile")
	public ModelAndView editProfile(HttpSession session) {
		ModelAndView mv = new ModelAndView("edit-profile");
		UserProfile profile = loginService.getCurrentUser(session);
		
		if(profile == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		
		mv.addObject("profile", profile);
		return mv;
	}

	@RequestMapping(value = "/save-edit", method = RequestMethod.POST)
	public String saveEditProfile(@ModelAttribute("profile") UserProfile profile, HttpSession session) {
		UserProfile user = loginService.getCurrentUser(session);
		
		if(user == null) {
			return "redirect:/login";
		}
		
		UserProfile editedProfile = updateService.saveEdit(profile);

		session.setAttribute("profile", editedProfile);
		return "redirect:/user-profile";
	}
}
