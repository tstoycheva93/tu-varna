<!DOCTYPE html>
<html>
<head>
    <title>Въведи град</title>
</head>
<body>

<form action="input_town.php" method="post">
    Град: <input type="text" name="town"><br>
    <input type="submit" value="Въведи" name="input"> <br>
</form>

<?php
include 'config.php';
if (isset($_POST['input'])) {
$town = $_POST['town'];

$sql = "INSERT INTO towns (name)
VALUES ('$town')";

if ($conn->query($sql) === TRUE) {
    echo "<br>Успешно въвеждане! <br>";
} else {
    echo "Грешка: " . $sql . "<br>" . $conn->error;
}

$sql = "SELECT * FROM towns";
$result = $conn->query($sql);

echo "<table border='1'>";
echo "<tr><th>Номер</th><th>Град</th></tr>";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>".$row['id']."</td>";
        echo "<td>".$row['name']."</td>";
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='2'>0 results</td></tr>";
}
echo "<tr><td colspan='2'><a href='index.php'>Начало</a></td></tr>"; 
echo "</table>";

$conn->close();
}
?>


</body>
</html>