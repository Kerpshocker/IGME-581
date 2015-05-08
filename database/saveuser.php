<?php
	require_once("loadDB.php");
	
	$params = $_SERVER['QUERY_STRING'];
	
	//query db
	$qs = prepareQuery();
	queryDB($qs, $params);
	
	//save the new user who created an account
	function prepareQuery(){
		$queryString = "INSERT INTO User (Username, Password) VALUES (:Username, :Password)";
		
		return $queryString;
	}
	
	function queryDB($queryString, $params){ 
		//parse the params into an assoc array
		$qry = queryToArray($params);
	
		$db = openDB();
		$stmt = $db->prepare($queryString);
		$stmt->bindParam(':Username', $un);
		$stmt->bindParam(':Password', $pw);
		
		$un = sanitize_string($qry['Username']);
		$pw = sanitize_string($qry['Password']);
		
		if(!empty($un) && !empty($pw)){	
			$stmt->execute();
		}
	}
?>