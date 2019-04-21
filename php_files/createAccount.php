<?php

require_once  'dblogin.php';

$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);

$username = $_POST["username"];
$password = $_POST["pwd"];
$cpassword = $_POST["cpwd"];//confirm password
$fname = $_POST["fname"];
$lname = $_POST["lname"];
$email = $_POST["email"];
$address = $_POST["address"];
$city = $_POST["city"];
$state = $_POST["state"];
$zip = $_POST["zip"];
$phone = $_POST["phone"];

session_start();

$query= "select * from account";//SQL query for password
		$result = $conn->query($query);
		if(!$result) die($conn->error);
		
$rows = $result->num_rows;
$unexists = 0; //check if username already exists, default of 0 is no
	
for($j=0; $j<$rows; $j++)
	{
		$result->data_seek($j); 
		$row = $result->fetch_array(MYSQLI_ASSOC);
		$dbusername = $row['username'];//name of column for MYSQLI_ASSOC, MYSQLI_NUM would be 3 for the 3rd column in database
		if ($dbusername == $username){
			$unexists = 1; //set the check to yes(1) if username is already found
		break;
		}
	}



if ($password != $cpassword){
	$_SESSION['signupMessage'] = "Passwords do not match";
	header("Location: ../signup.php");
	}
elseif($unexists == 1){
	$_SESSION['signupMessage'] = "Username already exists";
	header("Location: ../signup.php");
	
}else{
	//code to add account to db
	//need to work on query to insert into both customer and account. Should insert into customer first, then lookup customer_id for account from customer table
	$query = "SELECT MAX(customer_id)+1 as customer_id FROM customer;";
		$result = $conn->query($query);
		if(!$result) die($conn->error);
		$row = $result->fetch_array(MYSQLI_ASSOC);
		$newCustId = $row['customer_id']; //Essentially a manually done AutoIncrement so I can insert across two tables
	
	$query2 = "INSERT into customer (`customer_id`,`campaign_id`, `firstname`, `lastname`, `email`, `street`, `city`, `state`, `zipcode`, `phone`) 
			VALUES ('$newCustId',1,'$fname','$lname','$email','$address','$city','$state','$zip','$phone');";
		$result2 = $conn->query($query2);
		if(!$result2) die($conn->error);			
	
	//$query3 = "SELECT customer_id FROM customer where firstname = '$fname'"; 
	//YET TO BE DONE: Take max customer_id before inserting customer row, then use that max +1 as new customer id. essentially an autoincrement, but can insert across tables
	
	$query4 = "INSERT INTO account (username, password, role, customer_id) VALUES ('$username', '$password','customer', '$newCustId');"; //customer_id is placeholder for now
		$result4 = $conn->query($query4);
		if(!$result4) die($conn->error);
	
	
	header("Location: ../login.php");
	$_SESSION['signupMessage'] = "";
}


$conn->close();







?>