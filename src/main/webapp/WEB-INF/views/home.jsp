
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="../resources/css/b2b2c.css" rel="stylesheet">
<link href="../webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="../webjars/bootstrap-social/4.12.0/bootstrap-social.css">
<link href="../webjars/font-awesome/4.6.1/css/font-awesome.css"
	rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<head>
<title>ReciPete</title>
</head>


<style>
h1,h2,h3,h4,h5,h6 {font-family: "Oswald"}
body {font-family: "Open Sans"}
#limit {max-width: 500px;}
body {
 
  background-image: "food.jpg";
  background-size: 100% 100%;
   
}

.w3-left, .w3-right, .w3-badge {cursor:pointer}
.w3-badge {height:13px;width:13px;padding:0}
</style>

<body background="food.jpg">
	<br>
	  
	
	<!-- w3-content defines a container for fixed size centered content, 
	and is wrapped around the whole page content, except for the footer in this example -->
	<div class="w3-content" style="max-width:1600px">
	
	  
	    <h1 class="w3-xxxlarge w3-center"><b>ReciPete</b></h1>
	    <h3 class=" w3-center">Find your favorite recipes based on the <span class="w3-tag">ingredients you have!</span></h3>
	
	<div class="w3-container w3-padding w3-border">
	  	<div class="w3-container w3-padding w3-black">
	          <h4>List all ingredients you wish to use one-by-one:</h4>
	  	</div>
	  	
	  	<script type="text/javascript" src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		<c:if test="${not empty ingredients}">
		
			<table class="table table-striped">
				<tr>
					<th><h4>Ingredients</h4></th>
				</tr>
				<c:forEach items="${ingredients}" var="ingredient">
							<c id="ingredient">
							
							<tr>
								<td><h7>${ingredient}</h7></td>
							</tr>
							</c>
				</c:forEach>
			</table>
	  	</c:if>
	  	
	  	<form action="/" method="POST">
		   	<p><input class="w3-input w3-border" type="text" name="ingredient" placeholder="Enter ingredient" ></p>
		   	
		    <p><button type="submit" value="Submit" class="w3-button w3-block w3-border">Add Ingredient</button></p>
	  	</form> 
	  	<form action="/api" method="GET">
	  		<p><button type="submit" value="Submit" class="w3-button w3-block w3-cyan">Find Recipes!</button></p>
	  	</form>
	  </div>
	</div>
	
	<!-- Footer -->
	<footer class="w3-container w3-dark-grey" style="padding:32px">
	  <p>Built by <a href="https://github.com/risheeks" target="_blank">Risheek</a></p>
	</footer>
</body>
</html>