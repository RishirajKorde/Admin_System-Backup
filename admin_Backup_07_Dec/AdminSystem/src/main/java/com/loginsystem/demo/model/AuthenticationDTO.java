package com.loginsystem.demo.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AuthenticationDTO {
	
	   @JsonProperty("identifier")
	    private String identifier;
	   @JsonProperty("password")
	    private String password;


	    public AuthenticationDTO() {
	        
	    }

	    public AuthenticationDTO(String identifier, String password) {
	        this.identifier = identifier;
	        this.password = password;
	    }

	    public String getIdentifier() {
	        return identifier;
	    }

	    public void setIdentifier(String identifier) {
	        this.identifier = identifier;
	    }

	    public String getPassword() {
	        return password;
	    }

	    public void setPassword(String password) {
	        this.password = password;
	    }
	}



