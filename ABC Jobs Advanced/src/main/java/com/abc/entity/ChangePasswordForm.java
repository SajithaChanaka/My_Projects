package com.abc.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ChangePasswordForm {
	@Id
	private String oldPassword;

	private String newPassword;

	public ChangePasswordForm() {

	}

	public ChangePasswordForm(String oldPassword, String newPassword) {
		super();
		this.oldPassword = oldPassword;
		this.newPassword = newPassword;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

}
