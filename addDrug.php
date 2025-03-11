<?php
include 'func_db.php';
addDrug(
    $_POST['name'],
    $_POST['manufacturer'],
    $_POST['purpose'],
    $_POST['category'],
    $_POST['unit_of_measurement'],
    $_POST['purchase_price'],
    $_POST['purchase_price']
);
header("Location: .");