<?php
include './db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $country = $_POST['country'];
    $date = $_POST['date'];

    $sql = "INSERT INTO regulations (name, country, date) VALUES (:name, :country, :date)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['name' => $name, 'country' => $country, 'date' => $date]);

    header("Location: ../regulation.html");
    exit();
}
?>