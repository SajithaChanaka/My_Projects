package com.abc.login;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.abc.entity.*;

@Controller
public class LoginController {

	@Autowired
	LoginService loginService;
	
	@RequestMapping("/login")
	public ModelAndView loginpage() {
		ModelAndView mv = new ModelAndView("login");

		User user = new User();
		UserProfile profile = new UserProfile();
		user.setProfile(profile);
		mv.addObject("userLogin", user);
		return mv;
	}

	// Login
	@RequestMapping(value = "/doLogin", method = RequestMethod.POST)
	public String userLogin(@ModelAttribute("userLogin") User user, HttpSession session, Model model) {
		User loginUser = loginService.loadUserByEmail(user.getEmail());

		if (loginUser != null) {
			UserProfile profile = loginService.loadProfile(loginUser);

			if (loginUser.getEnabled() == false) {
				model.addAttribute("message", "Please activate your account first.");
				model.addAttribute("error", "border: 1px solid #b02a37;");
				return "login";
			}

			if (profile.getUser().getPassword().equals(user.getPassword())) {
				session.setAttribute("profile", profile);
			} else {
				model.addAttribute("message", "Wrong password, please try again.");
				model.addAttribute("error", "border: 1px solid #b02a37;");
				return "login";
			}

		} else {
			model.addAttribute("message", "Invalid account, please try again.");
			model.addAttribute("error", "border: 1px solid #b02a37;");
			return "login";
		}

		return "redirect:/user-profile";
	}
	
	// User Profile
	@RequestMapping("/user-profile")
	public String userProfile(HttpSession session, Model model) {
		UserProfile user = loginService.getCurrentUser(session);
		
		if (user == null) {
			return "redirect:/login";
		}
		
		List<UserProfile> listPeople = loginService.listPeople(user.getId_profile());
		
		model.addAttribute("listPeople", listPeople);
		
		return "user-profile";
	}
	
	// Logout
	@RequestMapping("/logout")
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
}
