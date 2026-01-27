package com.abc.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tb_tags")
public class Tags {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_tag;
	
	private String first_tag;
	private String second_tag;

	public Tags() {
		
	}

	public Tags(String first_tag, String second_tag) {
		super();
		this.first_tag = first_tag;
		this.second_tag = second_tag;
	}

	public int getId_tag() {
		return id_tag;
	}

	public void setId_tag(int id_tag) {
		this.id_tag = id_tag;
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
