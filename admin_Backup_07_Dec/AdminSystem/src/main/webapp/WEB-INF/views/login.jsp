<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/login.css">
<title>Login Panel</title>
</head>
<body>
	<div class="container">
		<div class="myform">
			<form action="login" method="post">
				<h2>LOGIN</h2>
				<div class="form-group">
					<label for="identifier">MoborEmailo</label> <input type="text"
						class="form-control" id="identifier" name="identifier" required>
				</div>
				<div class="form-group">
					<label for="password">Password</label> <input type="password"
						class="form-control" id="password" name="password" required>
				</div>
				<button type="submit" class="btn btn-primary btn-block">LOGIN</button>

				<!-- Student Register Button -->
				<button type="button" class="btn btn-secondary btn-block"
					onclick="location.href='/studentRegister'">Student
					Register</button>

			</form>
		</div>
		<div class="image">
			<img src="/images/admin.jpg" alt="Admin Image">
		</div>
	</div>

	<div id="popup" class="popup">
		<p>Incorrect username or password. Please try again.</p>
		<button onclick="closePopup()">Close</button>
	</div>

	<script>
		function validateForm() {
			var username = document.getElementById('username').value;
			var password = document.getElementById('password').value;

			// Replace the following condition with your actual logic for checking credentials
			if (username === "username" && password === "password") {
				return true; // Allow form submission
			} else {
				showPopup();
				return false; // Prevent form submission
			}
		}

		function showPopup() {
			document.getElementById('popup').style.display = 'block';
		}

		function closePopup() {
			document.getElementById('popup').style.display = 'none';
		}
	</script>

</body>
</html>
