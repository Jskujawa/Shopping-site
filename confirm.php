<?php
session_start(); 

if(!isset($_SESSION['username']))
	{ $_SESSION['loginMessage'] = "Please Login First";
		header("Location: login.php");}

	$_SESSION['cart']=[];

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
	<br>
	<br>
	<br>
	<div class = "row">
		<div class="col-sm-offset-1 col-sm-1">              
			<img src="./picture/logo.png" alt="brand" width="100" height="100">
		</div>	
		<div class="col-sm-5">
			<h1>Congratulations!</h1>
			<p>Your order has been successfully submitted.</p>
        <div>
	<div>

<br>	
<br>		
<br>
		<div class="col-sm-offset-9 col-sm-8">
			<button class="btn" type="submit" name="btnsubmit" onclick="location.href='clothes_list.php'">Back</button>
		</div>
	</div>



</body>
</html>
