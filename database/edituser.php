<?php
	require_once("loadDB.php");

	$qsParams = $_SERVER['QUERY_STRING'];
	parse_str($qsParams, $params);
	
	$queryString = prepareQuery($params);
	queryDB($queryString);
	
	//save the new user who created an account
	function prepareQuery($qsp){
		$queryString = "UPDATE User SET Username='{$qsp['Username']}', Password='{$qsp['Password']}' WHERE ID={$qsp['ID']}";
		
		return $queryString;
	}
	
	function queryDB($queryString){ 
		$db = openDB();
		$result = $db->query($queryString);
	}
?>