<%-- <%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student List</title>
<style>
body {
	font-family: Arial, sans-serif;
}

header {
	background-color: #f2f2f2;
	padding: 10px;
	text-align: center;
}

.user-info {
	position: absolute;
	top: 10px;
	right: 10px;
}

section {
	margin: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

th {
	background-color: #f2f2f2;
}
</style>
</head>
<body>

	<header>
		<h2>Welcome to Teacher Dashboard</h2>
		<div class="user-info">
			<c:if test="${not empty sessionScope.username}">
                Welcome, ${sessionScope.username}!
                <br>
				<a class="btn btn-danger logout-btn" href="/logout">Logout</a>
			</c:if>
		</div>
	</header>

	<section>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>fullName</th>
					<th>department</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="student" items="${studentsInSameDepartment}">
					<tr>
						<td><c:out value="${student.id}" /></td>
						<td><c:out value="${student.full_name}" /></td>
						<td><c:out value="${student.department}" /></td>
						<td>
							<form id="teacherDash" method="post"
								action="/verify-student/${student.id}">
								<button class="btn btn-primary" type="submit" name="studentId"
									value="${student.id}">Approve</button>
							</form>
							<button class="btn btn-info view-query-btn"
								data-student-id="${student.id}">View Query</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</section>

	<!-- Modal for displaying student query -->
	<!-- <div class="modal" id="queryModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Student Query</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					Query content will be displayed here
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script>
		var $j = jQuery.noConflict();
	</script>


	<script>
		$j(document)
				.ready(
						function() {
							$j(".view-query-btn")
									.click(
											function() {
												var studentId = $j(this).data(
														"student-id");
												$j
														.ajax({
															type : 'GET',
															url : '/getContent/'
																	+ studentId,
															success : function(
																	content) {
																if (Array
																		.isArray(content)) {
																	// Assuming each element of the array is a line
																	var formattedContent = '';
																	for (var i = 0; i < content.length; i++) {
																		formattedContent += '<p>'
																				+ content[i]
																				+ '</p>';
																	}

																	// Set the formatted content in the modal body
																	$j(
																			"#queryModal .modal-body")
																			.html(
																					formattedContent);

																	// Show the modal
																	$j(
																			"#queryModal")
																			.modal(
																					"show");
																} else {
																	console
																			.log(
																					'Content is not an array:',
																					content);
																}
															},
															error : function(
																	error) {
																console
																		.log(
																				'Error fetching query: ',
																				error);
															}
														});
											});
						});
	</script>
 -->

	<div class="modal" id="queryModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Student Query</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<!-- Query content will be displayed here -->
					<div id="queryContent"></div>
					<div class="form-group">
						<label for="approvalStatus">Select Status:</label> <select
							class="form-control" id="approvalStatus">
							<option value="approval">Approval</option>
							<option value="pending">Pending</option>
						</select>
					</div>
					<button class="btn btn-success" id="approveBtn">Approve</button>
					<button class="btn btn-danger" id="pendingBtn">Pending</button>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		var $j = jQuery.noConflict();
	</script>



	<script>
		$j(document)
				.ready(
						function() {
							$j(".view-query-btn")
									.click(
											function() {
												var studentId = $j(this).data(
														"student-id");
												$j
														.ajax({
															type : 'GET',
															url : '/getContent/'
																	+ studentId,
															success : function(
																	content) {
																if (Array
																		.isArray(content)) {
																	var formattedContent = '';
																	for (var i = 0; i < content.length; i++) {
																		formattedContent += '<p>'
																				+ content[i]
																				+ '</p>';
																	}
																	$j(
																			"#queryContent")
																			.html(
																					formattedContent);
																	$j(
																			"#queryModal")
																			.modal(
																					"show");
																} else {
																	console
																			.log(
																					'Content is not an array:',
																					content);
																}
															},
															error : function(
																	error) {
																console
																		.log(
																				'Error fetching query: ',
																				error);
															}
														});
											});

							// Handle approval button click
							$j("#approveBtn").click(function() {
								var status = $j("#approvalStatus").val();
								// Perform the action based on the selected status (approval or pending)
								console.log('Approval Status:', status);
								// Add your logic here
								// ...

								// Close the modal
								$j("#queryModal").modal("hide");
							});

							// Handle pending button click
							$j("#pendingBtn").click(function() {
								var status = $j("#approvalStatus").val();
								// Perform the action based on the selected status (approval or pending)
								console.log('Pending Status:', status);
								// Add your logic here
								// ...

								// Close the modal
								$j("#queryModal").modal("hide");
							});
						});
	</script>


</body>
</html> --%>
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student List</title>
<style>
body {
	font-family: Arial, sans-serif;
}

header {
	background-color: #f2f2f2;
	padding: 10px;
	text-align: center;
}

.user-info {
	position: absolute;
	top: 10px;
	right: 10px;
}

section {
	margin: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

th {
	background-color: #f2f2f2;
}
</style>
</head>
<body>

	<header>
		<h2>Welcome to Teacher Dashboard</h2>
		<div class="user-info">
			<c:if test="${not empty sessionScope.username}">
                Welcome, ${sessionScope.username}!
                <br>
				<a class="btn btn-danger logout-btn" href="/logout">Logout</a>
			</c:if>
		</div>
	</header>

	<section>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>fullName</th>
					<th>department</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="student" items="${studentsInSameDepartment}">
					<tr>
						<td><c:out value="${student.id}" /></td>
						<td><c:out value="${student.full_name}" /></td>
						<td><c:out value="${student.department}" /></td>
						<td>
							<form id="teacherDash" method="post"
								action="/verify-student/${student.id}">
								<button class="btn btn-primary" type="submit" name="studentId"
									value="${student.id}">Approve</button>
							</form>
							<button class="btn btn-info view-query-btn"
								data-student-id="${student.id}">View Query</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</section>

	<!-- Modal for displaying student query -->
	<div class="modal" id="queryModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Student Query</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<!-- Query content will be displayed here -->
					<div id="queryContent"></div>
					<div class="form-group">
						<label for="approvalStatus">Select Status:</label> <select
							class="form-control" id="approvalStatus">
							<option value="approval">Approval</option>
							<option value="pending">Pending</option>
						</select>
					</div>
					<button class="btn btn-success" id="submitBtn">Submit</button>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<!-- <!-- <script>
		var $j = jQuery.noConflict();
	</script> -->
	-->
	<!-- 	<script>
		$j(document)
				.ready(
						function() {
							$j(".view-query-btn")
									.click(
											function() {
												var studentId = $j(this).data(
														"student-id");
												$j
														.ajax({
															type : 'GET',
															url : '/getContent/'
																	+ studentId,
															success : function(
																	content) {
																if (Array
																		.isArray(content)) {
																	var formattedContent = '';
																	for (var i = 0; i < content.length; i++) {
																		formattedContent += '<p>'
																				+ content[i]
																				+ '</p>';
																	}
																	$j(
																			"#queryContent")
																			.html(
																					formattedContent);

																	// Set the initial approval status to 'approval'
																	$j(
																			"#approvalStatus")
																			.val(
																					'approval');

																	$j(
																			"#queryModal")
																			.modal(
																					"show");
																} else {
																	console
																			.log(
																					'Content is not an array:',
																					content);
																}
															},
															error : function(
																	error) {
																console
																		.log(
																				'Error fetching query: ',
																				error);
															}
														});
											});

							// Handle submit button click
							$j("#submitBtn").click(function() {
								var status = $j("#approvalStatus").val();
								// Perform the action based on the selected status (approval or pending)
								console.log('Approval Status:', status);
								// Add your logic here
								// ...

								// Close the modal
								$j("#queryModal").modal("hide");
							});
						});
	</script> -->
	<!-- <!-- 
	<script>
		$j(document)
				.ready(
						function() {
							$j(".view-query-btn")
									.click(
											function() {
												var studentId = $j(this).data(
														"student-id");
												var queryId = $j(this).data(
														"query-id"); // Assuming you have a data attribute for query ID

												$j
														.ajax({
															type : 'GET',
															url : '/getContent/'
																	+ studentId,
															success : function(
																	content) {
																if (Array
																		.isArray(content)) {
																	var formattedContent = '';
																	for (var i = 0; i < content.length; i++) {
																		formattedContent += '<p>'
																				+ content[i]
																				+ $j(
																						"#queryContent")
																						.html(
																								formattedContent);
																		$j(
																				"#approvalStatus")
																				.val(
																						'approval');
																		$j(
																				"#queryId")
																				.val(
																						queryId); // Set query ID in a hidden field
																		$j(
																				"#queryModal")
																				.modal(
																						"show");
																		+'</p>';
																	}

																} else {
																	console
																			.log(
																					'Content is not an array:',
																					content);
																}
															},
															error : function(
																	error) {
																console
																		.log(
																				'Error fetching query: ',
																				error);
															}
														});
											});

							$j("#submitBtn").click(function() {
								var status = $j("#approvalStatus").val();
								var queryId = $j("#queryId").val(); // Get query ID from hidden field

								// Perform the action based on the selected status (approval or pending) for the corresponding query ID
								console.log('Query ID:', queryId);
								console.log('Approval Status:', status);

								// Add your logic here based on queryId and status
								// ...

								// Close the modal
								$j("#queryModal").modal("hide");
							});
						});
	</script>
 -->
	-->


	<script>
		var $j = jQuery.noConflict();

		$j(document)
				.ready(
						function() {
							$j(".view-query-btn")
									.click(
											function() {
												var studentId = $j(this).data(
														"student-id");

												$j
														.ajax({
															type : 'GET',
															url : '/getContent/'
																	+ studentId,
															success : function(
																	content) {
																if (Array
																		.isArray(content)) {
																	var formattedContent = '';
																	for (var i = 0; i < content.length; i++) {
																		formattedContent += '<p>'
																				+ content[i]
																				+ '<div class="form-group">'
																				+ '<label for="approvalStatus_' + i + '">Select Status:</label>'
																				+ '<select class="form-control" id="approvalStatus_' + i + '">'
																				+ '<option value="approval">Approval</option>'
																				+ '<option value="pending">Pending</option>'
																				+ '</select>'
																				+ '</div>'
																				+ '<button class="btn btn-success submit-btn" data-student-id="' + studentId + '" data-paragraph-index="' + i + '">Submit</button>'
																				+ '</p>';
																	}
																	$j(
																			"#queryContent")
																			.html(
																					formattedContent);
																	$j(
																			"#queryModal")
																			.modal(
																					"show");
																} else {
																	console
																			.log(
																					'Content is not an array:',
																					content);
																}
															},
															error : function(
																	error) {
																console
																		.log(
																				'Error fetching query: ',
																				error);
															}
														});
											});

							$j(document)
									.on(
											"click",
											".submit-btn",
											function() {
												var studentId = $j(this).data(
														"student-id");
												var paragraphIndex = $j(this)
														.data("paragraph-index");
												var status = $j(
														"#approvalStatus_"
																+ paragraphIndex)
														.val();

												// Add your logic here based on the selected status and other parameters
												// For example, you may want to send an AJAX request to update the status on the server

												// ...

												$j("#queryModal").modal("hide");
											});
						});
	</script>



</body>
</html>







