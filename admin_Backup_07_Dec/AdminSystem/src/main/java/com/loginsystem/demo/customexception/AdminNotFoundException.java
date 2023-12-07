package com.loginsystem.demo.customexception;

public class AdminNotFoundException extends RuntimeException {
	
	public AdminNotFoundException(String massage){
		
	super(massage)	;
	}
	private static final long serialVersionUID = 1L;

}
