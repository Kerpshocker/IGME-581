<?php
	require_once("loadDB.php");
	
	$qsParams = $_SERVER['QUERY_STRING'];
	//parse the qsParams
	// qsParams => associative array named $params
	parse_str($qsParams, $params);

	$queryString = prepareQuery($params);
	queryDB($queryString);
	
	function prepareQuery($qsp){
		if(empty($qsp)){
			$queryString = "SELECT * FROM Profile";
		} else{
			$queryString = "SELECT * FROM Profile WHERE ID = {$qsp['ID']}";
		}
		
		return $queryString;
	}
	
	function queryDB($queryString){
		$db = openDB();
		$results = $db->query($queryString);
		$allRows = $results->fetchAll();
		$numFound = count($allRows);
		
		$results = array();
		
		foreach($allRows as $row){
			$filteredRow['ID'] = $row['ID'];
			$filteredRow['Name'] = $row['Name'];
			$filteredRow['Interests'] = $row['Interests'];
			$filteredRow['Location'] = $row['Location'];
			$filteredRow['Phone'] = $row['Phone'];
			$filteredRow['CurrentMatches'] = $row['CurrentMatches'];
			
			$results[] = $filteredRow;
		}
		
		$array = array('status'=>'success', 'numFound'=>$numFound, 'results'=>$results);
		
		$json = json_encode($array);
		header("content-type: application/json");
		echo $json;
	}

?>