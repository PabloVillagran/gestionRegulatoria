<?php
include '../includes/db_connect.php';

if(isset($_GET['id'])){
    $id = $_GET['id'];
    $sql = "SELECT a.id, a.applies, a.check_mark, a.comments, a.audit_id, a.det_regulations_id, b.description, c.institution_name FROM det_audit a, det_regulations b, audits c WHERE a.audit_id = :id and b.id = a.det_regulations_id and c.id = a.audit_id order by a.det_regulations_id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['id' => $id]);
    $regulations_det = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($regulations_det);
}else{
    echo json_encode(['error' => 'No audit id provided']);
}

?>