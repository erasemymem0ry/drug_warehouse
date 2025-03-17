<?php
include 'func_db.php';
$manufacturers = getManufacturers();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        label {
            font-weight: 700;
            margin: 3px;
            display: inline-block;
            width: 210px;
        }
    </style>
</head>

<body>
    <form action="addDrug.php" method="post">
        <div><label for="name">Название: </label><input type="text" name="name"></div>
        <div><label for="manufacturer">Производитель: </label>
            <select name="manufacturer">
                <?php
                foreach ($manufacturers as $m) {
                    $key = $m['id'];
                    $val = $m['name'];
                    echo "<option value='$key'>$val</option>";
                }

                ?>
            </select>

        </div>
        <div><label for="purpose">Назначение: </label><input type="text" name="purpose"></div>
        <div><label for="category">Категория: </label><input type="text" name="category"></div>
        <div><label for="unit_of_measurement">Ед. измерения: </label><input type="text" name="unit_of_measurement">
        </div>
        <div><label for="purchase_price">Закупочная стоимость: </label><input type="text" name="purchase_price"></div>
        <div><label for="selling_price">Реализационная стоимость: </label><input type="text" name="selling_price"></div>
        <div><input type="submit" value="Добавить в таблицу"></div>
    </form>
</body>

</html>
