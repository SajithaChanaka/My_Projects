package com.abc.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tb_jobs")
public class Job {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_job;
	
	private String job_level;
	private String job_time;
	private String job_name;
	private String job_description;
	private String company_name;
	private String company_image;
	
	public Job() {
		
	}

	public Job(String job_level, String job_time, String job_name, String job_description, String company_name, String company_image) {
		super();
		this.job_level = job_level;
		this.job_time = job_time;
		this.job_name = job_name;
		this.job_description = job_description;
		this.company_name = company_name;
		this.company_image = company_image;
	}

	public int getId_job() {
		return id_job;
	}

	public void setId_job(int id_job) {
		this.id_job = id_job;
	}

	public String getJob_level() {
		return job_level;
	}

	public void setJob_level(String job_level) {
		this.job_level = job_level;
	}

	public String getJob_time() {
		return job_time;
	}

	public void setJob_time(String job_time) {
		this.job_time = job_time;
	}

	public String getJob_name() {
		return job_name;
	}

	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}

	public String getJob_description() {
		return job_description;
	}

	public void setJob_description(String job_description) {
		this.job_description = job_description;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getCompany_image() {
		return company_image;
	}

	public void setCompany_image(String company_image) {
		this.company_image = company_image;
	}
	
}
