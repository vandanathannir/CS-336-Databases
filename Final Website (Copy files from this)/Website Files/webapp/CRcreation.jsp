<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create CR Account</title>
</head>
<body>
	Create a CR Account 
	
	<br>
	<form method="post" action="newCRAccount.jsp">
		<table>
		<tr>    
		<td>Name</td><td><input type="text" name="name"></td>
		</tr>
		<tr>
		<td>Customer ID</td><td><input type="text" name="customerid"></td>
		</tr>
		<tr>
		<td>Password</td><td><input type="text" name="password"></td>
		</tr>
		<tr>
		<td>Email Address</td><td><input type="text" name="email"></td>
		</tr>
		</table>
		<input type="submit" value="Create Account">
		</form>
	<br>
</body>
</html>


