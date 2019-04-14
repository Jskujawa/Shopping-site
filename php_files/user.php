<?php

require_once 'dblogin.php';

$conn = new mysqli($hn, $un, $pw, $db);
if ($conn->connect_error) die($conn->connect_error);

class User{
	
	public $username; 
	public $roles = array();
	
	function __construct($username){
		global $conn;
				
		$this->username = $username;
		
		$query="select role from account where username='$username' ";
		//echo $query.'<br>';
		$result = $conn->query($query);
		if(!$result) die($conn->error);
			
		$rows = $result->num_rows;		
		
		for($i=0; $i<$rows; $i++){
			$row = $result->fetch_array(MYSQLI_ASSOC);
			$role = $row['role'];
			$this->roles[] = $role;
		}		
		
		
	}

	function getRoles(){
		return $this->roles;
	}

}


//$user = new User('bsmith');
//$roles = $user->getRoles();
//print_r($roles);















?>