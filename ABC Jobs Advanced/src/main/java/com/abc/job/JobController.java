package com.abc.job;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abc.entity.ApplyJob;
import com.abc.entity.Job;
import com.abc.entity.UserProfile;
import com.abc.login.LoginService;

@Controller
public class JobController {

	@Autowired
	JobService jobService;
	
	@Autowired
	LoginService loginService;
	
	@RequestMapping("/jobs")
	public ModelAndView jobs(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		UserProfile user = loginService.getCurrentUser(session);
		
		List<Job> listJob = jobService.listJob();
		List<ApplyJob> listApply = jobService.listApplyJob();
		
		if (user != null) {
			mv.addObject("user", user);
			if(user.getJob() == null) {
				for(ApplyJob apply : listApply) {
					int id_applyJob = apply.getJob().getId_job();
					int id_applyProfile = apply.getUserProfile().getId_profile();
					
					listJob.removeIf(job -> id_applyJob == job.getId_job() && id_applyProfile  == user.getId_profile());
				}
			}
		}
		
		mv.addObject("listJob", listJob);
		mv.setViewName("jobs");
		
		return mv;
	}
	
	// Jobs Search
	@RequestMapping("/jobs-search")
	public ModelAndView searchJobs(HttpSession session, @RequestParam("keyword") String keyword) {
		ModelAndView mv = new ModelAndView();
		UserProfile user = loginService.getCurrentUser(session);
		List<Job> listJob = jobService.searchJob(keyword);
		List<ApplyJob> listApply = jobService.listApplyJob();
		
		if (user != null) {
			mv.addObject("user", user);
			if(user.getJob() == null) {
				for(ApplyJob apply : listApply) {
					int id_applyJob = apply.getJob().getId_job();
					int id_applyProfile = apply.getUserProfile().getId_profile();
					
					listJob.removeIf(job -> id_applyJob == job.getId_job() && id_applyProfile  == user.getId_profile());
				}
			}
		} 
		
		if(keyword == null || keyword.equals("")) {
			mv.setViewName("jobs-search");
			return mv;
		}
		
		mv.addObject("searchJob", listJob);
		
		mv.setViewName("jobs-search");
		
		return mv;
	}
	
	// Apply Job
	@RequestMapping("/apply-job")
	public ModelAndView listApplyJob(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		UserProfile user = loginService.getCurrentUser(session);
		
		if (user == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		
		List<ApplyJob> listApply = jobService.listApplyJob();
		List<ApplyJob> userApply = new ArrayList<>();
		
		for(ApplyJob apply : listApply) {
			if(apply.getUserProfile().getId_profile() == user.getId_profile()) {
				userApply.add(apply);
			}
		}
		
		if(user.getJob() != null) {
			userApply.removeIf(apply -> apply.getStatus().equals("PENDING"));
		}
		
		mv.addObject("listApply", userApply);
		mv.setViewName("apply-job");
		
		return mv;
	}
	
	@RequestMapping(value = "/applyJob", method = RequestMethod.GET)
	public ModelAndView applyJob(@RequestParam("id_job") int id_job, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		UserProfile user = loginService.getCurrentUser(session);
		
		if (user == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		
		Job job = jobService.findJob(id_job);
		
		jobService.applyJob(user, job);
		
		mv.setViewName("redirect:/apply-job");
		return mv;
	}
	
	@RequestMapping("/my-job")
	public ModelAndView myJob(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		UserProfile user = loginService.getCurrentUser(session);
		
		if (user == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}

		mv.addObject("user", user);
		mv.setViewName("my-job");
		
		return mv;
	}
}
