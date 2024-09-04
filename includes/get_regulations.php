<?php
include 'db_connect.php';

$sql = "SELECT * FROM regulations";
$stmt = $pdo->query($sql);
$regulations = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($regulations);
?>
