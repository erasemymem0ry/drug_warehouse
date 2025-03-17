<?php

$link = false;

function openDB()
{
    global $link;

    $link = mysqli_connect("localhost", "root", "", "pharmacy_warehouse");
    mysqli_query($link, "SET NAMES UTF8");
}

function closeDB()
{
    global $link;
    $link = false;
}

function getDrugs()
{
    global $link;
    openDB();

    $result = mysqli_query($link, "SELECT * FROM drugs");

    closeDB();
    return mysqli_fetch_all($result, MYSQLI_ASSOC);
}

function getDrugsRow($id)
{
    global $link;
    openDB();

    $result = mysqli_query($link, "SELECT * FROM drugs WHERE drug_id = $id");

    closeDB();
    return mysqli_fetch_all($result, MYSQLI_ASSOC);
}

function deleteDrugsRow($id)
{
    global $link;
    openDB();

    try {
        $isDeleted = mysqli_query($link, "DELETE FROM drugs WHERE drug_id = $id");
    } catch (Exception $e) {
        die("Ошибка: " . $e->getMessage());
    } finally {
        closeDB();
        return $isDeleted;
    }
}

function addDrug($name, $manufacturer, $purpose, $category, $unit_of_measurement, $purchase_price, $selling_price)
{
    global $link;
    openDB();

    try {
        mysqli_query($link, "
        INSERT INTO drugs SET
        name = '$name',
        manufacturer_id = '$manufacturer',
        purpose = '$purpose',
        category = '$category',
        unit_of_measurement = '$unit_of_measurement',
        purchase_price = '$purchase_price',
        selling_price = '$selling_price'
        ");
    } catch (Exception $e) {
        die("Ошибка: " . $e->getMessage());
    }
    closeDB();
}

function getManufacturer($id)
{
    global $link;
    openDB();

    $result = mysqli_query($link, "SELECT name FROM manufacturer WHERE id = $id");

    closeDB();
    return mysqli_fetch_row($result);

}

function getManufacturers()
{
    global $link;
    openDB();

    $result = mysqli_query($link, "SELECT * FROM manufacturer");

    closeDB();
    return mysqli_fetch_all($result, MYSQLI_ASSOC);

}
?>
