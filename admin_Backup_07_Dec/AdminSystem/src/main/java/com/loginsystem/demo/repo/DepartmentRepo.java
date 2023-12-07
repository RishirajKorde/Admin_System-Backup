package com.loginsystem.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.loginsystem.demo.model.Department;

public interface DepartmentRepo extends JpaRepository<Department,Long >{

	//Department save(Department department);

}
