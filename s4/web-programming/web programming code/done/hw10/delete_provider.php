<?php
include "config.php";

$companyToDelete = "Орхидея";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "DELETE FROM providers WHERE company ='$companyToDelete'";
if ($conn->query($sql) === TRUE) {
    echo "Успешно изтриване!";

    $sql = "SELECT * FROM providers";
    $result = $conn->query($sql);

    echo "<table border='1'>";
    echo "<tr><th>Фирма</th></tr>";
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>".$row['company']."</td>";
            echo "</tr>";
        }
    } else {
        echo "<tr><td colspan='1'>0 results</td></tr>";
    }
    echo "<tr><td colspan='1'><a href='index.php'>Начало</a></td></tr>"; 
    echo "</table>";
} else {
    echo "Грешка." . $conn->error;
}

$conn->close();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Изтриване</title>
</head>
<body>
</body>
</html>

