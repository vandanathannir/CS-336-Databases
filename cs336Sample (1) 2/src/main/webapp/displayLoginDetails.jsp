
<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("user")%>  <%-- this will display the username that is stored in the session.--%>
<br/>
Choose Account type:

<br>

<a href='homepage.jsp'>User Account</a>

<br> 

<a href='randomAdminpagelater.jsp'>Adminstrative Account</a>


<br/>
<a href='logout.jsp'>Log out</a>
<%
    }
%>