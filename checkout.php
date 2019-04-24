<?php
session_start(); 

if(!isset($_SESSION['username']))
	{ $_SESSION['loginMessage'] = "Please Login First";
		header("Location: login.php");}

require_once  'php_files/dblogin.php';
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
				<a href = 'clothes_list.php'> 
					<input type="button" value="Find More Clothes"/>
				</a>
			</span>
	</div>
	<div class="text-center">  
		<img src="./picture/logo.png" alt="brand" width="100" height="100">
		<h5>Suburban Outfitters</h5>	
	</div>
	

<div id="Login" class="container">
	<div class="row">
		<form class="form-horizontal" role="form" method='post' action='checkout.php'>
			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">Payment type:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="payment_type" name="payment_type"
					placeholder="Please enter Payment type">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">First name:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="firstname" name="firstname"
					placeholder="Please enter First name">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">Last name:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="lastname" name="lastname"
					placeholder="Please enter Last name:">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">Card Number:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="card_number" name="card_number"
					placeholder="Please enter Card Number">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">Expiration:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="expiration" name="expiration"
					placeholder="Please enter Expiration">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">Security Code:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="security_code" name="security_code"
					placeholder="Please enter Security Code">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<input type='hidden' name='checkout' value='yes'>
					<button type="submit" class="btn btn-primary">Check Out</button>
				</div>
			</div>
		</form>
	</div>
</div>

<?php
//connect to db
$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);

if(isset($_POST['checkout'])) 
{


	$payment_type = $_POST['payment_type'];
	$firstname = $_POST['firstname'];
	$lastname = $_POST['lastname'];
	$card_number = $_POST['card_number'];
	$expiration = $_POST['expiration'];
	$security_code = $_POST['security_code'];
	
	$username = $_SESSION['username'];
	$query_id="select customer_id from account where username='$username' ";
	$result_id = $conn->query($query_id);
	if(!$result_id) die($conn->error);
	$rows_id = $result_id->num_rows;
	$customer_ids=array();
	for($i=0; $i<$rows_id; $i++){
		$row = $result_id->fetch_array(MYSQLI_ASSOC);
		$id = $row['customer_id'];
		$customer_ids[] = $id;
		}	
	$customer_id = $customer_ids[0];

	$query = "INSERT INTO payment_method (payment_type, firstname, lastname, card_number,expiration,security_code,customer_id) VALUES ('$payment_type', '$firstname','$lastname', '$card_number','$expiration','$security_code','$customer_id')";
	
	$result = $conn->query($query); 
	if(!$result) die($conn->error);
	
	$cart = $_SESSION['cart'];
	IF (empty(!$cart)){
	foreach ($cart as $columnName => $columnData) {		
	$product_id=$columnData;
	$quantity=1;
	
	$query2 = "INSERT INTO orderline (product_id, quantity) VALUES ('$product_id', '$quantity')";
	$result2 = $conn->query($query2);
	if(!$result2) die($conn->error);
	}
	
	header("Location: confirm.php");
	
	
}

$conn->close();
}
?>
