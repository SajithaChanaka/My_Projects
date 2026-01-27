package com.abc.forgot_password;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.abc.email_sender.EmailSenderService;
import com.abc.entity.User;

@Controller
public class ForgotPasswordController {
	
	@Autowired
	ForgotPasswordService forgotPasswordService;
	
	@Autowired
	EmailSenderService emailService;
	
	@RequestMapping("/forgot-password")
	public ModelAndView forgotPassword() {
		ModelAndView mv = new ModelAndView();
		
		User user = new User();
		
		mv.setViewName("forgot-password");
		mv.addObject("fpUser", user);
		return mv;
	}
	
	@RequestMapping("/forgot-password-confirmation")
	public String forgotPasswordConfirmation(@ModelAttribute("fpUser") User user, Model model) {
		
		User fpUser = forgotPasswordService.findUser(user.getEmail());
		
		if(fpUser == null) {
			model.addAttribute("message", "Invalid account");
			model.addAttribute("error", "border: 1px solid #b02a37;");
			return "forgot-password";
		} else {
			forgotPasswordService.forgotPassword(fpUser);
			emailService.sendEmail(fpUser.getEmail(), "Reset Password!", 
					"There was a request to change your password! \n"
					+ "Your password has been reset to: \n"
					+ "password123\u001B \n"
					+ "Use that password to log in as your account \n\n"
					+ "Yours, \n"
					+ "The ABC Jobs team");
		}
		
		return "forgot-password-confirmation";
	}
}
