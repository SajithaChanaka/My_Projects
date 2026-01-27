package com.abc.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abc.entity.ApplyJob;
import com.abc.entity.Job;

@Controller
public class ManageJobController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping("/manage-job")
	public ModelAndView manageJob(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (adminService.getAdmin(session) == null) {
			mv.setViewName("redirect:/admin-login");
			return mv;
		}
		
		List<Job> listJob = adminService.listJob();
		
		mv.addObject("listJob", listJob);
		mv.setViewName("admin/manage-job");
		
		return mv;
	}
	
	@RequestMapping("/post-job")
	public ModelAndView postJob(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (adminService.getAdmin(session) == null) {
			mv.setViewName("redirect:/admin-login");
			return mv;
		}
		
		Job job = new Job();
		
		mv.addObject("manageJob", job);
		mv.setViewName("admin/post-job");
		
		return mv;
	}
	
	@RequestMapping(value = "/postJob", method = RequestMethod.POST)
	public String savePostJob(@ModelAttribute("manageJob") Job job) {
		job.setCompany_image("images/logo/" + job.getCompany_name().toLowerCase() + ".png");
		
		adminService.postJob(job);
		
		return "redirect:/manage-job";
	}
	
	@RequestMapping("/job-applicant")
	public ModelAndView jobApplicant(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (adminService.getAdmin(session) == null) {
			mv.setViewName("redirect:/admin-login");
			return mv;
		}
		
		List<ApplyJob> listApplicant = adminService.listJobApplicant();
		
		listApplicant.removeIf(apply -> apply.getUserProfile().getJob() != null);
		
		mv.addObject("listApplicant", listApplicant);
		mv.setViewName("admin/job-applicant");
		
		return mv;
	}
	
	@RequestMapping(value = "/acceptJob", method = RequestMethod.GET)
	public String acceptJob(@RequestParam("id_profile") int id_profile, @RequestParam("id_job") int id_job, @RequestParam("id_apply") int id_apply) {
		adminService.acceptJob(id_profile, id_job, id_apply);
		return "redirect:/manage-job";
	}
	
	@RequestMapping(value = "/declineJob", method = RequestMethod.GET)
	public String declineJob(@RequestParam("id_apply") int id_apply) {
		adminService.declineJob(id_apply);
		return "redirect:/manage-job";
	}
	
	@RequestMapping(value = "/job-edit", method = RequestMethod.GET)
	public ModelAndView editJob(@RequestParam("id") int id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (adminService.getAdmin(session) == null) {
			mv.setViewName("redirect:/admin-login");
			return mv;
		}
		
		Job job = adminService.findJob(id);
		
		mv.addObject("editJob", job);
		mv.setViewName("admin/edit-job");
		
		return mv;
	}
	
	@RequestMapping(value = "/saveJobEdit", method = RequestMethod.POST)
	public String saveEditJob(@ModelAttribute("editJob") Job job) {
		
		adminService.editJob(job);
		
		return "redirect:/manage-job";
	}
	
	
	@RequestMapping(value = "/job-delete", method = RequestMethod.GET)
	public String deleteJob(@RequestParam("id") int id) {
		
		try {
			adminService.deleteJob(id);
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		return "redirect:/manage-job";
	}
}
