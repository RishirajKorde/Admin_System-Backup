package com.loginsystem.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class UserDetails {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	
	private String full_name;
	private String email;
	private String mobNo;
	
	private String role;
	
	private boolean status;
	
	private String department;
	
	private String username;
	
	private String password;
	
	
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	/*
	 * public String getFullName() { return fullName; }
	 * 
	 * public void setFullName(String fullName) { this.fullName = fullName; }
	 */

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobNo() {
		return mobNo;
	}

	public void setMobNo(String mobNo) {
		this.mobNo = mobNo;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public UserDetails(String full_name, String email, boolean status, String department, Long id, String password, String username, String mobNo, String role) {
		super();
		this.id = id;
		this.full_name = full_name;
		this.email = email;
		this.mobNo = mobNo;
		this.role = role;
		this.status = status;
		this.department = department;
		this.username=username;
		this.password=password;
	}

	public UserDetails() {
		super();
	}

	public void UserDetails1(String username2, String department2) {
		// TODO Auto-generated constructor stub
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "UserDetails [id=" + id + ", full_name=" + full_name + ", email=" + email + ", mobNo=" + mobNo
				+ ", role=" + role + ", status=" + status + ", department=" + department + ", username=" + username
				+ ", password=" + password + "]";
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFull_name() {
		return full_name;
	}

	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}

	

	
	
	
}

