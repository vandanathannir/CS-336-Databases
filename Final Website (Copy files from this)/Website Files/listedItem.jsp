<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listed Item</title>
</head>
<body>
	
	<a href="homepage.jsp">Back to Home</a>

	<br>	        		
</body>
</html>




<%@ page import ="java.sql.*" %>
<%
	String userName = (String)session.getAttribute("user");
	String itemName = request.getParameter("itemName");
	String itemDesc = request.getParameter("itemDescription");
	String closeDate = request.getParameter("closeDate");
	String closeTime= request.getParameter("closeTime");
	String minPrice = request.getParameter("minPrice");
    Class.forName("com.mysql.jdbc.Driver");
    int updateQuery=0;
   	try 
   	{
   	 	if(itemName!=null && itemDesc!=null && closeDate!=null && closeTime!=null && minPrice!=null )
   	    {	 
   	   	 	if(itemName!="" && itemDesc!="" && closeDate!="" && closeTime!="" && minPrice!="" ) 
   	   	 	{
    		
	    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336 Final","root", "720kickflip");
	    		String SQL_INSERT = "INSERT INTO `AuctionItem_Posts` ( `username`,`itemName`, `description`,`closingDate`,`closingTime`,`minimumPrice`) VALUES (?,?,?,?,?,?)";
	    		 
	    		PreparedStatement ps = con.prepareStatement(SQL_INSERT);
	    		ps.setString(1, userName);
	    		ps.setString(2, itemName);
	    		ps.setString(3, itemDesc);
	    		ps.setString(4, closeDate);
	    		ps.setString(5, closeTime);
	    		ps.setString(6, minPrice);
	    		updateQuery = ps.executeUpdate();
	    		if (updateQuery != 0) { 
	        		
	        		// forwards back to login page
	        		out.println("Successfully Listed!");
	        		
	        		//not working 
	        		//out.println("Click above to return to your homepage");
	        		
	        		//request.getRequestDispatcher("homepage.jsp").forward(request, response);
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
		    	out.println("There was an error and item cannot be listed");
		} catch (Exception e) {
		    	 out.println("Unable to connect to database.");
		}
   	 
%>

