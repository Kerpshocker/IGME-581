<?php
	require_once("loadDB.php");
	
	$qsParams = $_SERVER['QUERY_STRING'];
	
	//query db
	$queryString = prepareQuery();
	queryDB($queryString, $qsParams);
	
	//save the new user who created an account
	function prepareQuery(){
		$queryString = "INSERT INTO Profile (Name, Location) VALUES (:Username, :Location)";
		
		return $queryString;
	}
	
	function queryDB($queryString, $qsParams){ 
		//parse the params into an assoc array
		parse_str($qsParams, $params);
	
		$db = openDB();
		$stmt = $db->prepare($queryString);
		$stmt->bindParam(':Username', $un);
		$stmt->bindParam(':Location', $loc);
		
		$un = sanitize_string($params['Username']);
		$loc = "Rochester NY";
		
		if(!empty($un) && !empty($loc)){	
			$stmt->execute();
		}
	}
?>