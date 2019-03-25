<?php

//Login Page Form Case

	if (isset($_POST['btnsignup'])) {
    header("Location: ../signup.php");
	}else{
	echo "Login feature unavailable at this time.";	
	}

?>