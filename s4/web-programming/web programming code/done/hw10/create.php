<?php
$servername = "localhost";
$username = "root"; 
$password = "";

$conn = new mysqli($servername, $username, $password);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "CREATE DATABASE IF NOT EXISTS task2_providers";
if ($conn->query($sql) === TRUE) {
    echo "Database created successfully";
} else {
    echo "Error creating database: " . $conn->error;
}

$conn->select_db("task2_providers");

$sql = "CREATE TABLE providers (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    company VARCHAR(100) NOT NULL,
    bulstat VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL,
    year_registered INT(4) NOT NULL,
    contact VARCHAR(100) NOT NULL
)";

if ($conn->query($sql) === TRUE) {
    echo "Table providers created successfully";
} else {
    echo "Error creating table: " . $conn->error;
}

$sql = "CREATE TABLE towns (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
)";

if ($conn->query($sql) === TRUE) {
    echo "Table towns created successfully";
} else {
    echo "Error creating table: " . $conn->error;
}


$conn->close();


