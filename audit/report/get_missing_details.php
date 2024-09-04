<?php
require '../../includes/db_connect.php';

if(isset($_GET['auditid'])){
    $id = $_GET['auditid'];
    $sql = "SELECT b.description FROM det_audit a, det_regulations b WHERE a.audit_id = :auditid and b.id = a.det_regulations_id and a.check_mark = 0 and a.applies=1 order by a.det_regulations_id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['auditid' => $id]);
    $regulations_det = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($regulations_det);
}else{
    echo json_encode(['error' => 'No audit id provided']);
}
?>