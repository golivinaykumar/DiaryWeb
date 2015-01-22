package com.ebase.pojo;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

public class Post {
	
	String title;
	String description;
	String feelings;
	Timestamp postedDate;
	long countId;
	User user;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public long getCountId() {
		return countId;
	}
	public void setCountId(long countId) {
		this.countId = countId;
	}
	public Timestamp getPostedDate() {
		return postedDate;
	}
	public void setPostedDate(Timestamp postedDate) {
		this.postedDate = postedDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFeelings() {
		return feelings;
	}
	public void setFeelings(String feelings) {
		this.feelings = feelings;
	}
	
	


}
