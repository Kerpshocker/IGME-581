<?php
	require_once("loadDB.php");

	$un = sanitize_string($_GET['Username']);
	$pw = sanitize_string($_GET['Password']);
	
	$queryString = prepareQuery($un, $pw);
	queryDB($queryString);
	
	//save the new user who created an account
	function prepareQuery($un, $pw){
		$queryString = "INSERT INTO User VALUES \"" . $un . "\", \"" . $pw . "\"";
		
		return $queryString;
	}
	
	function queryDB($queryString){ 
		$db = openDB();
		$result = $db->query($queryString);
		
		echo $result;
	}
?>