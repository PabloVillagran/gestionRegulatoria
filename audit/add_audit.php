<?php
include '../includes/db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $reg_id = $_POST['regulation-selection'];

    $sql = "INSERT INTO audits (id, date_init, institution_name, regulations_id) VALUES (null, now(), :name, :reg_id)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['name' => $name, 'reg_id' => $reg_id]);

    $auditId = $pdo->lastInsertId();

    $sql = "SELECT * FROM det_regulations WHERE regulations_id = :reg_id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['reg_id' => $reg_id]);
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($result as $row) {
        $sql = "INSERT INTO det_audit (id, check_mark, comments, audit_id, det_regulations_id) VALUES (null, 0, null, :audit_id, :det_regulations_id)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['audit_id' => $auditId, 'det_regulations_id' => $row['id']]);
    }

    header("Location: ./audit_execution.html?id=".$auditId);
}
?>