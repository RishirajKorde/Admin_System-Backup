

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<title>Student Dashboard</title>
<style>
.user-info {
	position: absolute;
	top: 10px;
	right: 10px;
}

button {
	padding: 10px;
	font-size: 16px;
	background-color: #4CAF50;
	color: #fff;
	border: none;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}

#queryBox {
	width: 300px; /* Adjust the width as needed */
	height: 150px; /* Adjust the height as needed */
	resize: none;
}
</style>
</head>
<body>
	<div class="user-info">
		<c:if test="${not empty sessionScope.username}">
            Welcome, ${sessionScope.username}!
            <br>
			<a class="btn btn-danger logout-btn" href="/logout">Logout</a>
		</c:if>
	</div>

	<div class="container mt-5">
		<h1>Student Dashboard</h1>

		<c:if test="${not empty sessionScope.username}">
			<h2>Your Details:</h2>

			<c:if test="${not empty student}">
				<div class="row">
					<div class="col-md-6">
						<p>Username: ${student.username}</p>
						<p>Full Name: ${student.getFull_name()}</p>
						<p>Mobile No: ${student.mobNo}</p>
						<p>Email: ${student.email}</p>

						<h2>Edit Your Details:</h2>
						<form action="/updateStudent/${student.id}" method="post">
							<div class="form-group">
								<label for="full_name">Full Name:</label> <input type="text"
									class="form-control" id="full_name" name="full_name"
									value="${student.full_name}" required>
							</div>
							<div class="form-group">
								<label for="mobNo">Mobile No:</label> <input type="text"
									class="form-control" id="mobNo" name="mobNo"
									value="${student.mobNo}" required>
							</div>
							<div class="form-group">
								<label for="email">Email:</label> <input type="text"
									class="form-control" id="email" name="email"
									value="${student.email}" required>
							</div>
							<div class="form-group">
								<label for="mobNo">username:</label> <input type="text"
									class="form-control" id="username" name="username"
									value="${student.username}" required>
							</div>
							
								<div class="form-group">
								<label for="department">department:</label> <input type="text"
									class="form-control" id="department" name="department"
									value="${student.department}" required>
							</div>
							
								<div class="form-group">
								<label for="password">password:</label> <input type="text"
									class="form-control" id="password" name="password"
									value="${student.password}" required>
							</div>
							<button type="submit" class="btn btn-primary">Update
								Details</button>
						</form>
					</div>
					<div class="col-md-6">
						<!-- Add Query Box and Send API Button -->
						<h2>Add Query:</h2>
						<form id="queryForm">
							<div class="form-group">
								<label for="username">Your Username:</label> <input type="text"
									class="form-control" id="username" name="username" value=""
									placeholder="" required required>
							</div>
							<div class="form-group">
								<textarea id="queryBox" class="form-control" name="query"
									placeholder="Type your query here..." required></textarea>
							</div>
							<button type="button" id="sendQueryButton"
								class="btn btn-success"  onclick="myFunction()" >Send Query</button>
						</form>
					</div>
				</div>
			</c:if>
		</c:if>
	</div>
	
	
<script>
function myFunction() {
  alert("Query Send Successfully");
}
</script>

<!-- <script>
function myFunction12() {


}
</script>
 -->



	<script>
    document.getElementById("sendQueryButton").addEventListener("click", function () {
        // Get the name and query from the input fields
        var name = document.getElementById("username").value;
        var query = document.getElementById("queryBox").value;

        // Replace "/student/postQuery" with the actual API endpoint
        fetch("/student/postQuery",{
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
                // Add any other headers if needed
            },
            body: "query=" + encodeURIComponent(query) + "&username=" + encodeURIComponent(name)
        })
            .then(response => response.text())
            .then(data => {
                // Handle the API response
                console.log(data);
                // You might want to redirect or show a success message here
            })
            .catch(error => {
                console.error("Error:", error);
            });
    });
</script>
</body>
</html>
