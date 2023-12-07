package com.loginsystem.demo.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.loginsystem.demo.model.UserDetails;
import com.loginsystem.demo.repo.User_DetailsRepo;
import com.loginsystem.demo.util.ProjectsConstants;

@Service
public class UserDetailServiceImpl implements UserDetailService {
	@Autowired
	private User_DetailsRepo user_DetailsRepo;

	public UserDetails saveAdmin(UserDetails userDetails) {
		userDetails.setRole(ProjectsConstants.ROLE_ADMIN);
		user_DetailsRepo.save(userDetails);
		return userDetails;
	}

	@Override
	public UserDetails registerTeacher(UserDetails userDetails) {
		userDetails.setRole(ProjectsConstants.ROLE_TEACHER);

		user_DetailsRepo.save(userDetails);

		return userDetails;

	}

	@Override
	public List<UserDetails> findByRoleEquals2() {
		return user_DetailsRepo.findByRoleEquals2();
	}

	@Override
	public UserDetails updateTeacherPassword(String username, String newPassword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserDetails getLoggedInUser() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserDetails saveStudent(UserDetails userDetails) {
		userDetails.setRole(ProjectsConstants.ROLE_STUDENT);
		user_DetailsRepo.save(userDetails);
		return userDetails;
	}

	@Transactional
	@Override
	public UserDetails verifyStudent(Long studentId) {
		UserDetails student = user_DetailsRepo.findById(studentId).orElse(null);
		// if (student != null && "STUDENT_ROLE".equals(student.getRole())) {
		student.setStatus(true);
		// student.setVerifyingTeacher(verifyingTeacher);
		user_DetailsRepo.save(student);
		return student;
		// }
		// return null;
	}

	/*
	 * @Override public String authenticate(String username, String password) {
	 * 
	 * UserDetails user = user_DetailsRepo.findByUsername(username);
	 * 
	 * System.out.println(user); if (user != null &&
	 * password.equals(user.getPassword())) { return user.getRole(); } else { return
	 * null; } }
	 */

	@Override
	public List<UserDetails> getStudentListByTeacherDepartment(String teacherDepartment) {
		// TODO Auto-generated method stub
		return user_DetailsRepo.findByDepartmentAndRole(teacherDepartment, ProjectsConstants.ROLE_STUDENT);
	}

	@Override
	public String getDepartmentByUsername(String username) {
		UserDetails user = user_DetailsRepo.findByEmailOrMobNo(username);

		if (user != null) {
			return user.getDepartment();
		} else {

			return null;
		}
	}

	@Override
	public List<UserDetails> getStudentsByDepartment(String department) {
		List<UserDetails> students = user_DetailsRepo.findByDepartmentAndRole(department, "3");

		System.out.println(students);
		List<UserDetails> studentList = new ArrayList<>();
		for (UserDetails student : students) {

			studentList.add(new UserDetails(student.getFull_name(), student.getEmail(), false, department,
					student.getId(), department, department, department, department));
			System.out.println(student);
		}

		return studentList;
	}

	@Override
	public UserDetails updateStudentProfile(Long id, UserDetails updatedStudentDetails) {
		UserDetails existingStudent = getStudentById(id);

		if (existingStudent != null && existingStudent.isStatus()) {
			// Update existingStudent with values from updatedStudentDetails
			existingStudent.setFull_name(updatedStudentDetails.getFull_name());
			existingStudent.setMobNo(updatedStudentDetails.getMobNo());
			existingStudent.setEmail(updatedStudentDetails.getEmail());
			existingStudent.setPassword(updatedStudentDetails.getPassword());
			//existingStudent.setStatus(updatedStudentDetails.isStatus());
			
			
			existingStudent.setUsername(updatedStudentDetails.getUsername());
			//existingStudent.setRole(updatedStudentDetails.getRole());
			existingStudent.setDepartment(updatedStudentDetails.getDepartment());
		
			
			
			UserDetails updatedStudent = user_DetailsRepo.save(existingStudent);

			System.out.println(updatedStudent);

			return updatedStudent;
		} else {
			return null;
		}
	}
	
	@Override
    public String authenticate(String identifier, String password) {
		UserDetails user = user_DetailsRepo.findByEmailOrMobNo(identifier);
		
		System.out.println(identifier);
		System.out.println(password);
		System.out.println(user);
       // UserDetails user = user_DetailsRepo.findByEmailOrMobNo(identifier, identifier);
System.out.println(user.getPassword());
     //   System.out.println(user);
        if (user!=null && password.equals(user.getPassword())) {
        	   System.out.println(user.getRole());
            return user.getRole();
         
        } else {
            return null;
        }
    }

	@Override
	public UserDetails getStudentById(Long id) {

		return user_DetailsRepo.findById(id).get();
	}

	@Override
	public UserDetails getUserDetailsByUsername(String identifier) {
		// TODO Auto-generated method stub
		return user_DetailsRepo.findByUsername(identifier);
	}

	@Override
	public UserDetails getUserIdByUsername(String username) {
	
		return user_DetailsRepo.findByUsername(username);
	}
	

}
