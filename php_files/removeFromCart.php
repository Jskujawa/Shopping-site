<?php
session_start();

if(!isset($_SESSION['username']))
	{ $_SESSION['loginMessage'] = "Please Login First";
		header("Location: login.php");
		die();}

if(!isset($_POST['removeItem']))
	{header("Location: shoppingcart.php");
		die();}
		
$removeIndex = $_POST['removeItem'];
$array = $_SESSION['cart'];

unset($array[$removeIndex]);
$array2 = array_values($array);


$_SESSION['cart'] = $array2;
//$_SESSION['cart'] = [8989,55,8989,55,8989];
header("Location: ../shoppingcart.php");


?>