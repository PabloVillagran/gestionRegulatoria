<?php
include '../includes/db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $description = $_POST['description'];
    $reg_id = $_POST['regulation-id'];

    $sql = "INSERT INTO det_regulations (id, Description, regulations_id) VALUES (null, :description, :reg_id)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['description' => $description, 'reg_id' => $reg_id]);

    header("Location: ./regulation_det.html?rg=$reg_id");
    exit();
}
?>