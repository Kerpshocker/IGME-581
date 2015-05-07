<?php
	require_once("loadDB.php");

	$name = $_POST['Name'];
	
	//save the new user who created an account
	function prepareQuery($un, $pw){
		$queryString = "INSERT INTO Profile VALUES \"" . $name . "\"";
		
		return $queryString;
	}
	
	function queryDB($queryString){ 
		$db = openDB();
		$result = $db->query($queryString);
		
		echo $result;
	}
?>