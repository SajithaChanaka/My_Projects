package com.abc.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class SearchForm {
	@Id
	private String keyword;

	public SearchForm() {

	}

	public SearchForm(String keyword) {
		super();
		this.keyword = keyword;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
