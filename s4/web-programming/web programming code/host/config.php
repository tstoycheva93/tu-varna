<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$servername = "sql112.infinityfree.com";
$username = "if0_36614920";
$password = "teditooo000";
$dbname = "if0_36614920_store";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
