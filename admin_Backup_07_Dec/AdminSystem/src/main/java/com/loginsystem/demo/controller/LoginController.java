package com.loginsystem.demo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.loginsystem.demo.model.Department;
import com.loginsystem.demo.model.QueryStudent;
import com.loginsystem.demo.model.UserDetails;
import com.loginsystem.demo.repo.User_DetailsRepo;
import com.loginsystem.demo.service.DepartmentService;
import com.loginsystem.demo.service.QueryService;
import com.loginsystem.demo.service.UserDetailService;

@Controller
public class LoginController {
	@Autowired
	private UserDetailService userDetailService;
	@Autowired
	private DepartmentService departmentService;

	@Autowired
	private QueryService queryService;
	@Autowired
	private User_DetailsRepo user_DetailsRepo;

	@GetMapping("/login")
	public String loginPage() {
		return "login";
	}

	@PostMapping("/login")
	public String login(@ModelAttribute UserDetails user,@RequestParam("identifier") String identifier,
            @RequestParam("password") String password,
            HttpSession session) {
		UserDetails user1 = user_DetailsRepo.findByEmailOrMobNo(identifier);
		String role = userDetailService.authenticate(identifier,password);
		System.out.println(role);
		System.out.println(user1);

		if ("1".equals(role)) {
			return "redirect:/dashboard";
		} else if ("3".equals(role)) {
			session.setAttribute("username", user1.getUsername());
			UserDetails userDetails = user_DetailsRepo.findByEmailOrMobNo(identifier);
			session.setAttribute("userDetails", userDetails);
			System.out.println(userDetails);
			System.out.println(user1.getUsername());
			session.setAttribute("full_name", user1.getFull_name());
			session.setAttribute("username", user1.getUsername());
			session.setAttribute("email", user1.getEmail());
			session.setAttribute("mobNo", user1.getMobNo());
			session.setAttribute("mobNo", user1.getMobNo());

			System.out.println("User Details: " + userDetails); // Add this line for debugging
			session.setAttribute("userDetails", userDetails);
			session.setAttribute("student", userDetails);
			return "redirect:/dashboardStudent";
		} else if ("2".equals(role)) {

			String department = userDetailService.getDepartmentByUsername(user1.getEmail());
			System.out.println(department);
			session.setAttribute("department", department);
			session.setAttribute("username", user1.getUsername());

			if ("2".equals(role)) {
				List<UserDetails> studentsInSameDepartment = userDetailService.getStudentsByDepartment(department);
				session.setAttribute("studentsInSameDepartment", studentsInSameDepartment);
				System.out.println(studentsInSameDepartment);
			}
			return "redirect:/dashboardTeacher";

		} else {
			return "redirect:/login?error";
		}

	}

	@GetMapping("/dashboardStudent")
	public String studentDashboard() {
		return "studentDash";
	}

	@GetMapping("/dashboardTeacher")
	public String teacherDashboard() {
		return "teacherDash";
	}

	@GetMapping("/studentRegister")
	public String studentRegister(Model model) {
		List<Department> departments = departmentService.getAllDepartments();
		model.addAttribute("departments", departments);

		return "studentRegister";
	}

	@PostMapping("/registerTeacher")
	public String registerTeacher(@ModelAttribute("userDetails") UserDetails userDetails, Model model) {
		UserDetails userDetail = userDetailService.registerTeacher(userDetails);
		model.addAttribute("userDetail", userDetail);
		return "redirect:/teacherReg";
	}

	@GetMapping("/dashboard")
	public String adminPage(Model model) {

		return "dashboard";
	}

	@GetMapping("/teacherReg")
	public String teacherRegPage(Model model) {
		List<Department> departments = departmentService.getAllDepartments();
		List<UserDetails> teachers = userDetailService.findByRoleEquals2();
		model.addAttribute("teachers", teachers);
		model.addAttribute("departments", departments);

		return "teacherReg";
	}

	@GetMapping("/getTeacher")
	public String teacherPage(Model model) {
		List<UserDetails> teachers = userDetailService.findByRoleEquals2();
		model.addAttribute("teachers", teachers);
		return "teacherReg";
	}

	@GetMapping("/department")
	public String listDepartments(Model model) {
		List<Department> departments = departmentService.getAllDepartments();
		System.out.println(departments.toArray());
		model.addAttribute("departments", departments);
	
		return "department"; 
	}

