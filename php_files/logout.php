<?php

session_start();
if(isset($_SESSION['username'])){
	
	$username = $_SESSION['username'];
	destroy_session_and_data();
	header("Location: ../login.php");
}else{
	
	echo "username not in session <br >";
}


function destroy_session_and_data(){

	$_SESSION = array();
	setcookie(session_name(), '', time()-2592000,'/');
	session_destroy(); 
}

?>