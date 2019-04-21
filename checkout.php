<html>
<head>
	<meta charset="utf-8"> 
	<title>checkout</title> 
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="text-center">  
		<img src="./picture/logo.png" alt="brand" width="100" height="100">
		<h3>Check out</h3>
	</div>
<br>


<div id="Login" class="container">
	<div class="row">
		<form class="form-horizontal" role="form">
			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">Recipient Name:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="name" 
					placeholder="Please enter Recipient Name">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">Shipping Address:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="name" 
					placeholder="Please enter shipping address">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">Shipping Method:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="name" 
					placeholder="Regular / Express">
				</div>
			</div>

			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">Note:</label>
				<div class="col-sm-5">
					<textarea class="form-control" id="comments" name="comments" placeholder="Please enter Restaurant Descriotion" rows="5"></textarea><br>
				</div>
			
				<div class="form-group">
				<label for="name" class="col-sm-4 control-label">Payment method:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="name" 
					placeholder="Debit /Credit / Paypal">
					</div>
				</div>
			<div class="col-sm-offset-9 col-sm-4">
			<button class="btn" type="submit" name="btnsubmit">Submit</button>
			</div>
		</form>
	</div>
</div>



</body>
</html>
