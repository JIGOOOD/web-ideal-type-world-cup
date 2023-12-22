<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
	
	<head>
	  <meta charset="UTF-8">
			<title>SKKU CUP</title>
			<!-- Connect jQuery -->
	        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	        <script src="index.js" type="text/javascript"></script>
	</head>
	
	<body>
	
	<%@ page import ="java.sql.*" %>
	<% String firstName="";
	    try{
	        String username = request.getParameter("username");   
	        String password = request.getParameter("password");
	        Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
	        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitedb?" + "user=root&password=root");
	        
	        System.out.println(username);
	        System.out.println(password);
	        
	        String sql = "insert into users(user_name, password)values(?,?)";
	        PreparedStatement ps = null;
	        ps = conn.prepareStatement(sql);
	        ps.setString(1,username);
	        ps.setString(2, password);
	        
	        int rowsAffected = ps.executeUpdate(); // Execute SQL query.
	        if(rowsAffected > 0) {
	        	System.out.println("User has been registered successfully!");
	        } else {
	        	System.out.println("Failed to register user.");
	        }
	   }
	   catch(Exception e){       
	       out.println("Something went wrong !! Please try again");       
	   }      
	%>
	</body>
</html>
