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
	String category = request.getParameter("category");
	String subcategory = request.getParameter("subcategory");
	String itemName = request.getParameter("itemName");
	String itemDesc = request.getParameter("itemDescription");
	String closeDateTime = request.getParameter("closeDateTime");
	String minPrice = request.getParameter("minPrice");
	String incBid = request.getParameter("incBid");
    Class.forName("com.mysql.jdbc.Driver");
    int updateQuery=0;
   	try 
   	{
   	 	if(itemName!=null && itemDesc!=null && closeDateTime!=null && minPrice!=null && incBid!=null)
   	    {	 
   	   	 	if(itemName!="" && itemDesc!="" && closeDateTime!="" && minPrice!="" && incBid!="" ) 
   	   	 	{
    		
	    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336 Final","root", "");
	    		String SQL_INSERT = "INSERT INTO `AuctionItem_Posts` ( `username`,`category`, `subcategory`,`itemName`, `description`,`closingDateTime`,`minimumPrice`, `incrementBid`,`status`) VALUES (?,?,?,?,?,?,?,?,?)";
	    		 
	    		PreparedStatement ps = con.prepareStatement(SQL_INSERT);
	    		
	    		ps.setString(1, userName);
	    		ps.setString(2, category);
	    		ps.setString(3, subcategory);
	    		ps.setString(4, itemName);
	    		ps.setString(5, itemDesc);
	    		ps.setString(6, closeDateTime);
	    		ps.setString(7, minPrice);
	    		ps.setString(8, incBid);
	    		ps.setString(9,"OPEN");
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
