<?php 

	$db = new PDO('mysql:host=localhost;dbname=fafa', 'root', '');

$arr = array();

$id = $_GET['id'];


	$stmt = $db->query("SELECT * FROM membre WHERE id ='$id'");

	while ($row = $stmt->fetch()) {
	     $arr[] = $row ;
	    
	}

echo json_encode($arr);
?>