	@PostMapping("/addDepartment")
	public String addDepartment(@RequestParam("departmentName") String departmentName) {
		Department department = new Department();
		department.setName(departmentName);
		departmentService.saveDepartment(department);

		return "redirect:/department";
	}

	@DeleteMapping("/deleteDepartment/{id}")
	public String deleteById(@PathVariable Long id, Model model) {
		departmentService.deleteById(id);

		List<Department> departments = departmentService.getAllDepartments();
		model.addAttribute("departments", departments);

		return "redirect:/department";

	}

	@PostMapping("/saveStudent")
	public String saveStudent(@ModelAttribute("userDetails") UserDetails userDetails, Model model) {
		UserDetails userDetail = userDetailService.saveStudent(userDetails);
		model.addAttribute("userDetail", userDetail);
		return "login";
	}

	@PutMapping("/edit/{id}")
	public String updateDepartment(@PathVariable("id") Long id, @RequestBody Map<String, String> requestBody) {
		String name = requestBody.get("name");

		Department department = departmentService.getDepartmnetById(id);

		department.setName(name);
		departmentService.updateDepartmentName(id, name);

		return "redirect:/department";
	}

	@Controller
	public class LogoutController {
		@GetMapping("/logout")
		public String logout() {
			
			return "redirect:/login";
		}
	}
	@GetMapping("/getQuery")
	public List<QueryStudent> getAllQueries(){
		return queryService.getAllQueries();
		
	}
	
	@GetMapping("/teacherDash")
	public String getStudentList(@RequestParam String department, Model model) {
		List<UserDetails> students = userDetailService.getStudentListByTeacherDepartment(department);
		System.out.println(department);
		System.out.println(students);
		model.addAttribute("studentsInSameDepartment", students);
		// model.addAttribute("department", department);
		// model.addAttribute("department", department); // Add this line
		return "teacherDash";
	}

	@PostMapping("/verify-student/{studentId}")
	public String verifyStudent(@PathVariable Long studentId, Model model) {
		UserDetails userDetails = userDetailService.verifyStudent(studentId);

		model.addAttribute("userDetails", userDetails);

		// Return the name of the view/page you want to render
		return "teacherDash"; // Update "yourViewName" with the actual name of your view/page
	}

	@PostMapping("/updateStudent/{id}")
	public String updateStudentProfile(@PathVariable Long id, @RequestBody UserDetails updatedStudentDetails,
			Model model) {
		UserDetails updatedStudent = userDetailService.updateStudentProfile(id, updatedStudentDetails);
		System.out.println("the updated details issss " + updatedStudent);
		UserDetails existingStudent= userDetailService.getStudentById(id);
		if (updatedStudent != null && existingStudent.isStatus() ) {
			model.addAttribute("updatedStudentDetails", updatedStudent);
			return "redirect:/dashboardStudent";
		} else {
			return "error";
		}
	}

	/*
	 * @PutMapping("/updateStudent/{id}") public Object
	 * updateStudentProfile(@PathVariable Long id,
	 * 
	 * @RequestBody UserDetails updatedStudentDetails) { UserDetails updatedDetails
	 * = userDetailService.updateStudentProfile(id, updatedStudentDetails);
	 * System.out.println(updatedDetails); if (updatedDetails != null) { return
	 * "redirect:/dashboardStudent"; } else { return
	 * ResponseEntity.status(HttpStatus.NOT_FOUND).
	 * body("Student not found or not verified"); } }
	 */

	
	  @PostMapping("/student/postQuery") public String
	  postQuery(@RequestParam("query") String query, @RequestParam("username")
	  String username) {
	  
	  UserDetails userId = userDetailService.getUserIdByUsername(username);
	  
	  System.out.println(userId); //UserDetails existingStudent=
	 // userDetailService.getStudentById(id); 
	  Long id = userId.getId();
	  
	  if (userId != null && userId.isStatus()) {
	  
	  System.out.println(id); QueryStudent newQuery = new QueryStudent();
	  newQuery.setContent(query);
	  
	  newQuery.setUserDetails(id); queryService.createQuery(newQuery);
	  
	  return "redirect:/dashboardStudent"; } else {
	  
	  return "redirect:/error"; } }
	 

	
	
	@GetMapping("/getContent/{userDetails}")
	public ResponseEntity<List<String>> getContentByUserDetails(@PathVariable Long userDetails) {
		List<String> content=  queryService.getContentByUserDetails(userDetails);
		return ResponseEntity.ok(content);
		
	}
}
