<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Gregslist</title>

</head>
<body>

<div style = "font-family:Times New Roman; color:black; font-size: 18px;">

	<!--Welcome text!-->
	<p style = "text-align:center; font-size: 30px; border:1px; border-style: solid; padding: 0.5em">Welcome to Gregslist!</p>
	<hr width = 1900>
	
	<!--We need a landing page for searches!-->
	<a href="searchpage.jsp">Search</a>
	
	<a href="seller.jsp">List an item</a>
	
	<!-- Checks if you're an admin, if you are the right page pops up, if you're not it doesn't let you in!-->
	<a href="adminControls.jsp">Admin site</a>
	
	<a href="logout.jsp">Logout</a>
	
	<!--Customer support on the bottom left of the homepage!-->
	<div style = "float:left; position:fixed; bottom: 35px;">
		<a href="support">Customer support</a>
		<hr width = 1900>
	</div>
	
	<!--Login page on the right of the homepage!-->
	<div style = "float:right">
		<a href="login.jsp">Login</a>
	</div>
	
	<!--Text on the bottom of the page!-->
	<div style = "position:fixed; bottom: -5px">	
		<p>Gregslist© Copyright 2022. All rights reserved to Victor, Vandana, Kyle and Luca.</p>
	</div>
</div>

</body>
</html>

