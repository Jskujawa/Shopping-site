<?php
session_start(); 

if(!isset($_SESSION['username']))
	{ $_SESSION['loginMessage'] = "Please Login First";
		header("Location: login.php");}

require_once  'php_files/dblogin.php';

$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);

$query = "SELECT * FROM `product`";
$result=$conn->query($query); 
if(!$result) die($conn->error);

//echo "this works";

$rows = $result->num_rows;

$conn->close();

?>


<html>
<head>
	<meta charset="utf-8"> 
	<title>Clothes Lists</title> 
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div>
		<span>
				<span>
					Current User:   <strong>
						<?php 
						IF(isset($_SESSION['username'])){
						echo $_SESSION['username'];
						}?></strong>
					<a href = 'php_files/logout.php'> <input type="button" value="Logout"/></a>
				</span>
				<a href = 'account.php'> 
					<input type="button" value="Your Account"/>
				</a>
				<a href = 'shoppingcart.php'> 
					<input type="button" value="Shopping Cart"/>
				</a>
			</span>
	</div>
<div class="text-center">  
	<img src="./picture/logo.png" alt="brand" width="100" height="100">
	<h5>Suburban Outfitters</h5>
</div>
 
<div class="container">
	<div class="col-sm-3">    
		<a href="clothes_detail.html"><img src="./picture/4.jpg" class="img-response" alt="clothesreview" width="190" height="30"></a>
		<a href="clothes_detail.html"><h2>Clothes Classify</h2></a>  
		<p> Suburban Outfitters is an American fashion clothes company, founded in 2018 as a dress store operated by Jared, Amelia, Preston and Xinyi in Salt lake city, Utah, United States.</p>
	</div>
	<div class="col-sm-6">    
		<div id="myCarousel" class="carousel slide">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>   
		<div class="carousel-inner">
			<div class="item active">
				<img src="./picture/1.jpg" alt="First slide">
			</div>
			<div class="item">
				<img src="./picture/2.jpg" alt="Second slide">
			</div>
			<div class="item">
				<img src="./picture/3.jpg" alt="Third slide">
			</div>
    </div>
		<a class="carousel-control left" href="#myCarousel" 
       data-slide="prev"> <span _ngcontent-c3="" aria-hidden="true" class="glyphicon glyphicon-chevron-right"></span></a>
		<a class="carousel-control right" href="#myCarousel" 
       data-slide="next">&rsaquo;</a>
	</div>
	</div>
 	<div class="col-sm-3">    
		<a href="clothes_detail.html"><img src="./picture/8.jpg" class="img-response" alt="clothesreview" width="200" height="90"></a>
		<a href="clothes_detail.html"><img src="./picture/5.jpg" class="img-response" alt="clothesreview" width="200" height="25"></a>
		<a href="clothes_detail.html"><img src="./picture/7.jpg" class="img-response" alt="clothesreview" width="200" height="90"></a>
		
	</div>



        <div class="container">
	         <div class="col-sm-offset-4 col-sm-4">
		         <ul class="pagination">
			        <li><a href="#">&laquo;</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
			</div>
		</div>
		

		<br>
		<br>
		<br>
	<div class = "row">
		<div class="col-sm-3">    
			<a href="clothes_detail.php"><img src="./picture/9.jpg" class="img-response" alt="foodreview" width="190" height="200
			"></a>
			<a href="clothes_detail.php"><h2>$49.99</h2></a>  
			<p> Beautiful summer dress with Length:Short Material:Polyester Style:Boho Details:Belted, Knot Pattern </p>
		</div>
	
		<div class="col-sm-3">    
			<a href="clothes_detail.php"><img src="./picture/9.jpg" class="img-response" alt="foodreview" width="190" height="200
			"></a>
			<a href="clothes_detail.html"><h2>$49.99</h2></a>  
			<p> Beautiful summer dress with Length:Short Material:Polyester Style:Boho Details:Belted, Knot Pattern</p>
		</div>
	
		<div class="col-sm-3">    
			<a href="clothes_detail.html"><img src="./picture/9.jpg" class="img-response" alt="foodreview" width="190" height="200
			"></a>
			<a href="clothes_detail.html"><h2>$49.99</h2></a>  
			<p> Beautiful summer dress with Length:Short Material:Polyester Style:Boho Details:Belted, Knot Pattern </p>
        </div>
		
		<div class="col-sm-3">    
			<a href="clothes_detail.html"><img src="./picture/9.jpg" class="img-response" alt="foodreview" width="190" height="200
			"></a>
			<a href="clothes_detail.html"><h2>$49.99</h2></a>  
			<p> Beautiful summer dress with Length:Short Material:Polyester Style:Boho Details:Belted, Knot Pattern </p>
		</div>
	</div>
	
	<div class = "row">

		<div class="col-sm-3">    
			<a href="clothes_detail.html"><img src="./picture/9.jpg" class="img-response" alt="foodreview" width="190" height="200
			"></a>
			<a href="clothes_detail.html"><h2>$49.99</h2></a>  
			<p> Beautiful summer dress with Length:Short Material:Polyester Style:Boho Details:Belted, Knot Pattern </p>
		</div>
		<div class="col-sm-3">    
			<a href="clothes_detail.html"><img src="./picture/9.jpg" class="img-response" alt="foodreview" width="190" height="200
			"></a>
			<a href="clothes_detail.html"><h2>$49.99</h2></a>  
			<p> Beautiful summer dress with Length:Short Material:Polyester Style:Boho Details:Belted, Knot Pattern</p>
		</div>
		<div class="col-sm-3">    
			<a href="clothes_detail.html"><img src="./picture/9.jpg" class="img-response" alt="foodreview" width="190" height="200
			"></a>
			<a href="clothes_detail.html"><h2>$49.99</h2></a>  
			<p> Beautiful summer dress with Length:Short Material:Polyester Style:Boho Details:Belted, Knot Pattern </p>
        </div>
		<div class="col-sm-3">    
			<a href="clothes_detail.html"><img src="./picture/9.jpg" class="img-response" alt="foodreview" width="190" height="200
			"></a>
			<a href="clothes_detail.html"><h2>$49.99</h2></a>  
			<p> Beautiful summer dress with Length:Short Material:Polyester Style:Boho Details:Belted, Knot Pattern </p>
		</div>
	</div>
</div>
</body>
</html>
