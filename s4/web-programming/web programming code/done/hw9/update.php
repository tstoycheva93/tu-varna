<?php
include "config.php";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM books";
$result = $conn->query($sql);

echo "<table border='1'>";
echo "<tr><th>Номер</th><th>Заглавие</th><th>Автор</th><th>Издателство</th><th>Година</th></tr>";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>".$row['id']."</td>";
        echo "<td>".$row['title']."</td>";
        echo "<td>".$row['author']."</td>";
        echo "<td>".$row['publisher']."</td>";
        echo "<td>".$row['year_published']."</td>";
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='5'>0 results</td></tr>";
}
echo "<tr><td colspan='5'><a href='edit.php'>Редактиране</a></td></tr>"; 
echo "<tr><td colspan='5'><a href='index.php'>Начало</a></td></tr>"; 
echo "</table>";
$conn->close();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Редактиране на издател</title>
</head>
<body>
</body>
</html>

