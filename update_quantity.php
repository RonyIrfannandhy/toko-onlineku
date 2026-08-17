<?php
session_start();
include 'config.php';

header('Content-Type: application/json');

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Unauthorized']);
    exit();
}

$action = $_POST['action'] ?? '';
$cart_id = intval($_POST['cart_id'] ?? 0);
$user_id = $_SESSION['user_id'];

if ($action === 'remove') {
    $stmt = $conn->prepare("DELETE FROM cart WHERE id = ? AND user_id = ?");
    $stmt->bind_param("ii", $cart_id, $user_id);
    $success = $stmt->execute();
    echo json_encode(['success' => $success]);
    exit();
}

if ($action === 'update') {
    $qty = intval($_POST['quantity'] ?? 1);
    if ($qty < 1) $qty = 1;

    $stmt = $conn->prepare("UPDATE cart SET quantity = ? WHERE id = ? AND user_id = ?");
    $stmt->bind_param("iii", $qty, $cart_id, $user_id);
    $success = $stmt->execute();
    echo json_encode(['success' => $success]);
    exit();
}

echo json_encode(['success' => false, 'message' => 'Invalid action']);
?>