<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedback Form</title>
<!-- Include Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<form method="post"
				action="<%=request.getContextPath()%>/saveStudent">
				<div class="mb-3">
					<label for="department" class="form-label">Select
						Department</label> <select class="form-select" id="department"
						name="department">
						<option value="Select Department">Please Select
							Department</option>

						<c:forEach var="dept" items="${departments}">
							<option value="${dept.name}">${dept.name}</option>
						</c:forEach>

					</select>
				</div>

				<div class="form-group">
					<label for="full_name">Full Name</label> <input type="text"
						class="form-control" id="full_name" name="full_name" required>
				</div>

				<div class="form-group">
					<label for="email">Email:</label> <input type="email"
						class="form-control" id="email" name="email" required>
				</div>

				<div class="form-group">
					<label for="username">Username</label> <input type="text"
						class="form-control" id="username" name="username" required>
				</div>
				<div class="form-group">
					<label for="password">Password</label> <input type="password"
						class="form-control" id="password" name="password" required>
				</div>
				<div class="form-group">
					<label for="address">Address</label> <input type="text"
						class="form-control" id="address" name="address" required>
				</div>
				<div class="form-group">
					<label for="contact">Contact No</label> <input type="text"
						class="form-control" id="mobNo" name="mobNo" required>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>


</body>
</html>
