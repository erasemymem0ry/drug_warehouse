<?PHP
include 'func_db.php';

$drugsTable = getDrugs();
$drugsRow = getDrugsRow(4);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Лекарства</title>
</head>

<body style="margin:10px;">
    <a href="addDrugPage.php">Добавить лекарство</a>
    <h1>Лекарства</h1>
    <table class="table">
        <th>ID</th>
        <th>Название</th>
        <th>Производитель</th>
        <th>Назначение</th>
        <th>Категория</th>
        <th>Ед. измерения</th>
        <th>Закупочна стоимость</th>
        <th>Реализационная стоимость</th>
        <?php foreach ($drugsTable as $row) {
            echo "<tr>";
            foreach ($row as $val) {
                echo "<td>$val</td>";
            }
            $drugID = $row['drug_id'];
            echo "<td><a href=\"deleteDrug.php?id=$drugID\">Удалить</a></td>";
            echo "</tr>";
        }

        ?>
    </table class="table">
    <h1>Лекарство</h1>
    <table>
        <th>ID</th>
        <th>Название</th>
        <th>Производитель</th>
        <th>Назначение</th>
        <th>Категория</th>
        <th>Ед. измерения</th>
        <th>Закупочна стоимость</th>
        <th>Реализационная стоимость</th>
        <?php foreach ($drugsRow as $row) {
            echo "<tr>";
            foreach ($row as $val) {
                echo "<td>$val</td>";
            }
            echo "</td>";
        } ?>
    </table>
</body>

</html>
