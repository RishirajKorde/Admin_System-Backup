package com.loginsystem.demo.service;

import java.util.List;

import com.loginsystem.demo.model.Department;

public interface DepartmentService {
	
	public Department saveDepartment(Department department);

	public List<Department> getAllDepartments();

	public Department updateDepartment(Department department);

	public Department getDepartmnetById(Long id);

	public void deleteById(Long id);

	Department updateDepartmentName(Long id, String newName);


}
