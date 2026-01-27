package com.abc.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tb_apply_job")
public class ApplyJob {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_apply_job;
	
	@ManyToOne
	@JoinColumn(name = "id_profile")
	private UserProfile userProfile;
	
	@ManyToOne
	@JoinColumn(name = "id_job")
	private Job job;
	
	private String status;

	public ApplyJob() {
		
	}

	public ApplyJob(UserProfile userProfile, Job job, String status) {
		super();
		this.userProfile = userProfile;
		this.job = job;
		this.status = status;
	}

	public int getId_apply_job() {
		return id_apply_job;
	}

	public void setId_apply_job(int id_apply_job) {
		this.id_apply_job = id_apply_job;
	}

	public UserProfile getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(UserProfile userProfile) {
		this.userProfile = userProfile;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
