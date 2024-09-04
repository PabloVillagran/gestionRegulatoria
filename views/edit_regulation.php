<?php
include '../config/config.php';

$id = $_GET['id'] ?? null;

if ($_SERVER['REQUEST_METHOD'] === 'POST' && $id) {
    $name = $_POST['name'];
    $country = $_POST['country'];
    $date = $_POST['date'];

    $sql = "UPDATE regulations SET name = :name, country = :country, date = :date WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['name' => $name, 'country' => $country, 'date' => $date, 'id' => $id]);

    header('Location: index.html');
}

if ($id) {
    $sql = "SELECT * FROM regulations WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['id' => $id]);
    $regulation = $stmt->fetch();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Normativa</title>
    <link rel="stylesheet" href="../styles/styles.css">
</head>
<body>
    <header>
        <h1>Editar Normativa</h1>
    </header>
    <main>
        <?php if ($regulation): ?>
            <form method="POST">
                <input type="hidden" name="id" value="<?= htmlspecialchars($regulation['id']) ?>">
                <label for="name">Nombre:</label>
                <input type="text" id="name" name="name" value="<?= htmlspecialchars($regulation['name']) ?>" required>
                <label for="country">País:</label>
                <input type="text" id="country" name="country" value="<?= htmlspecialchars($regulation['country']) ?>" required>
                <label for="date">Fecha de Publicación:</label>
                <input type="date" id="date" name="date" value="<?= htmlspecialchars($regulation['date']) ?>" required>
                <button type="submit">Actualizar Normativa</button>
            </form>
        <?php else: ?>
            <p>Normativa no encontrada.</p>
        <?php endif; ?>
    </main>
</body>
</html>
