<?php

//Login Page Form Case
require_once  'dblogin.php';

$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);

//pulling in username and pass from login
$username = $_POST["username"];
$password = $_POST["pwd"];

	if (isset($_POST['btnsignup'])) {
		//send to signup.php if signup button clicked
		header("Location: ../signup.php");
	}else{
		$query= "select password from account where username='$username' ";//SQL query for password
		$result = $conn->query($query);
		$row = $result->fetch_array(MYSQLI_ASSOC);
		
		if ($password = $row['password']) {
			//set up username and password session variables and send to clothes_list
			session_start();
			$_SESSION['username'] = $username;	
			$_SESSION['password'] = $password;
			$_SESSION['loginMessage'] = "";
			header("Location: ../clothes_list.php");
		}
		else {	
			//send back error message if user/pass combo not found in DB
			session_start();		
			$_SESSION['loginMessage'] = "Invalid Username/Password";
			header("Location: ../login.php");
		}
	}
	
$conn->close();
?>