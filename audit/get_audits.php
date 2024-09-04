<?php
include '../includes/db_connect.php';

if(isset($_GET['l'])) {#limite de registros
    $l = $_GET['l'];
    $sql = "SELECT * FROM audits a limit :l";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['l' => $l]);
    $regulations_det = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($regulations_det);
}else{
    $sql = "SELECT a.id, a.institution_name, a.date_init, b.name FROM audits a JOIN regulations b on a.regulations_id = b.id order by a.date_init desc limit 5";
    $stmt = $pdo->query($sql);
    $regulations_det = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($regulations_det);
}
?>