<!DOCTYPE html>
<html>
<head>
    <title>Въвеждане</title>
</head>
<body>

<form action="input.php" method="post">
    Заглавие: <input type="text" name="title"><br>
    Автор: <input type="text" name="author"><br>
    Издателство: <input type="text" name="publisher"><br>
    Година на издаване: <input type="text" name="year_published"><br><br>
    <input type="submit" value="Въведи" name="input"> <br>
</form>

<?php
include 'config.php';
if (isset($_POST['input'])) {
$title = $_POST['title'];
$author = $_POST['author'];
$publisher = $_POST['publisher'];
$year_published = $_POST['year_published'];

$sql = "INSERT INTO books (title, author, publisher, year_published)
VALUES ('$title', '$author', '$publisher', '$year_published')";

if ($conn->query($sql) === TRUE) {
    echo "<br>Успешно въвеждане! <br>";
} else {
    echo "Грешка: " . $sql . "<br>" . $conn->error;
}
echo "<a href='index.php'>Начало</a>"; 

$conn->close();
}
?>


</body>
</html>