<?php 

	$db = new PDO('mysql:host=localhost;dbname=fafa', 'root', '');

$arr = array();

	$stmt = $db->query("SELECT * FROM cooperative");

	while ($row = $stmt->fetch()) {
	     $arr[] = $row ;
	    
	}

echo json_encode($arr);
?>