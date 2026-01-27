package com.abc.thread;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abc.dao.CommentRepository;
import com.abc.dao.TagsRepository;
import com.abc.dao.ThreadTagsRepository;
import com.abc.dao.ThreadsRepository;
import com.abc.entity.Comment;
import com.abc.entity.Tags;
import com.abc.entity.ThreadTags;
import com.abc.entity.Threads;
import com.abc.entity.UserProfile;

@Service
@Transactional
public class ThreadService {
	
	@Autowired
	ThreadsRepository threadsRepo;
	
	@Autowired
	ThreadTagsRepository threadTagsRepo;
	
	@Autowired
	CommentRepository commentRepo;
	
	@Autowired
	TagsRepository tagsRepo;
	
	public List<Threads> listThread(){
		List<Threads> listThread = threadsRepo.findAll();
		return listThread;
	}
	
	public List<Threads> listUserThread(int id){
		List<Threads> listThread = threadsRepo.findByIdProfile(id);
		return listThread;
	}
	
	public List<Comment> listComment(int id){
		List<Comment> listComment = commentRepo.findByIdThread(id);
		return listComment;
	}
	
	public List<Tags> listTags(){
		List<Tags> listTags = tagsRepo.findAll();
		return listTags;
	}
	
	public List<Threads> searchThreads(String keyword){
		List<Threads> listThread = threadsRepo.search(keyword);
		return listThread;
	}
	
	public Threads findThreadById(int id) {
		Threads thread = threadsRepo.findById(id).get();
		return thread;
	}
	
	public ThreadTags findTagsById(int id) {
		ThreadTags tags = threadTagsRepo.findById(id).get();
		return tags;
	}
	
	public Threads postThread(UserProfile profile, Threads thread, String tag1, String tag2) {
		
		thread.setProfile(profile);
		ThreadTags tags = new ThreadTags(thread, tag1, tag2);
		thread.setTags(tags);
		
		threadsRepo.save(thread);
		
		return thread;
	}
	
	public Threads editThread(Threads thread) {
		Threads editThread = findThreadById(thread.getId_thread());
		ThreadTags tags = findTagsById(thread.getTags().getId_thread_tag());
		
		editThread.setTitle(thread.getTitle());
		editThread.setContent(thread.getContent());
		
		tags.setFirst_tag(thread.getTags().getFirst_tag());
		tags.setSecond_tag(thread.getTags().getSecond_tag());
		
		editThread.setTags(tags);
		
		threadsRepo.save(editThread);
		
		return editThread;
	}
	
	public void postComment(Comment comment, Threads thread, UserProfile profile) {
		Comment postComment = new Comment();
		
		postComment.setProfile(profile);
		postComment.setThread(thread);
		postComment.setComment(comment.getComment());
		commentRepo.save(postComment);
	}
}
