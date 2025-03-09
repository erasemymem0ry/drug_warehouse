<?php
include 'func_db.php';
$isDeleted = deleteDrugsRow($_GET['id']);
header("Location: .");
