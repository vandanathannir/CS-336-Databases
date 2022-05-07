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
    Class.forName("com.mysql.jdbc.Driver");
    int updateQuery=0;
    
    %><form action="item.jsp"> <%
    String i="";
   	try 
   	{
   		Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("SELECT * FROM AuctionItem_Posts;");
        
  
	
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
		out.print("Closing Date");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Closing Time");
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
        	out.print(rs.getString("closingDate") + "        ");
        	out.print("</td>");
			out.print("<td>"); 
        	out.print(rs.getString("closingTime") + "         ");
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





