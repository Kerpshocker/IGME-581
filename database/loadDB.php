<?php
	define("PATH_TO_DB", "MEU.sqlite");
	
	function openDB() {
		if(file_exists(PATH_TO_DB)) {
			//open the file
			$db = new PDO('sqlite:' . PATH_TO_DB);
		} else {
			try {
				// create the database
				$db = new PDO('sqlite:' . PATH_TO_DB);
				
				echo "NO TABLE EXISTS.";
			} catch (PDOException $e) {
				echo 'Exception: ' . $e->getMessage();
			}
		}
		
		return $db;
	}
	
	/*
	* Parse out url query string into an associative array
	*
	* $qry can be any valid url or just the query string portion.
	* Will return false if no valid querystring found
	*
	* @param $qry String
	* @return Array
	*/
	function queryToArray($qry){
		$result = array();
		
		//string must contain at least one '=' and cannot be in the first pos
		if(strpos($qry, '=')){
			if(strpos($qry, '?') !== false ){
				$q = parse_url($qry);
				$qry = $q['query'];
			} else{
				//no '?'
				return false;
			}
		}
		
		foreach(explode('&', $qry) as $couple){
			list($key, $val) = explode('=', $couple);
			$result[$key] = $val;
		}
		
		return empty($result) ? false : $result;
	}
	
	//this will be used to filter out the bs entered by users from query params
	function sanitize_string($str) {
		$str = urldecode($str); 	// %20 to space, %7E to ~, etc...
		$str = trim($str); 			// get rid of leading and trailing spaces
		$str = strip_tags($str); 	// get rid of HTML and PHP tags
		$str = addslashes($str); 	// add backslashes to (i.e. escape) quotes
		return $str;
	}
?>