package com.loginsystem.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;

@Entity
public class QueryStudent {
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private Long id;
	private String content;
	
	

@JoinColumn
 private Long userDetails;


public Long getId() {
	return id;
}


public void setId(Long id) {
	this.id = id;
}


public String getContent() {
	return content;
}


public void setContent(String content) {
	this.content = content;
}


public Long getUserDetails() {
	return userDetails;
}


public void setUserDetails(Long userDetails) {
	this.userDetails = userDetails;
}


public QueryStudent(Long id, String content, Long userDetails) {
	super();
	this.id = id;
	this.content = content;
	this.userDetails = userDetails;
}


public QueryStudent() {
	
}


@Override
public String toString() {
	return "QueryStudent [id=" + id + ", content=" + content + ", userDetails=" + userDetails + "]";
}



}