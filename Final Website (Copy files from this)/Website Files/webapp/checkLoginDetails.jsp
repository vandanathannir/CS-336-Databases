<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("username");
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336 Final","root", "720kickflip");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from `User-Account` where `username`='" + userid + "' and `password`='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("user", userid); // the username will be stored in the session
        out.println("welcome " + userid);
        out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("homepage.jsp");
    } else {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }
%>
