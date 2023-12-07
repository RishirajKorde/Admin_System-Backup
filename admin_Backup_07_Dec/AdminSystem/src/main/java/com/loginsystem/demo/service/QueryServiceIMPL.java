package com.loginsystem.demo.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.loginsystem.demo.model.QueryStudent;
import com.loginsystem.demo.model.UserDetails;
import com.loginsystem.demo.repo.QueryRepo;
import com.loginsystem.demo.repo.User_DetailsRepo;


@Service
public class QueryServiceIMPL implements QueryService {
    @Autowired
    private QueryRepo queryRepo;
    
    @Autowired
	private User_DetailsRepo user_DetailsRepo;

	
	  @Override public QueryStudent createQuery(QueryStudent queryStudent) { return
	  queryRepo.save(queryStudent);
	  
	  
	  

	 
	 
}


	@Override
	public List<String> getContentByUserDetails(Long userDetails) {
		  List<QueryStudent> students = queryRepo.findContentByUserDetails(userDetails);
		  System.out.println(students);
	        return (List<String>) students.stream()
	                .map(QueryStudent::getContent)
	                .collect(Collectors.toList());
	}


	@Override
	public List<QueryStudent> getAllQueries() {
		// TODO Auto-generated method stub
		return (List<QueryStudent>) queryRepo.findAll();
	}

}