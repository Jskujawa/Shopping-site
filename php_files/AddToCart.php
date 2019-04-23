<?php
require_once  'dblogin.php';

$productId = $_POST['productId'];
$productPrice = $_POST['price'];
$qtyOnHand = $_POST['qtyOnHand'];

session_start(); 

if(!isset($_SESSION['username']))
	{ $_SESSION['loginMessage'] = "Please Login First";
		header("Location: ../login.php");
		die();}
		
//Check if quantity_on_hand > 0, if not send back to clothes_list		
if($qtyOnHand<=0){
	 $_SESSION['clothesListMessage'] = "Sorry, we have no more of that item in stock";
		header("Location: ../clothes_list.php");
		die();
	}	

echo $productId."<br>" ;
echo $productPrice."<br>" ;
echo $qtyOnHand."<br>" ;
		
//$conn = new mysqli($hn, $un, $pw, $db);
//if($conn->connect_error) die($conn->connect_error);
 IF( !empty($_SESSION['cart'])){
	 array_push($_SESSION['cart'],$productId );	 
 }
 else{
	 $_SESSION['cart'] = [$productId];
 }
//Add productId to session variable that is an array
 //$_SESSION['cart'] = [$productId];
//$_SESSION['cart'] = [$productId,85,55];
//print_r($_SESSION['cart']);//going to use cart array variable in the session 
//$conn->close();
 $_SESSION['clothesListMessage'] = "Item successfully added to cart";

 header("Location: ../clothes_list.php");

?>