<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Account Creation</title>
	</head>
	<body>
  	</body>
</html>


<%@ page import ="java.sql.*" %>
<%
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
   	 	if(newName!=null && newUsername!=null && newPassword!=null && newEmail!=null && newPhone!=null && newAddress!=null)
   	    {	 
   	   	 	if(newName!="" && newUsername!="" && newPassword!="" && newEmail!="" && newPhone!="" && newAddress!="") 
   	   	 	{
    		
	    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336 Final","root", "720kickflip");
	    		String SQL_INSERT = "INSERT INTO `User-Account` ( `username`,`password`,`email address`, `address`,`name`,`phone number`) VALUES (?,?,?,?,?,?)";
	    		 
	    		PreparedStatement ps = con.prepareStatement(SQL_INSERT);
	    		ps.setString(1, newUsername);
	    		ps.setString(2, newPassword);
	    		ps.setString(3, newEmail);
	    		ps.setString(4, newAddress);
	    		ps.setString(6, newPhone);
	    		ps.setString(5, newName);
	    		updateQuery = ps.executeUpdate();
	    		if (updateQuery != 0) { 
	        		
	        		// forwards back to login page 
	        		request.getRequestDispatcher("login.jsp").forward(request, response);
	        		// manual click to login page
	        		//out.println("Success! Click ");
	        		
	        		//out.println("to return to the login page");
	        		
	       		}
	            
   	  		} else
    	 	out.println("There was an error, no fields can be null");
     	} else
    	out.println("There was an error: no fields can be left empty");	
   		
   		} catch (SQLException e) {
		        System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
		    	out.println("There was an error and insert failed");
		} catch (Exception e) {
		    	 out.println("Unable to connect to batabase.");
		}
   	 
%>
