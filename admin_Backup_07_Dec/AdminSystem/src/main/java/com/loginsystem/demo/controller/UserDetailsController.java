/*
 * package com.loginsystem.demo.controller;
 * 
 * import java.util.List;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.http.HttpStatus; import
 * org.springframework.http.ResponseEntity; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.PathVariable; import
 * org.springframework.web.bind.annotation.PostMapping; import
 * org.springframework.web.bind.annotation.PutMapping; import
 * org.springframework.web.bind.annotation.RequestBody; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.bind.annotation.RestController;
 * 
 * import com.loginsystem.demo.customexception.AdminNotFoundException; import
 * com.loginsystem.demo.model.Department; import
 * com.loginsystem.demo.model.UserDetails; import
 * com.loginsystem.demo.service.DepartmentService; import
 * com.loginsystem.demo.service.UserDetailService;
 * 
 * 
 * 
 * @RestController public class UserDetailsController {
 * 
 * @Autowired private UserDetailService userDetailService;
 * 
 * @Autowired private DepartmentService departmentService;
 * 
 * 
 * 
 * 
 * 
 * @GetMapping("/login2") public ResponseEntity<UserDetails>
 * userLogin(@RequestParam String username, @RequestParam String password) {
 * UserDetails user = userDetailService.userLog(username, password);
 * 
 * if (user != null) { return ResponseEntity.ok(user); } else { throw new
 * AdminNotFoundException("Incorrect username or password");
 * 
 * } }
 * 
 * 
 * @PostMapping("/saveAdmin") public UserDetails saveAdmin(@RequestBody
 * UserDetails userDetails) {
 * 
 * 
 * return userDetailService.saveAdmin(userDetails);
 * 
 * }
 * 
 * 
 * @GetMapping("/depa") public List<Department> listDepartments(){ return
 * departmentService.getAllDepartments();
 * 
 * }
 * 
 * @PostMapping("/saveTeacher") public UserDetails registerTeacher(@RequestBody
 * UserDetails userDetails) {
 * 
 * 
 * return userDetailService.registerTeacher(userDetails);
 * 
 * }
 * 
 * @PostMapping("/saveDepartment") public Department saveDepartment(@RequestBody
 * Department department) { return departmentService.saveDepartment(department);
 * 
 * 
 * }
 * 
 * 
 * @PostMapping("/saveStudent") public UserDetails saveStudent(@RequestBody
 * UserDetails userDetails) {
 * 
 * 
 * return userDetailService.saveStudent(userDetails);}
 * 
 * 
 * 
 * @PutMapping("/updatePassword") public ResponseEntity<String>
 * updatePassword(@RequestParam String newPassword) { UserDetails currentUser =
 * userDetailService.getLoggedInUser(); // You need to implement this method
 * 
 * if (currentUser != null && "ROLE_TEACHER".equals(currentUser.getRole())) {
 * 
 * currentUser.setPassword(newPassword);
 * 
 * 
 * return ResponseEntity.ok("Password updated successfully"); } else { return
 * ResponseEntity.status(HttpStatus.FORBIDDEN).body("Access denied"); }
 * 
 * 
 * }
 * 
 * @PostMapping("/verify-student/{studentId}") public UserDetails
 * verifyStudent(@PathVariable Long studentId) { return
 * userDetailService.verifyStudent(studentId); } }
 */