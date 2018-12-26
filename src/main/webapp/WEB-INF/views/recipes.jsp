<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>

	<!-- Access the bootstrap Css like this, 
		Spring boot will handle the resource mapping automcatically -->
	<link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
	<link href="../resources/css/b2b2c.css" rel="stylesheet">
	<link href="../webjars/bootstrap/3.3.6/css/bootstrap.min.css"
		rel="stylesheet">
	<link rel="stylesheet"
		href="../webjars/bootstrap-social/4.12.0/bootstrap-social.css">
	<link href="../webjars/font-awesome/4.6.1/css/font-awesome.css"
		rel="stylesheet">
		
	<title>Soggy Apples</title>
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
	
	<c:url value="/css/main.css" var="jstlCss" />
	<link href="${jstlCss}" rel="stylesheet" />

</head>
<body>
	
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
	
	<h1 class="w3-xxxlarge w3-center"><b>ReciPete</b></h1>
	<h3 class=" w3-center">Find your favorite recipes based on the <span class="w3-tag">ingredients you have!</span></h3>
	
	<script type="text/javascript" src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<div class="w3-container w3-white w3-light-grey">
		<table class="table table-striped">
			<tr>
					<th>Image</th>
					<th>Label</th>
			</tr>
			<c:forEach items="${recipes}" var="recipe">
						<c id="recipe">
						
						<tr>
							<td><a href="/pick-${recipe.uri}" ><img height="100" width="100" src="${recipe.image_src}"/></a></td>
							<td>
								<table class="table">
									<tr><a href="/pick-${recipe.uri}" ><h6>${recipe.label}</h6></a></tr>
									<c:forEach items="${recipe.ingredients}" var="ingredient">
										<tr>${ingredient}</tr>
										<br>
									</c:forEach>
									<tr>
										<td><p style="color:red;">Additional Required Ingredients:</p></td>
										<td>
											<table class="table">
												<c:forEach items="${recipe.extraIng}" var="ing">
													<tr>${ing}</tr>
													<br>
												</c:forEach>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						</c>
			</c:forEach>
		</table>
	</div>
	
</body>

<footer class="w3-container w3-dark-grey" style="padding:32px">
  <p>Developed by <a href="https://github.com/risheeks" target="_blank">Risheek</a></p>
</footer>

</html>
