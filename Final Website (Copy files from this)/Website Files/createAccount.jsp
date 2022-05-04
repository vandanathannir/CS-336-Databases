<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>
</head>
<body>
	Create an Account 
	
	<br>
	<form method="post" action="newAcct2.jsp">
		<table>
		<tr>    
		<td>Name</td><td><input type="text" name="name"></td>
		</tr>
		<tr>
		<td>Username</td><td><input type="text" name="username"></td>
		</tr>
		<tr>
		<td>Password</td><td><input type="text" name="password"></td>
		</tr>
		<tr>
		<td>Email Address</td><td><input type="text" name="email"></td>
		</tr>
		<tr>
		<td>Phone Number</td><td><input type="text" name="phone"></td>
		</tr>
		<tr>
		<td>Address</td><td><input type="text" name="address"></td>
		</tr>
		</table>
		<input type="submit" value="Create Account">
		</form>
	<br>
</body>
</html>


