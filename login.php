<html>
	<head>
		<title>Suburban Outfitters Login</title>
		<link rel="stylesheet" href='../styles.css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	
	<body>
	
		<div class="jumbotron text-center">
		<img  height='200' width='200' src = 'logo.png'></img>
			<h1>Suburban Outfitters</h1> 
			<p>Clothing for every ordinary occasion.</p> 
		</div>
		
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-4 col-xs-12">
				      <!-- Blank row for spacing -->			
				</div>     
				<div class="col-sm-4 col-xs-12">
					<div class="panel panel-default text-center">
						<div class="panel-heading">
						  <h1 >Login</h1>
						</div>
						<form class="panel-body" action="php_files/loginPHP.php" method='post'>
								<div class = "form-group">
									<input class="form-control" id="Username" name="username" placeholder="Username" type="text">
								</div>
								<div class = "form-group">	
									<input class="form-control" id="Password" name="pwd" placeholder="Password" type="password">
								</div>
							<div class="panel-footer">
								<button class="btn btn-lg" type="submit" name="btnsubmit">Login</button>
								<form action="signup.php"><button class="btn btn-lg" type="submit" name="btnsignup" >Sign Up</button> </form>								
							</div>
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