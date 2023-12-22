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
	                <li id="login">Log Out</li>
	            </ul>
	        </div>
	    </div>
	    
		<%@ page import ="java.sql.*" %>
		<% 
		String username = request.getParameter("username");   
		System.out.println("my log");
		System.out.println(username);
		Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitedb?" + "user=root&password=root");
		
		String sql = "SELECT * FROM winner_log WHERE user_name = ?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, username);
		ResultSet rs = pst.executeQuery();
		%>
		<!-- Create log table -->
		<div class="log-container">
			<table border="1">
			    <tr>
			        <th>Subject</th>
			        <th>Winner Image</th>
			        <th>Winner</th>
			    </tr>
			    <% while (rs.next()) { %>
			    <tr>
			        <td><%= rs.getString("subject") %></td>
			        <td><img src="<%= rs.getString("image_url") %>" alt="Winner Image" width="100" height="100"></td>
			        <td><%= rs.getString("text") %></td>
			    </tr>
			    <% } %>
			</table>
		</div>
	</body>
</html>