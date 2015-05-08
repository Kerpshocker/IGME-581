<?php
	require_once("loadDB.php");
	
	$queryString = prepareQuery($un, $pw);
	queryDB($queryString);
	
	//save the new user who created an account
	function prepareQuery(){
		$queryString = "INSERT INTO User VALUES (:Username, :Password)";
		
		return $queryString;
	}
	
	function queryDB($queryString){ 
		$db = openDB();
		$stmt = $db->prepare($queryString);
		$stmt->bindParam(':Username', $un);
		$stmt->bindParam(':Password', $pw);
		
		$un = sanitize_string($_GET['Username']);
		$pw = sanitize_string($_GET['Password']);
		
		if(!empty($un) && !empty($pw)){	
			$stmt->execute();
		} else {
			echo "Please enter a username and password.";
		}
	}
?>