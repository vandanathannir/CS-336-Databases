<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller Information</title>
</head>
<body>
  <a href="searchpage.jsp">Search</a>
  <!--We need a landing page for searches!-->
  <a href="seller.jsp">List an Item</a>
  <a href="Admin controls">Admin site</a>
  <!-- Checks if you're an admin, if you are the right page pops up, if you're not it doesn't let you in!-->
  <a href="support">Customer Support</a>
<br>

List an Item Below:

<br>
	<form method="post" action="listedItem.jsp">
		<table>
		<tr>
		<td>Item Name</td><td><input type="text" name="itemName"></td>
		</tr>
		<tr>
		<td>Description</td><td><input type="text" name="itemDescription"></td>
		</tr>
		<tr>
		<tr>
		<td>Closing Date</td><td><input type="date" name="closeDate"></td>
		</tr>
		<tr>
		<td>Closing Time</td><td><input type="time" name="closeTime"></td>
		</tr>
		<tr>
		<td>Minimum Price</td><td><input type="text" name="minPrice"></td>
		</tr>
		</table>
		<input type="submit" value="List Item">
		</form>
	<br>

</body>
</html>
