<?php

//Login Page Form Case

	if (isset($_POST['btnsignup'])) {
    echo file_get_contents("../signup.php");
	}else{
	echo "Login feature unavailable at this time.";	
	}

?>