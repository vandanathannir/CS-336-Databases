<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Query</title>
	</head>
	<body>
  	</body>
</html>


<%@ page import ="java.sql.*, java.util.*, java.io.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336 Final","root", "720kickflip");
	String SQL_SELECT = "SELECT * FROM `AuctionItem_Posts`";

	String newName = request.getParameter("name");
	String newUsername = request.getParameter("username");
	String newPassword = request.getParameter("password");
	String newEmail= request.getParameter("email");
	String newPhone = request.getParameter("phone");
	String newAddress = request.getParameter("address");
    Class.forName("com.mysql.jdbc.Driver");
    int updateQuery=0;
   	try 
   	{
   		Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("SELECT * FROM AuctionItem_Posts;");
        
        while(rs.next()) {
        	out.print("<tr>");
        	
        	out.print("<td>");
        	
        	out.print(rs.getString("username") + "     ");
        	out.print(rs.getString("itemName") + "     ");
        	out.print(rs.getString("description") + "     ");
        	out.print(rs.getString("closingDate") + "     ");
        	out.print(rs.getString("closingTime") + "     ");
        	out.print(rs.getString("minimumPrice") + "     ");
        	
        	out.print("<br>");
        }
        
        
        
        
   		} catch (SQLException e) {
		        System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
		    	out.println("There was an error and insert failed");
		} catch (Exception e) {
		    	 out.println("Unable to connect to batabase.");
		}
   	 
%>
