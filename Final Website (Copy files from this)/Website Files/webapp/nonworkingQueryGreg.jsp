<!DOCTYPE html>
<html>
<head>
    <title>Jsp Sample</title>
    <%@page import="java.sql.*;"%>
</head>
<body bgcolor=yellow>
    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/CS336 Final Project","root","720kickflip");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from AuctionItem_Posts;");
    %><table border=1 align=center style="text-align:center">
      <thead>
          <tr>
             <th>ID</th>
             <th>NAME</th>
             <th>SKILL</th>
             <th>ACTION</th>
             <th>ACTION</th>
             <th>ACTION</th>
          </tr>
      </thead>
      <tbody>
        <%while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getString("username") %></td>
                <td><%=rs.getString("itemName") %></td>
                <td><%=rs.getString("description") %></td>
                <td><%=rs.getString("closingDate") %></td>
                <td><%=rs.getString("closingTime") %></td>
                <td><%=rs.getString("minimumPrice") %></td>
            </tr>
            <%}%>
           </tbody>
        </table><br>
    <%}
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    }
    finally{
        st.close();
        con.close();
    }
    %>
</body>
</html>
