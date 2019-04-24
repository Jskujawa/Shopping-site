<?php
session_start(); 

if(!isset($_SESSION['username']))
	{ $_SESSION['loginMessage'] = "Please Login First";
		header("Location: login.php");
		die();}

if($_SESSION['role']!='admin'){
	$_SESSION['clothesListMessage'] = "Access Restricted to Administrators";
	header("Location: clothes_list.php");
	die();
}

require_once  'php_files/dblogin.php';

$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);

if(isset($_POST["btnupdate"])){
	
	$product_id = $_POST['product_id'];
	//$product_name = $_POST['product_name'];
	//$product_price = $_POST['product_price'];
	//$product_color = $_POST['product_color'];
	//$product_description = $_POST['product_description'];
	//$product_image = $_POST['product_image'];

}


?>




<html>
<head>
	<meta charset="utf-8"> 
	<title>Suburban Outfitters</title>
</title> 
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>


	<div class="text-center">  
		<img src="./picture/logo.png" alt="brand" width="100" height="100">
		<h5>Suburban Outfitters</h5>
	</div>
    <br>
    <br>
    <br>

<div class="container">
	<div class="col-sm-12 col-xs-12">
		<div class="panel panel-default text-center">
			<div class="panel-heading">
				 <h1 >Clothes Update</h1>
					<h3><font color="red"></font></h3>
			</div>
			<form class="panel-body" action="php_files/clothes_update.php" method='post'>
			<div class = "form-group">
				<input class="form-control" id="p_id" name="product_id" value="<?php print intval($product_id)?>" type="hidden">
			</div> 	
			<div class = "form-group">
				<input class="form-control" id="p_name" name="product_name" placeholder="Product Name" type="text">
			</div>
			<div class = "form-group">	
				<input class="form-control" id="p_price" name="product_price" placeholder="Product Price" type="number">
			</div>
			<!--
			<div class = "form-group">	
				<input class="form-control" id="p_color" name="product_color" placeholder="Product Color" type="text">
			</div>
			<div class = "form-group">	
				<input class="form-control" id="p_description" name="product_description" placeholder="Product Description" type="text">
			</div>
			<div class = "form-group">	
				<input class="form-control" id="p_image" name="product_image" placeholder="Product Image" type="text">
			</div>
			-->
			<div class="panel-footer">
				<button class="btn btn-lg" type="submit" name="btnupdate2">Update</button>
				<form action="delete.php"><button class="btn btn-lg" type="submit" name="btndelete" >Delete</button> </form>								
			</div>
			</form>
		</div>
	</div>	
</div>
</body>
</html>
