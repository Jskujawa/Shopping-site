<?php

session_start(); 

if(!isset($_SESSION['username']))
	{ $_SESSION['loginMessage'] = "Please Login First";
		header("Location: login.php");
		die();}

require_once  'php_files/dblogin.php';

$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);
$username = $_SESSION['username'];

$query = "SELECT * FROM customer JOIN account ON customer.customer_id = account.customer_id WHERE account.username = '$username'";

$result = $conn->query($query);
if(!$result) die($conn->error);
$row = $result->fetch_array(MYSQLI_ASSOC);


?>


<html>
	<head>
		<title>Account</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="stylesheet.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-show-password/1.0.3/bootstrap-show-password.min.js"></script>		
	</head>
	
	
	<body >
		<img  height='200' width='200' src = 'images/logo.png'></img> 	<!-- center this logo  -->
		
		
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-4 col-xs-12">
				      <!-- Blank row for spacing -->			
				</div>     
				<div class="col-sm-4 col-xs-12">
					<div class="panel panel-default text-center">
						<div class="panel-heading">
						  <h1>Your Account</h1>
						  <h3><font color="red">
							</font>
						  </h3>
						</div>
						
						<form class="panel-body" action="php_files/account_update.php" method='post'>
								<div class = "form-group">
									<input class="form-control" id="firstname" name="firstname" placeholder="<?php print $row['firstname']?>" type="text" required>
								</div>
								<div class = "form-group">	
									<input class="form-control" id="lastname" name="lastname" placeholder="<?php print $row['lastname']?>" type="text" required>
								</div>
								<div class = "form-group">
									<input class="form-control" id="email" name="email" placeholder="<?php print $row['email']?>" type="text" required>
								</div>
								<div class = "form-group">
									<input class="form-control" id="street" name="street" placeholder="<?php print $row['street']?>" type="text" required>
								</div>
								<div class = "form-group">
									<input class="form-control" id="city" name="city" placeholder="<?php print $row['city']?>" type="text" required>
								</div>
								<div class = "form-group">
									<input class="form-control" maxlength="2" id="state" name="state" placeholder="<?php print $row['state']?>" type="text" required>
								</div>
								<div class = "form-group">
									<input class="form-control" id="zipcode" name="zipcode" placeholder="<?php print $row['zipcode']?>" type="text" required>
								</div>
								<div class = "form-group">
									<input class="form-control" id="phone" name="phone" placeholder="<?php print $row['phone']?>" type="text">
								</div>
								<a href = 'login.php'> 
									<div class="panel-footer">
									<button class="btn btn-lg" type="submit">Submit</button>
									</div>
								</a>
							
						</form>      
					</div>       
					<div class="col-sm-4 col-xs-12">
						<!-- Blank row for spacing -->			
					</div>      
				</div>    
			</div>
		</div> <!-- end outer container-->
	</body>

</html>