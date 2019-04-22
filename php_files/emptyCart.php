<?php
session_start();
if(!isset($_SESSION['username']))
	{ $_SESSION['loginMessage'] = "Please Login First";
		header("Location: login.php");
		die();}

IF (isset($_SESSION['cart'])){ $_SESSION['cart']= [];}
header("Location: ../shoppingcart.php");


?>