package com.abc.admin;

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

@Controller
public class AdminController {

	@Autowired
	AdminService adminService;

	@Autowired
	EmailSenderService emailService;

	@RequestMapping("/admin-login")
	public ModelAndView adminLoginPage() {
		ModelAndView mv = new ModelAndView();

		Admin admin = new Admin();
		mv.setViewName("admin/admin-login");
		mv.addObject("adminLogin", admin);
		return mv;
	}

	// Admin login
	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
	public String adminLogin(@ModelAttribute("adminLogin") Admin admin, HttpSession session, Model model) {
		Admin adminLogin = adminService.loadAdminByEmail(admin.getEmail());

		if (adminLogin != null) {

			if (adminLogin.getPassword().equals(admin.getPassword())) {
				session.setAttribute("admin", adminLogin);
			} else {
				model.addAttribute("message", "Wrong password, please try again.");
				model.addAttribute("error", "border: 1px solid #b02a37;");
				return "admin/admin-login";
			}

		} else {
			model.addAttribute("message", "Invalid account, please try again.");
			model.addAttribute("error", "border: 1px solid #b02a37;");
			return "admin/admin-login";
		}

		return "redirect:/admin-dashboard";
	}

	// Admin Dashboard
	@RequestMapping("/admin-dashboard")
	public ModelAndView dashboard(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (adminService.getAdmin(session) == null) {
			mv.setViewName("redirect:/admin-login");
			return mv;
		}

		List<UserProfile> listUser = adminService.listUser();

		mv.addObject("listUser", listUser);
		mv.setViewName("admin/admin-dashboard");
		return mv;
	}

	// Admin Logout
	@RequestMapping("/adminLogout")
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/admin-login";
	}

	// Edit User
	@RequestMapping("/admin-edit")
	public ModelAndView editProfile(@RequestParam("id") int id, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		if (adminService.getAdmin(session) == null) {
			mv.setViewName("redirect:/admin-login");
			return mv;
		}

		UserProfile profile = adminService.findUser(id);

		mv.setViewName("admin/admin-edit");
		mv.addObject("editAdmin", profile);

		return mv;
	}

	// Save Edit User
	@RequestMapping(value = "/saveEditAdmin", method = RequestMethod.POST)
	public String saveEditProfile(@ModelAttribute("editAdmin") UserProfile profile, HttpSession session) {
		adminService.saveEdit(profile);

		return "redirect:/admin-dashboard";
	}

	// Delete User
	@RequestMapping("/admin-delete")
	public String deleteUser(@RequestParam int id) {
		adminService.deleteUser(id);
		return "redirect:/admin-dashboard";
	}

	// Add User
	@RequestMapping("/admin-add")
	public ModelAndView addUser(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		if (adminService.getAdmin(session) == null) {
			mv.setViewName("redirect:/admin-login");
			return mv;
		} else {
			User user = new User();
			UserProfile profile = new UserProfile();
			Job job = new Job();
			user.setProfile(profile);
			user.getProfile().setJob(job);
			mv.addObject("addAdmin", user);
		}

		List<Job> listJob = adminService.listJob();
		mv.addObject("listJob", listJob);
		mv.setViewName("admin/admin-add");

		return mv;
	}

	// Save Add User
	@RequestMapping(value = "/saveAdd", method = RequestMethod.POST)
	public String saveAdd(@ModelAttribute("addAdmin") User user, Model model) {
		adminService.saveAdd(user);

		return "redirect:/admin-dashboard";
	}

	// Send Bulk Email page
	@RequestMapping("/send-bulk-email")
	public ModelAndView sendBulkEmailPage(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		if (adminService.getAdmin(session) == null) {
			mv.setViewName("redirect:/admin-login");
			return mv;
		} else {
			BulkEmail bulkEmail = new BulkEmail();
			mv.addObject("bulkEmail", bulkEmail);
		}
		
		List<UserProfile> listUser = adminService.listUser();

		mv.addObject("listUser", listUser);

		mv.setViewName("admin/send-bulk-email");

		return mv;
	}

	// Send Bulk Email
	@RequestMapping("/sendBulkEmail")
	public String sendBulkEmail(@ModelAttribute("bulkEmail") BulkEmail bulkEmail) {
		List<User> listUser = adminService.findAllUserById(bulkEmail.getUsersId());

		for (User user : listUser) {
			emailService.sendEmail(user.getEmail(), bulkEmail.getSubject(), bulkEmail.getContent());
		}

		return "redirect:/admin-dashboard";
	}
}
