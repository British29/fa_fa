<?php 

	$db = new PDO('mysql:host=localhost;dbname=fafa', 'root', '');

$arr = array();

$idCooperative = $_GET['idCooperative'];


	$stmt = $db->query("SELECT * FROM membre WHERE idCooperative ='$idCooperative'");

	while ($row = $stmt->fetch()) {
	     $arr[] = $row ;
	    
	}

echo json_encode($arr);
?>