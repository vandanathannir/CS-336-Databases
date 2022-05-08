<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="java.sql.*, java.util.*, java.io.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alerts!</title>
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
  
</body>

</html>


<%
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336 Final","root", "");
	String SQL_SELECT = "Select * from `send_email` A join `AuctionItem_Posts` B on (A.auctionid = B.auctionid) where A.username = " + "'" + session.getAttribute("user") + "'";
    Class.forName("com.mysql.jdbc.Driver");
    int updateQuery=0;
    
    %><form action="homepage.jsp"> <%
    String i="";
   	try 
   	{
   		Statement st=con.createStatement();
        ResultSet rs=st.executeQuery(SQL_SELECT);
        
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		out.print("Auction ID");
		out.print("</td>");
		//print out column header
		out.print("<td>");
		out.print("Item Name");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("Item Description");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("Subject");
		out.print("</td>");
		out.print("<td>");
		out.print("Text");
		out.print("</td>");
		
		out.print("</tr>");

		while(rs.next()) {
        	out.print("<tr>");
        	out.print("<td>");
        	out.print(rs.getString("auctionId")+ "     ");
        	out.print("</td>");
        	out.print("<td>");
        	out.print(rs.getString("itemName")+ "     ");
        	out.print("</td>");
        	out.print("<td>");
        	out.print(rs.getString("description")+ "     ");
        	out.print("</td>");
			out.print("<td>");
        	out.print(rs.getString("subject") + "        ");
        	out.print("</td>");
			out.print("<td>");
        	out.print(rs.getString("text") + "        ");
        	out.print("</td>");
			out.print("<td>");
			i=rs.getString("auctionId");
			session.setAttribute("i", i);
			%>
		
		
			<%
		
        	out.print("<br>");
			
        }
    	
		
		out.print("</table>");
		 %>
		
		 <br>
	      <input type="submit", name="reserveButton", value="Acknowledge Alert"</input>
	     
		 </form><%
		//close the connection.
		con.close();			   
          	
	    
		} catch (SQLException e) {
	        System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
	    	out.println("There was an error");
	} catch (Exception e) {
	    	 out.println("Unable to connect to database.");
	}
   	 
%>