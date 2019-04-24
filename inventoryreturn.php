<?php

require_once 'php_files/dblogin.php';


session_start(); 

if(!isset($_SESSION['username']))
	{ $_SESSION['loginMessage'] = "Please Login First";
		header("Location: ../login.php");
		die();}

if($_SESSION['role']!='admin' and $_SESSION['role']!='customer' ){
	$_SESSION['loginMessage'] = "Access Restricted: Please Login First";
	header("Location: login.php");
	die();
}


$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);



if(isset($_POST["btnsubmit"])){
	$return_id = $_POST['return_id'];
	$inventory_id = $_POST['inventory_id'];
	$return_date = $_POST['return_date'];
	$return_amount = $_POST['return_amount'];
	$quantity  = $_POST['quantity'];
	$order_id = $_POST['order_id'];

	$query = "UPDATE inventoryreturn SET return_id='$return_id', inventory_id='$inventory_id', return_date=$'return_date', return_amount=$'return_amount', quantity=$'quantity'; WHERE order_id=$'order_id'";


	
$result = $conn->query($query);
if(!$result) die($conn->error);
	
}else{

echo "Return Unavailable";


}

?>