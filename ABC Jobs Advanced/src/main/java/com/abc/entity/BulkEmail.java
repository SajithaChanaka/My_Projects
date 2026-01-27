package com.abc.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class BulkEmail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_bulk_email;

	private String subject;
	private String content;
	private String[] usersId;

	public BulkEmail() {

	}

	public BulkEmail(String subject, String content, String[] usersId) {
		super();
		this.subject = subject;
		this.content = content;
		this.usersId = usersId;
	}

	public int getId_bulk_email() {
		return id_bulk_email;
	}

	public void setId_bulk_email(int id_bulk_email) {
		this.id_bulk_email = id_bulk_email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String[] getUsersId() {
		return usersId;
	}

	public void setUsersId(String[] usersId) {
		this.usersId = usersId;
	}

}
