<?php
require_once  'dblogin.php';

session_start(); 

if(!isset($_SESSION['username']))
	{ $_SESSION['loginMessage'] = "Please Login First";
		header("Location: ../login.php");
		die();}
		
$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);

		
if(isset($_POST["btnupdate2"])){
	
	$product_id = $_POST['product_id'];
	$product_name = $_POST['product_name'];
	$product_price = $_POST['product_price'];
	//$product_color = $_POST['product_color'];
	//$product_description = $_POST['product_description'];
	//$product_image = $_POST['product_image'];
		
	//$query = "UPDATE product SET product_name='$product_name', product_price='$product_price', product_color='$product_color', product_description='$product_description', product_image='$product_image' WHERE product_id=$product_id";
	$query = "UPDATE product SET product_name='$product_name', product_price='$product_price' WHERE product_id=$product_id";

	
	$result = $conn->query($query);
	if(!$result) die($conn->error);
	
	header("Location: ../clothes_list.php");		
}else{
	echo "Unsuccessful update";
}

?>