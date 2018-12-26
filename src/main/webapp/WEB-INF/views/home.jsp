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

.slider {
  -webkit-appearance: none;
  appearance: none;
  width: 100%;
  height: 25px;
  background: #D3D3D3;
  outline: none;
  opacity: 0.7;
  -webkit-transition: .2s;
  transition: opacity .2s;
}

.slider:hover {
  opacity: 1;
}

.slider::-webkit-slider-thumb {
  -webkit-appearance: none;
  appearance: none;
  width: 25px;
  height: 25px;
  background: #47ed52;
  cursor: pointer;
}

.slider::-moz-range-thumb {
  width: 25px;
  height: 25px;
  background: #47ed52;
  cursor: pointer;
}

.sliderticks {
  display: flex;
  justify-content: space-between;
  padding: 0 10px;
}

.sliderticks p {
  position: relative;
  display: flex;
  justify-content: center;
  text-align: center;
  width: 1px;
  background: #D3D3D3;
  height: 10px;
  line-height: 40px;
  margin: 0 0 20px 0;
}

</style>

<body background="food.jpg">
	
	
	<nav class="navbar navbar-inverse">
		<div class="container">
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="/">Home</a></li>
					<li><a href="/about">About</a></li>
				</ul>
			</div>
		</div>
	</nav>
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
		
	  	<br>
	  	
	  	<div style="display: flex;">
	  	</div>
	  	
	  	<div style="display: flex;">
			<div style="flex: 1; display: inline-block; padding: 1rem;">
				<form action="/api" method="GET">
					<div style="display: flex;">
						<div style="flex: 1; display: inline-block; padding: 1rem;">
							<div class="range" style="width: 100%;">
						  	  <h4>Food Type:</h4>
							  <input type="range" min="1" max="6" value="4" class="slider" name="type" id="type">
							  <div class="sliderticks">
							    <p>1</p>
							    <p>2</p>
							    <p>3</p>
							    <p>4</p>
							    <p>5</p>
							    <p>6</p>
							  </div>
							</div>
						</div>
					</div>
					<fieldset>      
			                <legend>Health Preferences</legend>      
			                <input type="checkbox" name="vegan" value="Cats">&nbsp Vegan &nbsp &nbsp &nbsp
			                <input type="checkbox" name="veg" value="Dogs">&nbsp Vegetarian &nbsp &nbsp &nbsp
			                <input type="checkbox" name="peanut" value="Birds">&nbsp Peanut-free &nbsp &nbsp &nbsp
			        </fieldset>
					<h4>Main Ingredient:</h4>
					<p><input class="w3-input w3-border" type="text" name="main" placeholder="Enter main ingredient" ></p>
					<p><button id="search" type="submit" value="Submit" class="w3-button w3-block w3-cyan">Find Recipes!</button></p>
				</form>
			</div>
			
			<div style="flex: 1; display: inline-block; padding: 1rem;">
			  	<form action="/" method="POST">
			  		<div style="display: flex;">
				  		<div style="flex: 1; display: inline-block;">
						  	<p>1- low-sodium</p>
						  	<p>2- low-carb</p>
						  	<p>3- low-fat</p>
						  	<p>4- balanced</p>
						  	<p>5- high-protein</p>
						  	<p>6- high-fiber</p>
						</div>
					</div>
			  		<h4>Other Ingredients:</h4>
			  		<p><input class="w3-input w3-border" type="text" name="ingredient" placeholder="Enter ingredient" ></p>
					<p><button type="submit" value="Submit" class="w3-button w3-block w3-border">Add Ingredient</button></p>
				</form>
			</div>
	  	</div>
	  	
	  	<c:if test="${not empty ingredients}">
		
			<table class="table table-striped">
				<tr>
					<th><h4>Ingredients</h4></th>
					<th></th>
				</tr>
				<c:forEach items="${ingredients}" var="ingredient">
							<c id="ingredient">
							
							<tr>
								<td><p>${ingredient}</h7></p>
								<td>
									<button type="button" class="close" aria-label="Close" onclick="location.href='/remove-${ingredient}'">
									  <span aria-hidden="true">&times;</span>
									</button>
								</td>
							</tr>
							<tr>
								
							</tr>
							</c>
				</c:forEach>
			</table>
	  	</c:if>
	  	
	  	<br>
	  </div>
	</div>
	
	<!-- Footer -->
	<footer class="w3-container w3-dark-grey" style="padding:32px">
	  <p>Built by <a href="https://github.com/risheeks" target="_blank">Risheek</a></p>
	</footer>
		
</body>
</html>