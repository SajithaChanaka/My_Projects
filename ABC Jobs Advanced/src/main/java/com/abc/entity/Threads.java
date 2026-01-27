package com.abc.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tb_thread")
public class Threads {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_thread;
	
	@ManyToOne
	@JoinColumn(name = "id_profile")
	private UserProfile profile;
	
	private String title;
	private String content;
	
	@OneToOne(cascade = CascadeType.ALL, mappedBy = "threads")
	private ThreadTags tags;
	
	public Threads() {
		
	}
	
	public Threads(UserProfile profile, String title, String content, ThreadTags tags) {
		super();
		this.profile = profile;
		this.title = title;
		this.content = content;
		this.tags = tags;
	}

	public int getId_thread() {
		return id_thread;
	}

	public void setId_thread(int id_thread) {
		this.id_thread = id_thread;
	}

	public UserProfile getProfile() {
		return profile;
	}

	public void setProfile(UserProfile profile) {
		this.profile = profile;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public ThreadTags getTags() {
		return tags;
	}

	public void setTags(ThreadTags tags) {
		this.tags = tags;
	}
	
}
