<?php
session_start(); 

if(!isset($_SESSION['username']))
	{ $_SESSION['loginMessage'] = "Please Login First";
		header("Location: login.php");
		die();}

require_once  'php_files/dblogin.php';

$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);

$productId = '8989' ;//$_POST['productId']; product ID from clothes-list page. Placeholder for now

$query = "SELECT * from `product` where product_id = $productId LIMIT 1"; 
$result = $conn->query($query);
if(!$result) die($conn->error);
$row = $result->fetch_array(MYSQLI_ASSOC);

$query2 = "Select * from `inventory` where product_id = $productId LIMIT 1";
$result2 = $conn->query($query2);
if(!$result2) die($conn->error);
$inv = $result2->fetch_array(MYSQLI_ASSOC);

$conn->close();

?>


<html>
<head>
	<meta charset="utf-8"> 
	<title>Clothes Detail</title>
</title> 
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
					<input type="button" value="View Shopping Cart"/>
				</a>
		</span>
	</div>

	<div class="text-center">  
		<img src="./picture/logo.png" alt="brand" width="100" height="100">
		<h5>Suburban Outfitters</h5>
	</div>
    <br>
    <br>
    <br>

<div class="container">
	<div class = "row">
		<div class=" col-sm-4">              
			<img src="./picture/dress.jpg" class="img-response" alt="Airaisa" width="350" height="470"> 
		</div>	
		<div class="col-sm-8">
			<h1><strong><?php echo $row['product_name']?></strong></h1>
			<h3><?php echo "Price: ".'$'.$row['product_price']?></h3>
			<h3><?php echo "Quantity Remaining: ".$inv['quantity_on_hand']?></h3>
    <br>
    <br>
    <br>
    <br>			
		<form action="php_files/AddToCart.php" method="POST"> 
			<input type = 'hidden' name='productId' value =<?php print $row['product_id'];?>>
			<input type = 'hidden' name='price' value =<?php print $row['product_price'];?>>
			<input type = 'hidden' name='qtyOnHand' value =<?php print $inv['quantity_on_hand'];?>>
			 <div class=" col-sm-4">
				<button class="btn-lg" type="submit" name="btnsubmit">Add to Cart</button>
			</div>
				<!--REMOVING BELOW CODE FOR SIZE AND QTY AS OUR DATABASE HAS NO FUNCTIONALITY FOR THIS
				<div>
				<label>Size/Colour:</label> 
				<select name=""> 
					<option value="0">S</option> 
					<option value="1">M</option> 
					<option value="2">L</option> 
				</select> 
			</div>
			<div>
				<label>Quantity:</label> 
				<select name=""> 
					<option value="0">1</option>
					<option value="1">2</option> 
					<option value="2">3</option> 
            </select> 
			</div>
			<br>
			<br> -->
			
		</form> 
		</div>
	</div>
	<br>
	<br>
	<div class='col-sm-8'>
		<h4>Description: </h4>
		<p>Imported, designed in USA </p>
        <p>Garment Care: Machine Washable (Recommended Hand Wash), Low iron if necessary<p>
        <p>FOR THE OCCASION: It's a Sexy party dresses for prom, cocktail, evening, ceremony and dinner etc. Sarin Mathews Women Off The Shoulder Short Sleeve High Low Cocktail Skater Dress. Skater dresses are perfect party dresses to stand out in crowd. Features: Off the Shoulder, Off Shoulder, Unique HIGH LOW Hem, Asymmetry Hem, Short Sleeve, High Low Skater, Flared Swing, Above Knee Length, Party Dress, Evening Dress, High Low Homecoming A Line Dress.</p>
	</div>
</div>
</body>
</html>
