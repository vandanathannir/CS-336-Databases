<!DOCTYPE html>
<html>
   <head>
      <title>Login Form</title>
   </head>

   <body style = "margin:auto; width:50%; margin-top:50px">
     <form action="displayLoginDetails.jsp" method="POST">
     	<!--Links to other pages!-->
   	   <a href="homepage.jsp" style = "text-align:left; font-size:18px">Home</a>
   	   <a href="searchpage.jsp" style = "text-align:left; font-size:18px">Search</a>
   	   <a href="list.jsp" style = "text-align:left; font-size:18px">List an item</a>
   	   <a href="Admin-controls.jsp" style = "text-align:left; font-size:18px">Admin site</a>

       <div style = "text-align:center; border:1px; border-style: solid; font-family: Times New Roman; font-size: 20px; top:-100px">
		   <p style = "font-size:40px">Login</p>
		   <hr style = "margin-top:-25px">
			   Username: <input type="text" name="username" style="margin-right:50px"/> <br/>
			   Password: <input type="password" name="password" style="margin-right:47px"/> <br/>
		   <input type="submit" value="Submit" style="height:20px; width:100px; margin-left:8px"/>
	   </div>
     </form>
   </body>
</html>
