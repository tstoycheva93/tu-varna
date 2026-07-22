<?php
$host = 'localhost';
$dbUser = 'root';
$dbPass = 'root';
$dbName = 'task2_providers';
$backupFile = "C:/xampp/tmp/task2_providers_backup.sql";
$command = "C:/xampp/mysql/bin/mysqldump.exe --host=$host --user=$dbUser --password=$dbPass $dbName > $backupFile";
exec($command);

if (file_exists($backupFile)) {
    echo " Успешно архивиране в $backupFile";
} else {
    echo "Грешка.";
}
?>
