<?php
	require_once("loadDB.php");

	$qsParams = $_SERVER['QUERY_STRING'];
	parse_str($qsParams, $params);
	
	$queryString = prepareQuery($params);
	queryDB($queryString);
		
	function prepareQuery($qsp){
		$queryString = "UPDATE Profile SET Interests='{$qsp['Interests']}', Name='{$qsp['Name']}', Location='{$qsp['Location']}', Phone='{$qsp['Phone']}' WHERE ID={$qsp['ID']}";
		
		return $queryString;
	}

	function queryDB($queryString){ 
		$db = openDB();
		$result = $db->query($queryString);
	}
?>