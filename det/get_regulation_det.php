<?php
include '../includes/db_connect.php';

if(isset($_GET['reg'])) {
    $regId = $_GET['reg'];
    $sql = "SELECT * FROM det_regulations WHERE regulations_id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['id' => $regId]);
    $regulations_det = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($regulations_det);
}else{
    echo json_encode(['error' => 'No regulation id provided']);
}
?>