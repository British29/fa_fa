<?php 

$db_name = "fafa";
$db_server = "localhost";
$db_user = "root";
$db_pass = "";

$db = new PDO("mysql:host={$db_server};dbname={$db_name};charset=utf8", $db_user, $db_pass);
$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


$idCooperative = $_POST['idCooperative'];
$nom = $_POST['nom'];
$prenom = $_POST['prenom'];
$numero = $_POST['numero'];


$stmt = $db->prepare("INSERT INTO membre (idCooperative, nom, prenom, numero) VALUES (?, ?, ?, ?)");
$result = $stmt->execute([$idCooperative, $nom ,$prenom ,$numero]);

echo json_encode([
'success' => $result
]);

?>