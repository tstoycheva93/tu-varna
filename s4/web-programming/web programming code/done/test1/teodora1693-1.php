<HTML>
<HEAD>
<TITLE>Form</TITLE>
<style>
    form{
        border: 2px solid #ccc;
        margin: 0 auto;
        max-width: 500px;
        padding: 15px;
        
    }

    table {
        border: 0px solid black; 
        padding:2px;
    }
    td {
        border: 0px solid black;
        padding-right: 100px;
        text-align: left;
    }
</style>
</HEAD>
<BODY>
<FORM name="task1" method="post" action="#" enctype="multipart/form-data">
<table>
    <tr>
        <td>Име</td>
        <td><input type="text" name="name" required>*</td>
    </tr>
    <tr>
        <td>Фамилия</td>
        <td><input type="text" name="surname" required>*</td>
    </tr>
    <tr>
        <td>Курс</td>
        <td>
            <input type="radio" name="course" value="1-ви курс">1-ви курс<br>
            <input type="radio" name="course" value="2-ри курс">2-ри курс<br>
            <input type="radio" name="course" value="3-ти курс">3-ти курс<br>
            <input type="radio" name="course" value="4-ти курс">4-ти курс
        </td>
    </tr>
    <tr>
        <td>Специалност</td>
        <td>
            <select name="specialnost">
                <option value="КСТ">КСТ</option>
                <option value="СИТ">СИТ</option>
                <option value="ЕЕ">ЕЕ</option>
                <option value="ИД">ИД</option>
            </select>
        </td>
    </tr>
    <tr>
        <td>Файл със CV</td>
        <td><input type="file" name="file" accept=".txt, .png"/><br></td>
    </tr>
    <tr>
        <td>Фирма</td>
        <td>
            <select name="firma" size="3" required>
                <option value="Виваком">Виваком</option>
                <option value="Йетел">Йетел</option>
                <option value="A1">А1</option>
                <option value="Нетуъркс">Нетуъркс</option>
            </select>*
        </td>
    </tr>
    <tr>
        <td>Допълнителни бележкки (желания):</td>
        <td>
            <textarea name="notes" cols="30" rows="5"></textarea>
            <input type="reset" name="reset" value="Изчистване">
            <input type="submit" name="task1" value="Изпращане">
        </td>
    </tr>
    <tr>
        <td colspan="2"><br>Полетата, отбелязани със *, са задължителни за попълване!<br><br></td>
    </tr>
</table>

<?php
 if (isset($_POST["task1"]))
 {
    $name = $_POST['name'];
    $surname = $_POST['surname'];
    $course=$_POST['course'];
    $specialnost=$_POST['specialnost'];
    $firma=$_POST['firma'];
    $notes=$_POST["notes"];

    echo "$name $surname, студент от $course, специалност $specialnost, кандидатства във фирма $firma с допълнителни бележки и желания: $notes.<br>";
    
    if ($_FILES["file"]["error"] == 0) {
        $allowedExtensions = array("txt", "pdf");
        $fileExtension = pathinfo($_FILES["file"]["name"], PATHINFO_EXTENSION);
        if (in_array($fileExtension, $allowedExtensions)) {
            if ($_FILES["file"]["size"] <= 2000000) { 
                $uploadDirectory = __DIR__ . "/uploads/";
                if (!is_dir($uploadDirectory)) {
                    mkdir($uploadDirectory, 0777, true);
                }
                $destination = $uploadDirectory . basename($_FILES["file"]["name"]);
                if (move_uploaded_file($_FILES["file"]["tmp_name"], $destination)) {
                    echo "<br> Файлът е качен успешно.";
                } else {
                    echo "<br> Възникна грешка при качването на файла.";
                }
            } else {
                echo "<br> Грешка: Файлът е твърде голям.";
            }
        } else {
            echo "<br> Грешка: Неразрешен тип файл.";
        }
    } else {
        echo "<br> Грешка при качването на файла: " . $_FILES["file"]["error"];
    }
}
 

?>
</form>


</BODY>
</HTML>