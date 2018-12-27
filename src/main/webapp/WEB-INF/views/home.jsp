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
.custom-select {
  position: relative;
  font-family: Arial;
}

.custom-select select {
  display: none; /*hide original SELECT element: */
}

.select-selected {
  background-color: DodgerBlue;
}

/* Style the arrow inside the select element: */
.select-selected:after {
  position: absolute;
  content: "";
  top: 14px;
  right: 10px;
  width: 0;
  height: 0;
  border: 6px solid transparent;
  border-color: #fff transparent transparent transparent;
}

/* Point the arrow upwards when the select box is open (active): */
.select-selected.select-arrow-active:after {
  border-color: transparent transparent #fff transparent;
  top: 7px;
}

/* style the items (options), including the selected item: */
.select-items div,.select-selected {
  color: #ffffff;
  padding: 8px 16px;
  border: 1px solid transparent;
  border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
  cursor: pointer;
}

/* Style items (options): */
.select-items {
  position: absolute;
  background-color: DodgerBlue;
  top: 100%;
  left: 0;
  right: 0;
  z-index: 99;
}

/* Hide the items when the select box is closed: */
.select-hide {
  display: none;
}

.select-items div:hover, .same-as-selected {
  background-color: rgba(0, 0, 0, 0.1);
}


</style>

<body>
	
	
	
	<!-- w3-content defines a container for fixed size centered content, 
	and is wrapped around the whole page content, except for the footer in this example -->
	
	  
	    <h1 class="w3-xxxlarge w3-center"><b>ReciPete</b></h1>
	    <h3 class=" w3-center">Find your favorite recipes based on the <span class="w3-tag">ingredients you have!</span></h3>
	
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
	
	<div class="w3-container w3-padding w3-border">
	  	<div class="w3-container w3-padding w3-cyan">
	          <h4>List all ingredients you wish to use one-by-one:</h4>
	          
	  	</div>
	  	
	  	<script type="text/javascript" src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
	  	<br>
	  	
	  	<div style="display: flex;">
	  	</div>
	  	
	  	<div style="display: flex;">
			<div style="flex: 1; display: inline-block; padding: 1rem;">
				<form action="/api" method="GET">
					<h4>Diet:</h4>
					<div class="custom-select" style="width:200px;">
					<select name="type" style="color:cyan">
					  <option value="4">balanced</option>
					  <option value="1">low-sodium</option>
					  <option value="2">low-carb</option>
					  <option value="3">low-fat</option>
					  <option value="5">high-protein</option>
					  <option value="6">high-fiber</option>
					</select>
					</div>
					<fieldset>
			                <legend>Health Preferences</legend>      
			                <input type="checkbox" name="vegan" value="vegan">&nbsp; Vegan &nbsp; &nbsp; &nbsp;
			                <input type="checkbox" name="veg" value="veg">&nbsp; Vegetarian &nbsp; &nbsp; &nbsp;
			                <input type="checkbox" name="peanut" value="peanut">&nbsp; Peanut-free &nbsp; &nbsp; &nbsp;
			        </fieldset>
					<h4>Main Ingredient:</h4>
					<p><input class="w3-input w3-border" type="text" name="main" placeholder="Enter main ingredient" ></p>
					<p><button id="search" type="submit" value="Submit" class="w3-button w3-block w3-cyan">Find Recipes!</button></p>
				</form>
			</div>
			
			<div style="flex: 1; display: inline-block; padding: 1rem;">
			  	<form action="/" method="POST">
			  		<h4>Other Ingredients:</h4>
			  		<p><input class="w3-input w3-border" type="text" name="ingredient" placeholder="Enter ingredient" ></p>
					<p><button type="submit" value="Submit" class="w3-button w3-block w3-border">Add Ingredient</button></p>
				</form>
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
				
			</div>
	  	</div>
	  	
	  	
	  	
	  	<br>
	  </div>
	
	<!-- Footer -->
	<footer class="w3-container w3-dark-grey" style="padding:32px">
	  <p>Built by <a href="https://github.com/risheeks" target="_blank">Risheek</a></p>
	</footer>
		
</body>

<<script type="text/javascript">
<!--

//-->
var x, i, j, selElmnt, a, b, c;
/* Look for any elements with the class "custom-select": */
x = document.getElementsByClassName("custom-select");
for (i = 0; i < x.length; i++) {
  selElmnt = x[i].getElementsByTagName("select")[0];
  /* For each element, create a new DIV that will act as the selected item: */
  a = document.createElement("DIV");
  a.setAttribute("class", "select-selected");
  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
  x[i].appendChild(a);
  /* For each element, create a new DIV that will contain the option list: */
  b = document.createElement("DIV");
  b.setAttribute("class", "select-items select-hide");
  for (j = 1; j < selElmnt.length; j++) {
    /* For each option in the original select element,
    create a new DIV that will act as an option item: */
    c = document.createElement("DIV");
    c.innerHTML = selElmnt.options[j].innerHTML;
    c.addEventListener("click", function(e) {
        /* When an item is clicked, update the original select box,
        and the selected item: */
        var y, i, k, s, h;
        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
        h = this.parentNode.previousSibling;
        for (i = 0; i < s.length; i++) {
          if (s.options[i].innerHTML == this.innerHTML) {
            s.selectedIndex = i;
            h.innerHTML = this.innerHTML;
            y = this.parentNode.getElementsByClassName("same-as-selected");
            for (k = 0; k < y.length; k++) {
              y[k].removeAttribute("class");
            }
            this.setAttribute("class", "same-as-selected");
            break;
          }
        }
        h.click();
    });
    b.appendChild(c);
  }
  x[i].appendChild(b);
  a.addEventListener("click", function(e) {
    /* When the select box is clicked, close any other select boxes,
    and open/close the current select box: */
    e.stopPropagation();
    closeAllSelect(this);
    this.nextSibling.classList.toggle("select-hide");
    this.classList.toggle("select-arrow-active");
  });
}

function closeAllSelect(elmnt) {
  /* A function that will close all select boxes in the document,
  except the current select box: */
  var x, y, i, arrNo = [];
  x = document.getElementsByClassName("select-items");
  y = document.getElementsByClassName("select-selected");
  for (i = 0; i < y.length; i++) {
    if (elmnt == y[i]) {
      arrNo.push(i)
    } else {
      y[i].classList.remove("select-arrow-active");
    }
  }
  for (i = 0; i < x.length; i++) {
    if (arrNo.indexOf(i)) {
      x[i].classList.add("select-hide");
    }
  }
}

/* If the user clicks anywhere outside the select box,
then close all select boxes: */
document.addEventListener("click", closeAllSelect);

</script>

</html>