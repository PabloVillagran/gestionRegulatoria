<?php
require '../../includes/db_connect.php';

if(isset($_GET['auditid'])){
    $auditId = $_GET['auditid'];
    $sql = "SELECT count(1) cheks
        FROM det_audit 
        WHERE audit_id = :auditId
        AND applies = 1
        AND check_mark = 1";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['auditId' => $auditId]);
    $audit_report = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $checks = $audit_report[0]['cheks'];

    $sql = "SELECT count(1) uncheks 
        FROM det_audit 
        WHERE audit_id = :auditId
        AND applies = 1
        AND check_mark = 0";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['auditId' => $auditId]);
    $audit_report = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $uncheks = $audit_report[0]['uncheks'];

    $sql = "SELECT count(1) not_applies 
        FROM det_audit 
        WHERE audit_id = :auditId
        AND applies = 0";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['auditId' => $auditId]);
    $audit_report = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $not_applies = $audit_report[0]['not_applies'];

    $labels = ['Cumple', 'No cumple', 'No aplica'];
    $data = [$checks, $uncheks, $not_applies];;

    echo json_encode(["labels" => $labels, "data" => $data]);
}else{
    echo json_encode(['error' => 'No audit id provided']);
}

?>