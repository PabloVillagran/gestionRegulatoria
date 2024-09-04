<?php   
require_once '../includes/db_connect.php';

function updateChecked($id, $pdo){
    $sql = "UPDATE det_audit SET check_mark = 1 WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['id' => $id]);
}

function updateComment($id, $comment, $pdo){
    $sql = "UPDATE det_audit SET comments = :comment WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['id' => $id, 'comment' => $comment]);
}

function updateApplies($id, $pdo){
    $sql = "UPDATE det_audit SET applies = 1 WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['id' => $id]);
}

// setea todos a 0 para luego setear los que estan en el post
$sql = "UPDATE det_audit set check_mark = 0 where audit_id = :audit_id";
$stmt = $pdo->prepare($sql);
$stmt->execute(['audit_id' => $_POST['audit_id']]);

// setea todos los aplicados a 1 para luego setear los que estan en el post
$sql = "UPDATE det_audit set applies = 0 where audit_id = :audit_id";
$stmt = $pdo->prepare($sql);
$stmt->execute(['audit_id' => $_POST['audit_id']]);

// for each element in the post array parse id-{id} and comment-{id} to get values
foreach ($_POST as $key => $value) {
    if (strpos($key, 'id-') !== false) {
        $id = substr($key, 3);
        updateChecked($id, $pdo);
    }else if(strpos($key, 'comment-') !== false){
        $id = substr($key, 8);
        updateComment($id, $value, $pdo);
    }else if(strpos($key, 'applies-') !== false){
        $id = substr($key, 8);
        updateApplies($id, $pdo);
    }
} 

header("Location: ./audit_execution.html?id=".$_POST['audit_id']);
?>