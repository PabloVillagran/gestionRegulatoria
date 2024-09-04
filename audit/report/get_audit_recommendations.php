<?php
require '../../includes/db_connect.php';

if(isset($_GET['auditid'])){
    $id = $_GET['auditid'];
    $sql = "select res.description
        from (
            select r.description, count(1) c
            from det_audit a
            join det_regulations b on b.id = a.det_regulations_id
            join recommendations r on r.id = b.recommendation_id 
            where audit_id = :auditid
            and a.check_mark = 0
            group by r.description
        ) as res 
        order by res.c";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['auditid' => $id]);
    $regulations_det = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($regulations_det);
}else{
    echo json_encode(['error' => 'No audit id provided']);
}
?>