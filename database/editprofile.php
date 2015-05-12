<?php
	require_once("loadDB.php");

	$qsParams = $_SERVER['QUERY_STRING'];
	parse_str($qsParams, $params);
	
	$queryString = prepareQuery($params);
	queryDB($queryString);
	
	function prepareQuery($qsp){
		$interests = "Interests='{$qsp['Interests']}'";
		$name = "Name='{$qsp['Name']}'";
		$location = "Location='{$qsp['Location']}'";
		$phone = "Phone='{$qsp['Phone']}'";
		$matches = "CurrentMatches='{$qsp['CurrentMatches']}'";
	
	
		$queryString = "UPDATE Profile SET " . $interests . ", " . $name . ", " . $location . ", " . $phone . ", " .  $matches . "WHERE ID={$qsp['ID']}";
		
		echo $queryString;
		
		return $queryString;
	}

	function queryDB($queryString){ 
		$db = openDB();
		$result = $db->query($queryString);
	}
?>