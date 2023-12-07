package com.loginsystem.demo.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.loginsystem.demo.model.QueryStudent;

public interface QueryRepo extends CrudRepository<QueryStudent, Long>{

	List<QueryStudent> findContentByUserDetails(Long userDetails);

}
