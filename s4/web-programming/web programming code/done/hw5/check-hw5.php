<!DOCTYPE html>
<head>
<title>Триъгълник</title>
</head>
<body>

<?php
include 'functions-hw5.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $side1 = $_POST["side1"];
    $side2 = $_POST["side2"];
    $side3 = $_POST["side3"];

    $area = calculateTriangleArea($side1, $side2, $side3);
    $type = determineTriangleType($side1, $side2, $side3);

    echo " $type <br>";
    echo "Лицето на триъгълника е $area кв.см.";
}
?>
</body>
</html>
