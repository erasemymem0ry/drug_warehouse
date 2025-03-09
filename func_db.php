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
        mysqli_query($link, "DELETE FROM drugs WHERE drug_id = $id");
    } catch (Exception $e) {
        die("Ошибка: " . $e->getMessage());
    }

    closeDB();
}

?>
