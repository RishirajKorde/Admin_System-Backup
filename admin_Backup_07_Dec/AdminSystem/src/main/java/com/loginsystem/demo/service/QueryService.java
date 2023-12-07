package com.loginsystem.demo.service;

import java.util.List;

import com.loginsystem.demo.model.QueryStudent;

public interface QueryService  {

	
	
	
	  public QueryStudent createQuery(QueryStudent queryStudent);
	  
	  public List<String> getContentByUserDetails(Long userDetails);
	  
	  public List<QueryStudent> getAllQueries();

		

}