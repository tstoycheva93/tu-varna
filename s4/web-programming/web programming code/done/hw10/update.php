<!DOCTYPE html>
<html>
<head>
    <title>Редактиране</title>
</head>
<body>
</body>
</html>
<?php
include 'config.php';

$search_company = "Лазур";

$sql = "SELECT * FROM providers WHERE company = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $search_company);
$stmt->execute();
$result = $stmt->get_result();

echo "<table border='1'>";
echo "<tr><th>Фирма</th><th>Булстат</th><th>Лице за контакти</th></tr>";

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>".$row['company']."</td>";
        echo "<td>".$row['bulstat']."</td>";
        echo "<td>".$row['contact']."</td>";
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='3'>Няма доставчик ".$search_company."</td></tr>";
}
echo "<tr><td colspan='3'><a href='update_provider.php'>Редактиране</a></td></tr>"; 
echo "<tr><td colspan='3'><a href='index.php'>Начало</a></td></tr>"; 
echo "</table>";

$stmt->close();
$conn->close();
?>
