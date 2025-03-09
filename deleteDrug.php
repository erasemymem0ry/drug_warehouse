<?php
include 'func_db.php';
$isDeleted = deleteDrugsRow($_GET['id']);
header("Location: .");

if(!$isDeleted) {
  echo "<script>alert('Ошибка при удалении')</script>";
}
