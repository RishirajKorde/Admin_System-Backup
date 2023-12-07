package com.loginsystem.demo.service;

import java.util.List;

import com.loginsystem.demo.model.UserDetails;

public interface UserDetailService {

	public UserDetails saveAdmin(UserDetails userDetails);

	public UserDetails registerTeacher(UserDetails userDetails);

	public UserDetails updateTeacherPassword(String username, String newPassword);

	public UserDetails getLoggedInUser();

	public UserDetails saveStudent(UserDetails userDetails);

	public UserDetails verifyStudent(Long studentId);

	public List<UserDetails> findByRoleEquals2();

	public String authenticate(String emailormobNo, String password);

	public List<UserDetails> getStudentListByTeacherDepartment(String teacherDepartment);

//	public List<UserDetails> findByDepartmentAndRole(String teacherDepartment, String roleStudent);

	public List<UserDetails> getStudentsByDepartment(String department);

	public String getDepartmentByUsername(String username);

	public UserDetails updateStudentProfile(Long id, UserDetails updatedStudentDetails);

//public	UserDetails updateStudentProfile(Long id, UserDetails updatedStudentDetails);
public UserDetails getStudentById(Long id);
	// public List<UserDetails> findByDepartmentAndRole(String teacherDepartment,
	// String roleStudent);

public UserDetails getUserDetailsByUsername(String username);

public UserDetails getUserIdByUsername(String username);



}
