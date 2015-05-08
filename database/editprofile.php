<?php
	require_once("loadDB.php");

	$interests = $_GET['Interests'];
	$name = $_GET['Name'];
	$town = $_GET['Town'];
	$phone = $_GET['Phone'];
		
	function prepareQuery($un, $pw){
		$queryString = "INSERT INTO Profile (Interests, Name, Town, Phone) VALUES (\"" . $interests . "\",\"" . $name . "\",\"" . $town . "\",\"" . $phone . "\")";
	
		return $queryString;
	}

	function queryDB($queryString){ 
		$db = openDB();
		$result = $db->query($queryString);
	}
?>