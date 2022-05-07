<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Search</title>
  <style>

  </style>
</head>

<body>
  <h1>Search stuff goes here</h1>
  

  
  <form action="queryGreg.jsp" method="POST">
	  <p>Name of Posting User: 
	  <input type="text" name = "usNm" placeholder="username"> </p>
	  
	  <p>Item Name: 
	  <input type="text" name = "itNm" placeholder="itemName"> </p>
	  
	  <label for="typeVehic">Select your vehicle type:</label>
	
	   <select name="typeVehic" id="typeVehic">
		  <option value="Motorcycle">Motorcycle</option>
		  <option value="Car">Car</option>
		  <option value="Truck">Truck</option>
	   </select>
	   
	   <p>Maximum Price: 
	   <input type="number" name = "maxPrice" placeholder="maxPrice"> </p>
	   <input type="submit" value="Submit"/>
       
       
     </form>
  <script>

  </script>

</body>
</html>
