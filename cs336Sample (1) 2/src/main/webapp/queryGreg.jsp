<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Query</title>
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


<%@ page import ="java.sql.*, java.util.*, java.io.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<%
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336 Final","root", "");
	String SQL_SELECT = "SELECT * FROM `AuctionItem_Posts` WHERE status = 'OPEN'";
    Class.forName("com.mysql.jdbc.Driver");
    int updateQuery=0;
    
    %><form action="item.jsp"> <%
    String i="";
   	try 
   	{
   		Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("SELECT * FROM AuctionItem_Posts WHERE status = 'OPEN';");
        
  
	
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		out.print("Auction ID");
		out.print("</td>");
		//print out column header
		out.print("<td>");
		out.print("Username");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("Item");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("Description");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Closing Date Time");
		out.print("</td>");
		
		out.print("</tr>");

		while(rs.next()) {
        	out.print("<tr>");
        	out.print("<td>");
        	out.print(rs.getString("auctionId")+ "     ");
        	out.print("</td>");
        	out.print("<td>");
        	out.print(rs.getString("username")+ "     ");
        	out.print("</td>");
			out.print("<td>");
        	out.print(rs.getString("itemName") + "        ");
        	out.print("</td>");
			out.print("<td>");
        	out.print(rs.getString("description") + "        ");
        	out.print("</td>");
			out.print("<td>");
        	out.print(rs.getString("closingDateTime") + "        ");
        	out.print("</td>");
			out.print("<td>");
			i=rs.getString("auctionId");
			session.setAttribute("i", i);
			%>
		
			<input type="radio", name="bid", value="<%=session.getAttribute("i")%>" >Select Item
			<%
		
        	out.print("<br>");
			
        }
    	
		
		out.print("</table>");
		 %>
		
		 <br>
	      <input type="submit", name="reserveButton", value="Bid"</input>
	     
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




