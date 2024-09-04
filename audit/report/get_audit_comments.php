<?php
require '../../includes/db_connect.php';

if(isset($_GET['auditid'])){
    $id = $_GET['auditid'];
    $sql = "SELECT a.comments FROM det_audit a WHERE a.audit_id = :auditid and a.comments is not null and LENGTH(a.comments)>0 order by a.det_regulations_id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['auditid' => $id]);
    $regulations_det = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($regulations_det);
}else{
    echo json_encode(['error' => 'No audit id provided']);
}
?>