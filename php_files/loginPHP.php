<?php

//Login Page Form Case

	if (isset($_POST['btnsignup'])) {
    echo file_get_contents("../html_files/signup.html");
	}else{
	echo "Login feature unavailable at this time.";	
	}

?>