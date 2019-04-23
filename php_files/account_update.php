<?php

require_once  'dblogin.php';

session_start(); 

if(!isset($_SESSION['username']))
	{ $_SESSION['loginMessage'] = "Please Login First";
		header("Location: ../login.php");
		die();}
		
$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);

if(isset($_POST["btnback"])){
	header("Location: ../clothes_list.php");
}

if(isset($_POST["btnsubmit"])){
	
	$firstname = $_POST['firstname'];
	$lastname = $_POST['lastname'];
	$email = $_POST['email'];
	$street = $_POST['street'];
	$city = $_POST['city'];
	$state = $_POST['state'];
	$zipcode = $_POST['zipcode'];
	$phone = $_POST['phone'];
	$customer_id = $_POST['customer_id'];
	
	$query = "UPDATE customer SET firstname='$firstname', lastname='$lastname', email='$email', street='$street', city='$city', state='$state', zipcode='$zipcode', phone=$phone WHERE customer_id=$customer_id";
	
	
	$result = $conn->query($query);
	if(!$result) die($conn->error);
	
	header("Location: ../clothes_list.php");		
}else{
	echo "Unsuccessful update";
}









?>