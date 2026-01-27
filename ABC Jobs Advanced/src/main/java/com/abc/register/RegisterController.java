package com.abc.register;

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

import com.abc.email_sender.EmailSenderService;
import com.abc.entity.*;
import com.abc.login.LoginService;

@Controller
public class RegisterController {

	@Autowired
	RegisterService registerService;

	@Autowired
	LoginService loginService;

	@Autowired
	EmailSenderService senderService;

	@RequestMapping("/register")
	public ModelAndView registerPage(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		if (loginService.getCurrentUser(session) != null) {
			mv.setViewName("redirect:/");
			return mv;
		} else {
			User user = new User();
			UserProfile profile = new UserProfile();
			Job job = new Job();
			user.setProfile(profile);
			user.getProfile().setJob(job);
			mv.addObject("register", user);
		}

		List<Job> listJob = registerService.listJob();
		mv.addObject("listJob", listJob);
		mv.setViewName("register");

		return mv;
	}

	@RequestMapping(value = "/saveRegister", method = RequestMethod.POST)
	public String saveRegister(@ModelAttribute("register") User user, Model model) {
		User logUser = loginService.loadUserByEmail(user.getEmail());

		if (logUser != null) {
			if (user.getEmail().equals(logUser.getEmail())) {
				model.addAttribute("message", "This email address is already registered");
				model.addAttribute("error", "border: 1px solid #b02a37;");
				return "register";
			}
		}

		registerService.saveRegister(user);

		senderService.sendEmail(user.getEmail(),
				"Welcome to ABC Jobs",
				"Thank you for completing your registration with ABC Jobs.\n"
				+ "This email serves as a confirmation that your account is activated and that you are officially a part of the ABC Jobs.\n"
				+ "Click link below to activate your account:\n"
				+ "http://localhost:8080/abcjobs/register-confirmation?id="
						+ loginService.loadUserByEmail(user.getEmail()).getId_user()
						+ "\n\nBest Regards \n"
						+ "The ABC Jobs team");

		String email = user.getEmail();
		model.addAttribute("email", email);
		return "thank-you";
	}

	@RequestMapping(value = "/register-confirmation", method = RequestMethod.GET)
	public String registerConfirmation(@RequestParam("id") int id) {
		User user = registerService.findUser(id);
		
		registerService.userActivation(user);

		return "register-confirmation";
	}

}
