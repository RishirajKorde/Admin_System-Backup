package com.loginsystem.demo.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.loginsystem.demo.model.UserDetails;

public interface User_DetailsRepo extends JpaRepository<UserDetails, Long> {

	public UserDetails findByUsername(String username);

	@Query("SELECT u FROM UserDetails u WHERE u.role = 2")
	List<UserDetails> findByRoleEquals2();

	public List<UserDetails> findByDepartmentAndRole(String teacherDepartment, String roleStudent);

	 
	@Query("SELECT u FROM UserDetails u WHERE u.email = :identifier OR u.mobNo = :identifier")
	UserDetails findByEmailOrMobNo(@Param("identifier") String identifier);
	

}
