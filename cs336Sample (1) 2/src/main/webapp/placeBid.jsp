<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Place Bid</title>
</head>
<body>
 <a href="searchpage.jsp">Search</a>
  <a href="seller.jsp">List an Item</a>
  <a href="Admin controls">Admin site</a>
  <a href="support">Customer Support</a>
  <a href="logout.jsp">Log Out</a>
 <br>
<%@ page import ="java.sql.*" %>
<%
	String userName = (String)session.getAttribute("user");
    Object biddingprice = session.getAttribute("biddingPrice");
    Object auctionid = session.getAttribute("auctionId");
    Object upperLimit = request.getParameter("upperLimit");
	//String biddingprice = (String)session.getAttribute("biddingPrice");
	//String auctionid = (String)session.getAttribute("auctionId");

	
    Class.forName("com.mysql.jdbc.Driver");
    int updateQuery=0;
   
   	try 
   	{
   	 	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336 Final","root", "");
	    		String SQL_INSERT = "INSERT INTO `bidding` (`auctionId`, `biddingPrice`,`buyerUsername`, `upperLimit`) VALUES (?,?,?,?)";
	    		PreparedStatement ps = con.prepareStatement(SQL_INSERT);
	    		
	    		
	    		ps.setObject(1, auctionid);
	    		ps.setObject(2, biddingprice);
	    		ps.setString(3, userName);
	    		ps.setObject(4, upperLimit);
	    		updateQuery = ps.executeUpdate();
				
	    		if (updateQuery != 0) { 
	        		
	        		// forwards back to login page
	        		out.println("Bidding Successful!");
	        		
	        		//not working 
	        		//out.println("Click above to return to your homepage");
	        		
	        		//request.getRequestDispatcher("homepage.jsp").forward(request, response);
	        		// manual click to login page
	        		//out.println("Success! Click ");
	        		
	        		//out.println("to return to the login page");
	        		
	       		}
	            
   		} catch (SQLException e) {
		        System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
		    	out.println("There was an error and bidding not successful");
		} catch (Exception e) {
		    	 out.println("Unable to connect to database.");
		}
   	 
%>
</body>
</html>