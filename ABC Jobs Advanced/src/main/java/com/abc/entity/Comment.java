package com.abc.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tb_comment")
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_comment;
	
	@ManyToOne
	@JoinColumn(name = "id_thread")
	private Threads threads;
	
	@ManyToOne
	@JoinColumn(name = "id_profile")
	private UserProfile profile;
	
	private String comment;

	public Comment() {
		
	}

	public Comment(Threads threads, UserProfile profile, String comment) {
		super();
		this.threads = threads;
		this.profile = profile;
		this.comment = comment;
	}

	public int getId_comment() {
		return id_comment;
	}

	public void setId_comment(int id_comment) {
		this.id_comment = id_comment;
	}

	public Threads getThread() {
		return threads;
	}

	public void setThread(Threads threads) {
		this.threads = threads;
	}

	public UserProfile getProfile() {
		return profile;
	}

	public void setProfile(UserProfile profile) {
		this.profile = profile;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
}
