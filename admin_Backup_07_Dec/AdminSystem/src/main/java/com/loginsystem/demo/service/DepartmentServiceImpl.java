package com.loginsystem.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.loginsystem.demo.model.Department;
import com.loginsystem.demo.repo.DepartmentRepo;

@Service
public class DepartmentServiceImpl  implements DepartmentService{
	
	
	@Autowired
	private DepartmentRepo departmentRepo;

	@Override
	public Department saveDepartment(Department department) {
		// TODO Auto-generated method stub
		return departmentRepo.save(department);
	}

	@Override
	public List<Department> getAllDepartments() {
		// TODO Auto-generated method stub
		return departmentRepo.findAll();
	}
	
	@Override
	public Department getDepartmnetById(Long id) {
		return departmentRepo.findById(id).get();
	}

	@Override
	public Department updateDepartment(Department department) {
		return departmentRepo.save(department);
	}
	@Override
	public void deleteById(Long id) {
		
		departmentRepo.deleteById(id);
	}
	
	@Override
	public Department updateDepartmentName(Long id, String newName) {
		
	      Department existingDepartment = departmentRepo.findById(id).orElse(null);
	   
	            existingDepartment.setName(newName);
	            return departmentRepo.save(existingDepartment);
	        
	        
	    }

}
