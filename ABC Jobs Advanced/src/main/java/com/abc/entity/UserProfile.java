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
@Table(name = "tb_user_profile")
public class UserProfile {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_profile;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "id_user")
	private User user;

	private String first_name;
	private String last_name;
	private String country;
	private String city;
	private String picture;
	private String about;

	@ManyToOne
	@JoinColumn(name = "id_job")
	private Job job;

	public UserProfile() {

	}

	public UserProfile(User user, String first_name, String last_name, String country, 
			String city, Job job, String picture, String about) {
		super();
		this.user = user;
		this.first_name = first_name;
		this.last_name = last_name;
		this.country = country;
		this.city = city;
		this.job = job;
		this.picture = picture;
		this.about = about;
	}

	public int getId_profile() {
		return id_profile;
	}

	public void setId_profile(int id_profile) {
		this.id_profile = id_profile;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}
	
}
