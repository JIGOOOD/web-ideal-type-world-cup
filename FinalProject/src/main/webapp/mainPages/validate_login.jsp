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
	<% 
		try{
	        String username = request.getParameter("username"); // Get the username entered by the user in index.jsp
	        String password = request.getParameter("password"); // Get the password entered by the user in index.jsp
	        Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
	        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitedb?" + "user=root&password=root");    
	        PreparedStatement pst = conn.prepareStatement("Select user_name,password from users where user_name=? and password=?");
	        pst.setString(1, username);
	        pst.setString(2, password);
	        ResultSet rs = pst.executeQuery();
			
	        if (rs.next()) {
	            // Login processing if username and password match.
	            session.setAttribute("username", username);
	            System.out.println("Logged in");
	        } else {
	            // An error message is displayed if the user name and password do not match.
	            response.setStatus(401); // Unauthorized status code
	            System.out.println("Invalid username or password.");
	        }
		}
	   catch(Exception e){       
		   response.setStatus(500); // Internal Server Error status code
		   out.println("Something went wrong !! Please try again");       
	   }      
	%>
	</body>
</html>
