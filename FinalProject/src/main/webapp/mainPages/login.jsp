<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../css/style1.css">
<html>
	<head>
		<meta charset="UTF-8">
		<title>SKKU CUP</title>
		<!-- Connect jQuery -->
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="index.js" type="text/javascript"></script>
	</head>
	
	<body>
		<div class="header">
	        <div class="wrapper">
				<div class="menu">
					<div class="main"><i class="fas fa-kiss-wink-heart"></i> SKKU CUP</div>
	                <div class="log">My Log</div>
				</div>
	            
	            <ul class="user">
	                <li id="signup">Sign Up</li>
	                <li id="login">Log In</li>
	            </ul>
	        </div>
	    </div>
	    
	    <div class="login-container">
	    	<h2>Login</h2>
		    <form id="loginForm" type="post" action="validate_login.jsp">
		        <label for="username">Username:</label><br>
		        <input type="text" id="username" name="username" required><br>
		        <label for="password">Password:</label><br>
		        <input type="password" id="password" name="password" required><br>
		        <input type="submit" value="Login">
		    </form>
		</div>
	</body>
</html>
