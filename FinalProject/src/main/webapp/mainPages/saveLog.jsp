<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
	
	<head>
	  <meta charset="UTF-8">
			<title>SKKU CUP</title>
			<!-- Connect jQuery -->
	        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	        <script src="winner.js" type="text/javascript"></script>
	</head>
	
	<body>
	
	<%@ page import ="java.sql.*" %>
	<% 
		// Save winner log of user in database.
	    try{
	        String username = request.getParameter("username");   
	        String subject = request.getParameter("subject");
	        String imageUrl = request.getParameter("imageUrl");
	        String text = request.getParameter("text");
	        
	        Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
	        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitedb?" + "user=root&password=root");
	       	
	        String sql = "insert into winner_log(user_name, subject, image_url, text)values(?,?,?,?)";
	        PreparedStatement ps = null;
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, username);
	        ps.setString(2, subject);
	        ps.setString(3, imageUrl);
	        ps.setString(4, text);
	        
	        int rowsAffected = ps.executeUpdate(); // Excute SQL query
	        if(rowsAffected > 0) {
	        	System.out.println("A log has been recorded!");
	        } else {
	        	System.out.println("Failed to record log.");
	        }
	   }
	   catch(Exception e){       
	       out.println("Something went wrong !! Please try again");       
	   }      
	%>
	</body>
</html>
