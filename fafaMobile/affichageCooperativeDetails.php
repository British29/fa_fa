<?php 

	$db = new PDO('mysql:host=localhost;dbname=fafa', 'root', '');


$id =$_GET['id'];
	$stmt = $db->prepare("SELECT * FROM cooperative WHERE id='$id' ");

$stmt->execute(['id' => $id]); 
$cooperative = $stmt->fetchAll();
	    


echo json_encode($cooperative);
?>