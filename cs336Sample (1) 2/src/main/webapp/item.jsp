<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listed Item Page</title>
</head>
<body>
 <a href="searchpage.jsp">Search</a>
  <a href="seller.jsp">List an Item</a>
  <a href="Admin controls">Admin site</a>
  <a href="support">Customer Support</a>
  <a href="logout.jsp">Log Out</a>

<h1>Bid on Item Number ${param.bid} </h1>

	
<br/>
</body>
</html>
<%

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336 Final","root", "");
    Class.forName("com.mysql.jdbc.Driver");
    
    Statement st = con.createStatement();
    String Id = request.getParameter("bid");
    ResultSet rs;
    rs = st.executeQuery("select * from `AuctionItem_Posts` A LEFT join (SELECT auctionid, max(`biddingPrice`) as max_bidPrice FROM `Bidding` group by auctionid) B on A.auctionid = B.auctionid where A.auctionid = " + Id);
   
    out.print("<table>");
	
    %><form action="placeBid.jsp"> <%
	while(rs.next()) {
    	out.print("<tr>");
    	out.print("Auction ID:  ");
    	out.println(rs.getString("auctionId")+ "     ");
    	out.print("</tr>");
    	out.print("<br>");
    	out.print("<tr>");
    	out.print("Seller Username:  ");
    	out.println(rs.getString("username")+ "     ");
    	out.print("</tr>");
    	out.print("<br>");
		out.print("<tr>");
		out.print("Item:  ");
    	out.print(rs.getString("itemName") + "        ");
    	out.print("</tr>");
    	out.print("<br>");
		out.print("<tr>");
		out.print("Description:  ");
    	out.print(rs.getString("description") + "        ");
    	out.print("</tr>");
    	out.print("<br>");
		out.print("<tr>");
		out.print("Closing Date Time:  ");
    	out.print(rs.getString("closingDateTime") + "        ");
    	out.print("</tr>");
    	out.print("<br>");
    	out.print("<tr>"); 
		out.print("Current Bid:  ");
		Integer currentBid;
		if (rs.getString("max_bidPrice") == null)
		{
			currentBid = 0;
		}else{
			currentBid = Integer.parseInt(rs.getString("max_bidPrice"));
		}
    	out.print(currentBid);
    	out.print("</tr>");
    	out.print("<br>");
    	out.print("<tr>"); 
		out.print("New Bid:  ");
		int newBid = currentBid+Integer.parseInt(rs.getString("incrementBid"));
		out.print(newBid);
    	out.print("</tr>");
    	out.print("<br>");
    	out.print("<tr>"); 
		%>
		<td>Enter Your Upper Limit for Automatic Bidding:</td><td><input type="text" name="upperLimit"></td>
		<%
		
    	out.print("</tr>");
		String upperLimit = request.getParameter("upperLimit");
		session.setAttribute("upperLimit",upperLimit);
    	session.setAttribute("biddingPrice",newBid);
    	//out.print(session.getAttribute("biddingPrice"));
    	session.setAttribute("auctionId",rs.getString("auctionId"));
    	//out.print(session.getAttribute("auctionId"));
	}
	out.print("</table>");
%>

<br>
 <input type="submit", name="bidButton", value="Place Bid"</input>
