package com.abc.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tb_thread_tags")
public class ThreadTags {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_thread_tag;
	
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "id_thread")
	private Threads threads;
	
	private String first_tag;
	private String second_tag;

	public ThreadTags() {
		
	}
	
	public ThreadTags(Threads threads, String first_tag, String second_tag) {
		super();
		this.threads = threads;
		this.first_tag = first_tag;
		this.second_tag = second_tag;
	}

	public int getId_thread_tag() {
		return id_thread_tag;
	}

	public void setId_thread_tag(int id_thread_tag) {
		this.id_thread_tag = id_thread_tag;
	}

	public Threads getThread() {
		return threads;
	}

	public void setThread(Threads threads) {
		this.threads = threads;
	}

	public String getFirst_tag() {
		return first_tag;
	}

	public void setFirst_tag(String first_tag) {
		this.first_tag = first_tag;
	}

	public String getSecond_tag() {
		return second_tag;
	}

	public void setSecond_tag(String second_tag) {
		this.second_tag = second_tag;
	}
	
}
