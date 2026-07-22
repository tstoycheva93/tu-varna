<HTML>
<HEAD>
<TITLE>Upload File</TITLE>
<body>
<?php
if (isset($_POST["task2"])) {
    if ($_FILES["file"]["error"] == 0) {
        $allowedExtensions = array("txt", "jpg", "jpeg", "png");
        $fileExtension = pathinfo($_FILES["file"]["name"], PATHINFO_EXTENSION);
        if (in_array($fileExtension, $allowedExtensions)) {
            if ($_FILES["file"]["size"] <= 2000000) { 
                $uploadDirectory = __DIR__ . "/upload/";
                if (!is_dir($uploadDirectory)) {
                    mkdir($uploadDirectory, 0777, true);
                }
                $destination = $uploadDirectory . basename($_FILES["file"]["name"]);
                if (move_uploaded_file($_FILES["file"]["tmp_name"], $destination)) {
                    echo "Файлът е качен успешно.";
                } else {
                    echo "Възникна грешка при качването на файла.";
                }
            } else {
                echo "Грешка: Файлът е твърде голям.";
            }
        } else {
            echo "Грешка: Неразрешен тип файл.";
        }
    } else {
        echo "Грешка при качването на файла: " . $_FILES["file"]["error"];
    }
}
?>
</body>
</html>
