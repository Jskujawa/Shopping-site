<?php
session_start();

if(!isset($_SESSION['username']))
	{ $_SESSION['loginMessage'] = "Please Login First";
		header("Location: login.php");
		die();}
		
if($_SESSION['role']!='admin' and $_SESSION['role']!='customer' ){
	$_SESSION['loginMessage'] = "Access Restricted: Please Login First";
	header("Location: login.php");
	die();
}

require_once  'php_files/dblogin.php';

$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);


//print_r($_SESSION['cart']);
IF(!isset($_SESSION['cart']))
	{
	$_SESSION['cart'] = [];
	}


$cart = $_SESSION['cart'];

   /* foreach ($cart as $columnName => $columnData) {
		$query = "Select * FROM `product` where product_id = $columnData";
		$result = $conn->query($query);
		if(!$result) die($conn->error);
		$row = $result->fetch_array(MYSQLI_ASSOC);
        echo 'Product Name: ' . $row['product_name'] . ' Product Price: $' . $row['product_price'] . '<br />';
    }*/



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
	
	<div class="container-fluid">
			<div class="row">
				<div class="col-sm-4 col-xs-12">
				      <!-- Blank row for spacing -->			
				</div>     
				<div class="col-sm-4 col-xs-12">
					<div class="panel panel-default text-center">
						<div class="panel-heading">
						  <h1 >Shopping Cart</h1>
						  <h3><font color="red">
								<?php 
								//Returns invalid user/pass from login.php file if user not found
								
								if(empty($_SESSION['cart'])){
										echo "Nothing In Cart";
									} else{
										echo "";
									}
								?>
							</font>
						  </h3>
						</div>
						<div class="panel-body" >
							<?php
								$j=0;
								IF (!empty($cart)){
								foreach ($cart as $columnName => $columnData) {
								$query = "Select * FROM `product` where product_id = $columnData";
								$result = $conn->query($query);
								if(!$result) die($conn->error);
								$row = $result->fetch_array(MYSQLI_ASSOC);
								
								
								echo <<<_END
								<div class="row">
									<div class="col-md-6">
										<p>$row[product_name]<p/> 
									</div>	
									<div class="col-md-4">
										<p>$$row[product_price]</p>
									</div>
									<div class="col-md-2">
										<form id= "$j.form" name="myForm" method='post' action="php_files/removeFromCart.php">
											<button class = "btn btn-xs" id=$j.remove> Remove </button>
											<input type = 'hidden'  name='removeItem' value = $row[product_id]>
											<input type = 'hidden'  name='removeItem' value = $j>
										</form>
									</div>
								</div>
_END;
								$j++;
								//echo $row['product_name'] . '------- $' . $row['product_price'] . '<br />';
								}
								}
							?>
							<script>document.getElementById("$j.remove").onclick = function(){document.getElementById("$j.form").submit();};</script>
							<div class="panel-footer">
								<a href = 'checkout.php'> <button class="btn btn-lg" type="submit" name="btnsubmit">Checkout</button><a/>
								<br><br>
								<form action="php_files/emptyCart.php"><button class="btn btn-md" type="submit" name="emptycart" >Empty Cart</button> </form>								
							</div>
						</div>      
					</div>       
					<div class="col-sm-4 col-xs-12">
						<!-- Blank row for spacing -->			
					</div>      
				</div>    
			</div>
		</div> <!-- end outer container-->		
	
	
	
	
			<div class="container-fluid" style="text-align:center" >
		 <br><br><br>
		<?php
		/*
		echo <<<_END
				<div class="col-md-4">
				  <h4><strong>$row[1]</strong></h4>
				  <img id ="$j.image" height='150' width='200' src = 'images/giftCard.png'></img>
				  <form id= "$j.form" name="myForm" method='post' action="card-details.php">
					<input type = 'hidden'  name='cardDetail' value = $row[0]>
					 <p >$$row[3] - $row[4] points</p> 
				  </form>
				</div>
					<script>document.getElementById("$j.image").onclick = function(){document.getElementById("$j.form").submit();};</script>
_END;
		}*/
		?>
		</div>





</body>
</html>