<?php
	require_once("loadDB.php");
	
	$params = $_SERVER['QUERY_STRING'];
	
	//query db
	$qs = prepareQuery();
	queryDB($qs, $params);
	
	//save the new user who created an account
	function prepareQuery(){
		$queryString = "INSERT INTO Profile (Name, Location) VALUES (:Username, :Location)";
		
		return $queryString;
	}
	
	function queryDB($queryString, $params){ 
		//parse the params into an assoc array
		$qry = queryToArray($params);
	
		$db = openDB();
		$stmt = $db->prepare($queryString);
		$stmt->bindParam(':Username', $un);
		$stmt->bindParam(':Location', $loc);
		
		$un = sanitize_string($qry['Username']);
		$loc = "Rochester NY";
		
		if(!empty($un) && !empty($loc)){	
			$stmt->execute();
		}
	}
?>