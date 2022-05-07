<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="favicon.ico">
  <title>Admin Controls</title>
  <style>

  </style>
</head>

<body>
  <a href="CRcreation.jsp">Customer Rep Creation</a>
  <br>
  <a href="salesReports.jsp">Sales Reports</a>
  <br>
  <script>

  </script>

</body>
</html>

<%@ page import ="java.sql.*, java.util.*, java.io.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<%

	String userName = (String)session.getAttribute("user");
	if(!(userName.equals("admin1")))
	{
		response.sendRedirect("adminRequestDenied.jsp");					
	}
	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336 Final","root", "720kickflip");
	Class.forName("com.mysql.jdbc.Driver");	
    
    out.print("Welcome " + userName);
%>