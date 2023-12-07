<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<title>Department List</title>
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
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
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

input[type="text"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
}

button[type="button"] {
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
		<h1 class="mt-3">Department List</h1>
		<form action="addDepartment" method="post">
			<div class="form-group mt-3">
				<label for="departmentName">Department Name:</label> <input
					type="text" id="departmentName" name="departmentName"
					class="form-control" required>
			</div>
			<button type="submit" class="btn btn-primary mt-3">Add
				Department</button>
		</form>

		<table class="table table-striped mt-3">
			<thead>
				<tr>
					<th>ID</th>
					<th>Department Name</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${departments}" var="department">
					<tr data-id="${department.id}">
						<td><c:out value="${department.id}" /></td>
						<td><c:out value="${department.name}" /></td>
						<td>
							<button class="btn btn-success getdept" data-toggle="modal"
								data-target="#editModal" data-id="${department.id}"
								data-name="${department.name}">Edit</button> <a href="#"
							class="btn btn-danger delete-department"
							data-id="${department.id}" data-name="${department.name}">Delete</a>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>



	<!-- Edit Department Modal -->

	<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
		aria-labelledby="editModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editModalLabel">Edit Department</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>


				<form id="geteditdept" action="edit" method="POST">
					<div class="modal-body">
						<input type="hidden" name="id" id="editDepartmentId">
						<div class="form-group">
							<label for="editedDepartmentName">New Department Name:</label> <input
								type="text" id="editedDepartmentName" name="name"
								class="form-control">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Save
							Changes</button>
					</div>
				</form>
			</div>
		</div>
	</div>




	<!-- 
<!-- Add Department Form (hidden) -->
	<form id="addDepartmentForm" style="display: none;">
		<label for="departmentName">Department Name:</label> <input
			type="text" id="departmentName" name="departmentName">
		<button type="button" onclick="addDepartment()">Submit</button>
	</form>
	-->





	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script>
		$(document).ready(function() {
			$(".getdept").click(function() {
				var ID = $(this).data('id');
				var name = $(this).data('name');
				$("#editedDepartmentName").val(name);
				$("#editDepartmentId").val(ID);
				var url = '/edit/' + ID;
				$('#geteditdept').attr('action', url);
				/*$("#s" + ID).hide();
				$("#num" + ID).show();
				$("#22").show();*/
			});
		});
	</script>
	<script>
		$(document)
				.ready(
						function() {
							$(".delete-department")
									.click(
											function() {
												var departmentId = $(this)
														.data('id');
												var departmentName = $(this)
														.data('name');

												var isConfirmed = confirm("Do you want to delete the department: "
														+ departmentName + "?");

												if (isConfirmed) {
													var url = "deleteDepartment/"
															+ departmentId;
													$
															.ajax({
																url : url,
																type : 'DELETE',
																success : function(
																		result) {
																	// Remove the deleted department from the UI
																	//$("tr[data-id='" + departmentId + "']").remove();
																	alert('asdfgh');
																	window.location.href = "/department"; // Redirect to the department page

																	//location.reload();
																},
																error : function(
																		err) {
																	// Handle error, if needed
																}
															});
												}

												return false; // Prevent the default behavior of the link
											});
						});

		/* 	
			success: function(result) {
			    // Remove the deleted department from the UI
			    //$("tr[data-id='" + departmentId + "']").remove();
			    alert('asdfgh');
			    window.location.href = "/department"; // Redirect to the department page
			}, */
	</script>

</body>
</html>