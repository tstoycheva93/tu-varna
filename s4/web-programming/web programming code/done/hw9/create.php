<?php
include 'config.php';

$sql = "CREATE DATABASE IF NOT EXISTS info_books";

if ($conn->query($sql) === TRUE) {
    echo "Database created successfully";
} else {
    echo "Error creating database: " . $conn->error;
}

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    echo "Connected successfully";
}

$sql = "CREATE TABLE books (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    publisher VARCHAR(100) NOT NULL,
    year_published INT(4) NOT NULL
)";

if ($conn->query($sql) === TRUE) {
    echo "Table books created successfully";
} else {
    echo "Error creating table: " . $conn->error;
}

$conn->close();


