<?php
	require_once("loadDB.php");

	$queryString = prepareQuery();
	queryDB($queryString);
	
	//this will be edited later on when we have more data in the DB
	//this will have to order the users that we retrieve by match percentage
	//and any other rules we place on the search
	function prepareQuery(){
		//if we find the need to use query string values to filter our search
		//then we would need to search based on those values
		//for right now, just grab everything since its such a small db
		$queryString = "SELECT * FROM User";
		
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
			$filteredRow['Name'] = $row['Name'];
			$filteredRow['Age'] = $row['Age'];
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