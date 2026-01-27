package com.abc.thread;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abc.entity.Comment;
import com.abc.entity.Tags;
import com.abc.entity.Threads;
import com.abc.entity.UserProfile;
import com.abc.login.LoginService;

@Controller
public class ThreadController {
	
	@Autowired
	ThreadService threadService;
	
	@Autowired
	LoginService loginService;

	@RequestMapping("/threads")
	public ModelAndView threads() {
		ModelAndView mv = new ModelAndView();
		
		List<Threads> listThread = threadService.listThread();
		
		mv.addObject("listThread", listThread);
		mv.setViewName("thread-list");
		return mv;
	}
	
	//  Search Thread
	@RequestMapping(value = "/thread-search", method = RequestMethod.GET)
	public ModelAndView searchThreads(@RequestParam("keyword") String keyword) {
		ModelAndView mv = new ModelAndView();
		
		if(keyword == null || keyword.equals("")) {
			mv.setViewName("thread-search");
			return mv;
		}
		
		List<Threads> listThread = threadService.searchThreads(keyword);
		
		mv.addObject("searchThread", listThread);
		mv.setViewName("thread-search");
		return mv;
	}
	
	//  Post Thread
	@RequestMapping("/post-thread")
	public ModelAndView postThread(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		UserProfile profile = loginService.getCurrentUser(session);
		Threads thread = new Threads();
		
		if(profile == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		
		List<Tags> tags = threadService.listTags();
		
		mv.addObject("thread", thread);
		mv.addObject("tags", tags);
		mv.setViewName("thread-post");
		
		return mv;
	}
	
	//  Save Post Thread
	@RequestMapping("/postThread")
	public ModelAndView savePostThread(
			HttpSession session,
			@ModelAttribute("thread") Threads thread,
			@RequestParam("tag1") String tag1,
			@RequestParam("tag2") String tag2) {
		
		ModelAndView mv = new ModelAndView();
		UserProfile profile = loginService.getCurrentUser(session);
		List<Tags> tags = threadService.listTags();
		
		if(profile == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		
		mv.addObject("tags", tags);
		
		if(thread.getTitle().equals("")) {
			mv.addObject("messageTitle", "Title is required");
			mv.addObject("error", "error-border");
			mv.setViewName("thread-post");
			return mv;
		} else if (thread.getContent().equals("")) {
			mv.addObject("messageContent", "Content is required");
			mv.addObject("error", "error-border");
			mv.setViewName("thread-post");
			return mv;
		} else if (tag1.equals("")) {
			mv.addObject("messageTag", "First tag is required");
			mv.addObject("error", "error-border");
			mv.setViewName("thread-post");
			return mv;
		}
		
		Threads newThread = threadService.postThread(profile, thread, tag1, tag2);
		
		mv.setViewName("redirect:/thread?id=" + newThread.getId_thread());
		
		return mv;
	}
	
	//  Edit Thread
	@RequestMapping("/edit-thread")
	public ModelAndView editThread(HttpSession session, @RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		UserProfile profile = loginService.getCurrentUser(session);
		List<Tags> tags = threadService.listTags();
		
		if(profile == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		
		mv.addObject("tags", tags);
		
		Threads thread = threadService.findThreadById(id);
		
		mv.addObject("editThread", thread);
		mv.setViewName("thread-edit");
		
		return mv;
	}
	
	//  Save Edit Thread
	@RequestMapping("/editThread")
	public ModelAndView saveEditThread(HttpSession session, @ModelAttribute("editThread") Threads thread) {
		ModelAndView mv = new ModelAndView();
		UserProfile profile = loginService.getCurrentUser(session);
		List<Tags> tags = threadService.listTags();
		
		if(profile == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		
		mv.addObject("tags", tags);
		
		if(thread.getTitle().equals("")) {
			mv.addObject("messageTitle", "Title is required");
			mv.addObject("error", "error-border");
			mv.setViewName("thread-edit");
			return mv;
		} else if (thread.getContent().equals("")) {
			mv.addObject("messageContent", "Content is required");
			mv.addObject("error", "error-border");
			mv.setViewName("thread-edit");
			return mv;
		} else if (thread.getTags().getFirst_tag().equals("")) {
			mv.addObject("messageTag", "First tag is required");
			mv.addObject("error", "error-border");
			mv.setViewName("thread-edit");
			return mv;
		}
		
		threadService.editThread(thread);
		mv.setViewName("redirect:/thread?id=" + thread.getId_thread());
		
		return mv;
	}
	
	//  User Thread
	@RequestMapping("/my-thread")
	public ModelAndView myThread(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		UserProfile profile = loginService.getCurrentUser(session);
		
		if(profile == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		
		List<Threads> listUserThread = threadService.listUserThread(profile.getId_profile());
		List<Tags> tags = threadService.listTags();
		
		mv.addObject("tags", tags);
		mv.addObject("listUserThread", listUserThread);
		mv.setViewName("thread-user");
		return mv;
	}
	
	//  Read Thread
	@RequestMapping("/thread")
	public ModelAndView readThread(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		
		Threads thread = threadService.findThreadById(id);
		Comment comment = new Comment();
		
		if(thread == null) {
			mv.setViewName("redirect:/threads");
			return mv;
		}
		
		List<Comment> listComment = threadService.listComment(id);
		
		mv.addObject("listComment", listComment);
		mv.addObject("thread", thread);
		mv.addObject("threadComment", comment);
		mv.setViewName("thread-read");
		return mv;
	}
	
	// Comment Thread
	@RequestMapping(value = "/postComment", method = RequestMethod.POST)
	public ModelAndView postComment(@ModelAttribute("threadComment") Comment comment, @RequestParam("id") int id, HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		UserProfile profile = loginService.getCurrentUser(session);
		Threads thread = threadService.findThreadById(id);
		
		if(profile == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		
		threadService.postComment(comment, thread, profile);
		
		String referer = request.getHeader("Referer");
		mv.setViewName("redirect:" + referer);
		return mv;
	}
}
