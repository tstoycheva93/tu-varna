<!DOCTYPE html>
<html>
<head>
    <title>Въведи доставчик</title>
</head>
<body>

<form action="insert_provider.php" method="post">
    Фирма: <input type="text" name="company"><br>
    Булстат: <input type="text" name="bulstat"><br>
    Населено място: 
    <select name="town_id">
        <?php
        include 'config.php';
        $sql = "SELECT * FROM towns";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<option value='".$row['id']."'>".$row['name']."</option>";
            }
        } else {
            echo "<option value=''>Няма въведени градове.</option>";
        }
        ?>
    </select><br>
    Телефон: <input type="text" name="phone"><br>
    Година на регистрация: <input type="text" name="year_registered"><br>
    Лице за контакти: <input type="text" name="contact"><br>
    <input type="submit" value="Въведи" name="provider"><br>
</form>
</body>
</html>
<?php
include "config.php";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM providers";
$result = $conn->query($sql);

echo "<table border='1'>";
echo "<tr><th>Фирма</th><th>Булстат</th><th>Адрес</th><th>Телефон</th><th>Година на регистрация</th><th>Лице за контакти</th></tr>";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>".$row['company']."</td>";
        echo "<td>".$row['bulstat']."</td>";
        echo "<td>".$row['address']."</td>";
        echo "<td>".$row['phone']."</td>";
        echo "<td>".$row['year_registered']."</td>";
        echo "<td>".$row['contact']."</td>";
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='6'>0 results</td></tr>";
}
echo "<tr><td colspan='6'><a href='update.php'>Редактиране</a></td></tr>"; 
echo "<tr><td colspan='6'><a href='index.php'>Начало</a></td></tr>"; 
echo "</table>";
$conn->close();
?>
