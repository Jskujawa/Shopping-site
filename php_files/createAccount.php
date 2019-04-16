<?php

require_once  'dblogin.php';

$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);

$username = $_POST["username"];
$password = $_POST["pwd"];
$cpassword = $_POST["cpwd"];//confirm password
$email = $_POST["email"];
$phone = $_POST["phone"];

/*echo $username."<br>";
echo $password."<br>";
echo $cpassword."<br>";
echo $email."<br>";
echo $phone."<br>";*/

session_start();

$query= "select * from account";//SQL query for password
		$result = $conn->query($query);
		if(!$result) die($conn->error);
		
$rows = $result->num_rows;
$unexists = 0; //username already exists
	
for($j=0; $j<$rows; $j++)
	{
		$result->data_seek($j); 
		$row = $result->fetch_array(MYSQLI_ASSOC);
		$dbusername = $row['username'];//name of column for MYSQLI_ASSOC, MYSQLI_NUM would be 3 for the 3rd column in database
		if ($dbusername == $username){
			$unexists = 1; //check for username already existing in db
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
	$query2 = "INSERT INTO account (username, password, role, customer_id) VALUES ('$username', '$password','customer', 1)"; //customer_id is placeholder for now
	
	$result2 = $conn->query($query2);
	if(!$result2) die($conn->error);	
	
	header("Location: ../login.php");
	$_SESSION['signupMessage'] = "";
}


$conn->close();







?>