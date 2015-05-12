<?php
	require_once("loadDB.php");
	
	$qsParams = $_SERVER['QUERY_STRING'];
	//parse the qsParams
	// qsParams => associative array named $params
	parse_str($qsParams, $params);

	$queryString = prepareQuery($params);
	queryDB($queryString);
	
	function prepareQuery($qsp){
		//if we find the need to use query string values to filter our search
		//then we would need to search based on those values
		//for right now, just grab everything since its such a small db
		if(empty($qsp))
		{
			$queryString = "SELECT * FROM User";
		} else{
			$queryString = "SELECT * FROM User WHERE Username = '{$qsp['Username']}'";
		}
		
		return $queryString;
	}
	
	function queryDB($queryString){ 
		$db = openDB();
		$result = $db->query($queryString);
		$allRows = $result->fetchAll();
		$numFound = count($allRows);
		
		$results = array();
		// Loop through result set
		foreach ($allRows as $row){
			$filteredRow['ID'] = $row['ID'];
			$filteredRow['Username'] = $row['Username'];
			$filteredRow['Password'] = $row['Password'];
			$results[]=$filteredRow;
		}
		
		//associative array
		$array = array('status'=>'success', 'numFound'=>$numFound ,'results'=>$results);
		
		// convert array to JSON string
		$json = json_encode($array);
		header("content-type: application/json");
		echo $json;
	}
?>