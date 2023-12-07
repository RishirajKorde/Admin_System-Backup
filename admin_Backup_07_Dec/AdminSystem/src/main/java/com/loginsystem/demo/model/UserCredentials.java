/*
 * package com.loginsystem.demo.model;
 * 
 * import javax.persistence.CascadeType; import javax.persistence.Entity; import
 * javax.persistence.GeneratedValue; import javax.persistence.GenerationType;
 * import javax.persistence.Id; import javax.persistence.JoinColumn; import
 * javax.persistence.OneToOne; import javax.persistence.Table;
 * 
 * @Entity
 * 
 * @Table(name = "user_credentials") public class UserCredentials {
 * 
 * @Id
 * 
 * @GeneratedValue(strategy = GenerationType.IDENTITY) private Long id; private
 * String username; private String password;
 * 
 * @OneToOne(cascade=CascadeType.ALL)
 * 
 * @JoinColumn(name = "user_id") private UserDetails userDetails;
 * 
 * public Long getId() { return id; }
 * 
 * public void setId(Long id) { this.id = id; }
 * 
 * public String getUsername() { return username; }
 * 
 * public void setUsername(String username) { this.username = username; }
 * 
 * public String getPassword() { return password; }
 * 
 * public void setPassword(String password) { this.password = password; }
 * 
 * public UserDetails getUserDetails() { return userDetails; }
 * 
 * public void setUserDetails(UserDetails userDetails) { this.userDetails =
 * userDetails; }
 * 
 * public UserCredentials(Long id, String username, String password, UserDetails
 * userDetails) { super(); this.id = id; this.username = username; this.password
 * = password; this.userDetails = userDetails; }
 * 
 * 
 * }
 */