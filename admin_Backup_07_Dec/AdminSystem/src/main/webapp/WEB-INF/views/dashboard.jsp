<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            overflow: hidden; /* Prevents scrollbar from appearing when animating */
        }

        .dashboard {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        .option {
            background-color: rgba(255, 255, 255, 0.8);
            border: 1px solid #ced4da;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease-in-out;
            width: 300px;
            opacity: 0;
            animation: fadeIn 1s forwards;
        }

        .option:nth-child(1) {
            animation-delay: 0.5s; /* Delay for the first option */
        }

        .option:nth-child(2) {
            animation-delay: 1s; /* Delay for the second option */
        }

        .option:nth-child(3) {
            animation-delay: 1.5s; /* Delay for the third option */
        }

        .option:hover {
            transform: translateY(-5px);
        }

        h2 {
            color: #333;
            margin-bottom: 10px;
        }

        p {
            color: #555;
            margin-bottom: 15px;
        }

        a {
            text-decoration: none;
            color: #3498db;
            transition: color 0.3s ease-in-out;
        }

        a:hover {
            color: #2072a5;
        }

        .logout-btn {
            margin-top: 10px;
            margin-right: 10px;
            background-color: #d9534f;
            border-color: #d9534f;
            transition: background-color 0.3s ease-in-out;
        }

        .logout-btn:hover {
            background-color: #c9302c;
            border-color: #ac2925;
        }

        .dashboard-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #fff;
            opacity: 0;
            animation: fadeIn 1s forwards; /* Animation for title appearance */
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        /* Popup button styles */
        .popup-btn {
            display: none;
            position: fixed;
            bottom: 20px;
            right: 20px;
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            opacity: 0;
            animation: fadeInBtn 1s forwards;
        }

        @keyframes fadeInBtn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        /* Popup Modal styles */
        .modal {
            transition: opacity 0.5s ease-in-out;
        }

        .modal.fade .modal-dialog {
            transform: translate(0, -25%);
        }
    </style>
    <script>
        // Function to generate a random dark color in hex format
        function getRandomDarkColor() {
            var letters = '0123456789ABCDEF';
            var color = '#';
            for (var i = 0; i < 3; i++) {
                // Generate a random number, but bias towards lower values for darker colors
                var randomNumber = Math.floor(Math.random() * 8);
                color += letters[randomNumber];
            }
            return color;
        }

        // Change the background color and title on page load
        $(document).ready(function () {
            // Set a random gradient background with shades effect
            var randomColor1 = getRandomDarkColor();
            var randomColor2 = getRandomDarkColor();
            $('body').css('background', 'linear-gradient(to right, ' + randomColor1 + ', ' + randomColor2 + ')');

            // Fade in title
            $('.dashboard-title').css('opacity', '1');

            // Display the popup button after 2 seconds
            setTimeout(function () {
                $('.popup-btn').css('display', 'block');
            }, 2000);
        });

        // Show the modal when the popup button is clicked
        $(document).on('click', '.popup-btn', function () {
            $('#popupModal').modal('show');
        });
    </script>
</head>
<body>
    <div class="dashboard">
        <div class="d-flex justify-content-between align-items-center w-100">
            <span class="dashboard-title">Hello, Admin</span>
            <!-- Logout button using Bootstrap -->
            <a class="btn btn-danger logout-btn" href="/logout">Logout</a>
        </div>
        
        <div class="option">
            <h2>Teacher Registration</h2>
            <p>Register as a teacher to get started.</p>
            <a href="/teacherReg">Get Started</a>
        </div>
        <div class="option">
            <h2>Department</h2>
            <p>Explore and view information about departments.</p>
            <a href="/department">Explore Departments</a>
        </div>
        <div class="option">
            <h2>Student Queries</h2>
            <p>View and manage student queries here.</p>
            <a href="#" id="popup-link">View Queries</a>
        </div>

        <!-- Popup button -->
        <button class="popup-btn" id="popup-btn">View Queries</button>

        <!-- Popup Modal -->
        <div class="modal fade" id="popupModal" tabindex="-1" role="dialog" aria-labelledby="popupModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="popupModalLabel">Student Queries</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Add content for the popup here -->
                        <p>This is where you can display student queries.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
