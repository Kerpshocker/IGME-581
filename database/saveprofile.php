<?php
	require_once("loadDB.php");
	
	$qsParams = $_SERVER['QUERY_STRING'];
	parse_str($qsParams, $params);
	
	//query db
	if(!empty($params))
	{
		$queryString = prepareQuery($params);
		queryDB($queryString);
	}
	
	//save the new user who created an account
	function prepareQuery($qsp){
		$queryString = "INSERT INTO Profile (Name, Location, Phone) VALUES ('{$qsp['Username']}', '{$qsp['Location']}', 'Please enter a phone number')";
		
		return $queryString;
	}
	
	function queryDB($queryString){ 
		$db = openDB();
		$result = $db->query($queryString);
	}
?>