<HTML>
<HEAD>
<TITLE>homework 6</TITLE>
<style>
    form{
        border: 2px solid #ccc;
        margin: 0 auto;
        max-width: 400px;
        padding: 10px;
    }

    table {
        border: 2px solid black; 
    }
    td {
        border: 1px solid black;
        padding: 8px;
        text-align: center;
    }
</style>
</HEAD>
<BODY>

<FORM name="form1" method="post" action="#">
<b>TASK 1:</b> <br>
Print file data.txt and its size! <br>
<input type="submit" name="task1" value="Go" />
</form>
<?php
$filename = 'data.txt';

$content1 = "Дисциплина Web приложения се изучава през втория семестър на втори курс. Тази дисциплина се изучава от студенти, които са специалност СИТ.";
$content2 = "Студентите редовно си пишат домашните.";

file_put_contents($filename, $content1);

$file = fopen($filename, 'a');
if ($file === false) {
    die("Не може да се отвори файлът за добавяне на съдържание.");
}

fwrite($file, "\n" . $content2);
fclose($file);

$file = fopen($filename, 'r');
if ($file === false) {
    die("Не може да се отвори файлът за четене.");
}

$content = fread($file, filesize($filename));
fclose($file);

if (isset($_POST['task1'])) {
echo "Съдържание на файла:<br><br>";
echo nl2br($content);
echo "<br><br>";
echo "Размер на файла: " . filesize($filename) . " bytes";
}
?>

<br>

<FORM name="form2" method="post" action="upload_file.php" enctype="multipart/form-data">
<b>TASK 2:</b> <br> Upload a file! <br><br>
Filename: <input type="file" name="file" accept=".txt, .jpg, .jpeg, .png"/> <br>
<input type="submit" name="task2" value="Submit"/>
</form>
<br>


<FORM name="form3" method="post" action="#" >
<b>TASK 3:</b> <br> Print array numbers and functions! <br>
<input type="submit" name="task3" value="Go" />
</form>

<?php
include 'functions.php';

$fileContent = "10, 35, 30, 44, 55, 14, 73";
$filename = 'array.txt';
file_put_contents($filename, $fileContent);
$arrayString = readFileToString($filename);
$array = explode(', ', $arrayString);

if (isset($_POST['task3'])){
echo "Масивът е: $fileContent<br>";
findMultiplesOfFive($array);
printLargerNeighbors($array);
}


?>

</BODY>
</html>

