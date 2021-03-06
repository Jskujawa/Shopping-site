<html>
	<head>
		<title>Sign Up</title>
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
						  <h1 >Sign Up</h1>
						  <h3><font color="red">
								<?php 
								session_start();
								if(empty($_SESSION['signupMessage'])){
										echo "";
									} else{
										echo $_SESSION['signupMessage'];
									}
								$_SESSION['signupMessage'] = "";
								?>
							</font>
						  </h3>
						</div>
						<form class="panel-body" action="php_files/createAccount.php" method='post'> 
								<div class = "form-group">
									<input class="form-control" id="Username" name="username" placeholder="Username" type="text" required>
								</div>
								<div class = "form-group">	
									<input class="form-control" id="Password" name="pwd" placeholder="Password" type="password" data-toggle="password" required>
								</div>
								<div class = "form-group">
									<input class="form-control" id="Confirm_password" name="cpwd" placeholder="Confirm Password" type="password" data-toggle="password" required>
								</div>
								<div class = "form-group">
									<input class="form-control" id="FirstName" name="fname" placeholder="First Name" type="text" required>
								</div>
								<div class = "form-group">
									<input class="form-control" id="LastName" name="lname" placeholder="Last Name" type="text" required>
								</div>
								<div class = "form-group">
									<input class="form-control" id="email" name="email" placeholder="Email Address" type="text" required>
								</div>
								<div class = "form-group">
									<input class="form-control" id="Address" name="address" placeholder="Street Address" type="text" required>
								</div>
								<div class = "form-group">
									<input class="form-control" id="City" name="city" placeholder="City" type="text" required>
								</div>
								<div class = "form-group">
									<input class="form-control" maxlength="2" id="State" name="state" placeholder="State(XX)" type="text" required>
								</div>
								<div class = "form-group">
									<input class="form-control" id="Zip" name="zip" placeholder="Zip Code" type="text" required>
								</div>
								<div class = "form-group">
									<input class="form-control" id="phone" name="phone" placeholder="Phone Number(##########)" type="text" required>
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
   				
		<!-- Added in Password visibility toggle -->	
		<script type="text/javascript"> 
			$("#password").password('toggle');
		</script>
		
	</body>

</html>

