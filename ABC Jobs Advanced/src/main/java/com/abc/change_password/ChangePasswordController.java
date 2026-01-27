package com.abc.change_password;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.abc.entity.*;
import com.abc.login.LoginService;

@Controller
public class ChangePasswordController {

	@Autowired
	ChangePasswordService changePasswordService;

	@Autowired
	LoginService loginService;

	@RequestMapping("/change-password")
	public ModelAndView changePassword() {
		ModelAndView mv = new ModelAndView();
		ChangePasswordForm form = new ChangePasswordForm();

		mv.setViewName("change-password");
		mv.addObject("changePassword", form);
		return mv;
	}

	@RequestMapping("/changePassword")
	public String saveChangePassword(@ModelAttribute("changePassword") ChangePasswordForm form, HttpSession session,
			Model model) {
		UserProfile profile = loginService.getCurrentUser(session);
		String oldPassword = profile.getUser().getPassword();
		String newPassword = form.getNewPassword();

		if (form.getOldPassword() == null || form.getOldPassword() == "") {
			model.addAttribute("message", "Old Password is required");
			model.addAttribute("error", "border: 1px solid #b02a37;");
			return "change-password";
		} else if (form.getOldPassword().equals(oldPassword) == false) {
			model.addAttribute("message", "Old Password is incorrect");
			model.addAttribute("error", "border: 1px solid #b02a37;");
			return "change-password";
		} else if (newPassword == null || newPassword == "") {
			model.addAttribute("message", "New Password is required");
			model.addAttribute("error", "border: 1px solid #b02a37;");
			return "change-password";
		} else if (oldPassword.equals(newPassword)) {
			model.addAttribute("message", "Please enter a new password");
			model.addAttribute("error", "border: 1px solid #b02a37;");
			return "change-password";
		} else {
			changePasswordService.changePassword(profile.getUser(), form.getNewPassword());
			session.invalidate();
		}

		return "redirect:/login";
	}
}
