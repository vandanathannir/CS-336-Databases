<%
session.getAttribute("user");   //this will throw an error
session.invalidate();
response.sendRedirect("login.jsp");

%>