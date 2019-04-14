<?php

//Login Page Form Case
require_once  'dblogin.php';

$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);



$username = $_POST["username"];
$password = $_POST["pwd"];

	if (isset($_POST['btnsignup'])) {
		header("Location: ../signup.php");
	}else{
		//echo $username;
		//echo "<br>";
		//echo $password;
		//echo "<br>";
		
		$query= "select password from account where username='$username' ";
		$result = $conn->query($query);
		$row = $result->fetch_array(MYSQLI_ASSOC);
		
		if ($password = $row['password']) {
			session_start();//this must be called anywhere you want to use a session
			$_SESSION['username'] = $user;	
			$_SESSION['password'] = $tmp_password;
			$_SESSION['loginMessage'] = "";
			header("Location: ../clothes_list.php");
		}
		else {	
			session_start();		
			//echo $row['password'];
			//echo "<br>Unsuccessful Login";
			$_SESSION['loginMessage'] = "Invalid Username/Password";
			header("Location: ../login.php");
		}
	}
	
$conn->close();
?>