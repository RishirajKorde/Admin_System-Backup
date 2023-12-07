<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Teacher Registration</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
}

h1 {
	background-color: #007BFF;
	color: #fff;
	padding: 20px;
	text-align: center;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
}

.registration-container {
	float: left;
	width: 50%;
}

.teacher-list-container {
	float: right;
	width: 50%;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 10px;
	text-align: center;
}

th {
	background-color: #007BFF;
	color: #fff;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

.add-button {
	background-color: #007BFF;
	color: #fff;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
}

.action-button {
	padding: 5px 10px;
	background-color: #007BFF;
	color: #fff;
	border: none;
	cursor: pointer;
}

.edit {
	background-color: #28a745;
}

.delete {
	background-color: #dc3545;
}

#addDepartmentForm {
	margin-top: 20px;
	display: none;
}

label {
	display: block;
	margin-bottom: 5px;
}

input[type="text"], input[type="email"], input[type="tel"], input[type="password"]
	{
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
}

button[type="submit"] {
	background-color: #007BFF;
	color: #fff;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="container">
		<div class="registration-container">
			<h2>Teacher Registration</h2>
			<form method="post"
				action="<%=request.getContextPath()%>/registerTeacher">
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
					<label for="full_name">Full Name:</label> <input type="text"
						class="form-control" id="full_name" name="full_name" required>
				</div>
				<div class="form-group">
					<label for="email">Email:</label> <input type="email"
						class="form-control" id="email" name="email" required>
				</div>
				<div class="form-group">
					<label for="mobNo">Mobile No:</label> <input type="tel"
						class="form-control" id="mobNo" name="mobNo" required>
				</div>
				<div class="form-group">
					<label for="username">username:</label> <input type="text"
						class="form-control" id="username" name="username" required>
				</div>
				<div class="form-group">
					<label for="password">Password:</label> <input type="password"
						class="form-control" id="password" name="password" required>
				</div>
				<button type="submit" class="btn btn-primary btn-block">Register</button>
			</form>
		</div>

		<div class="teacher-list-container">
			<h2>Teacher List</h2>
			<table class="table table-striped mt-3">
				<thead>
					<tr>
						<th>ID</th>
						<th>Teacher Name</th>
						<th>Department Name</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${teachers}" var="teacher">

						<tr data-id="${teacher.id}">
							<td><c:out value="${teacher.id}" /></td>
							<td><c:out value="${teacher.full_name}" /></td>
							<td><c:out value="${teacher.department}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>


</body>
</html>
