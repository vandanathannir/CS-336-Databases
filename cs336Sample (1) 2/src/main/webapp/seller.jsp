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
  <a href="alert.jsp">Alerts!</a>
  <a href="logout.jsp">Log Out</a>
<br>

List an Item Below:
<br> 
<br>   
		<td>Select Category</td>
		<select name="Vehicle" size=1>
				<option value="Vehicle">Vehicle</option>
		</select>&nbsp;
<br>

<br>   
		<td>Select Subcategory</td>
		<select name="Subcategory" size=1>
				<option value="Car">Car</option>
				<option value="Truck">Truck</option>
				<option value="Motorcycle">Motorcycle</option>
		</select>&nbsp;
<br>


<br>
	<form method="post" action="listedItem.jsp">
		<table>		
		<tr>
		<tr>
		<tr>    
		<td>Item Name</td><td><input type="text" name="itemName"></td>
		</tr>
		<tr>
		<td>Description</td><td><input type="text" name="itemDescription"></td>
		</tr>
		<tr>
		<tr>
		<td>Closing Date</td><td><input type="datetime-local" name="closeDateTime"></td>
		</tr>
		<tr>
		<td>Minimum Price</td><td><input type="text" name="minPrice"></td>
		</tr>
		<tr>
		<td>Increment Bid</td><td><input type="text" name="incBid"></td>
		</tr>
		</table>
		<input type="submit" value="List Item">
		</form>
	<br>
	
</body>
</html>