<?php
$servername = " sql112.infinityfree.com";
$username = "if0_36614920";
$password = "teditooo000";
$dbname = " if0_36614920_store";

/*$conn = new mysqli($servername, $username, $password);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "CREATE DATABASE IF NOT EXISTS store";
if ($conn->query($sql) === TRUE) {
    echo "Database created successfully";
} else {
    echo "Error creating database: " . $conn->error;
}*/

$conn->select_db("$dbname");

$sql = "CREATE TABLE groups (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
)";

if ($conn->query($sql) === TRUE) {
    echo "Table Groups created successfully<br>";
} else {
    echo "Error creating table: " . $conn->error;
}

$sql = "CREATE TABLE IF NOT EXISTS products (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    groupsKey INT(6) UNSIGNED NOT NULL,
    price INT(4) NOT NULL,
    count INT(4) NOT NULL,
    FOREIGN KEY (groupsKey) REFERENCES groups(id) ON DELETE CASCADE
)";

if ($conn->query($sql) === TRUE) {
    echo "Table Products created successfully<br>";
} else {
    echo "Error creating table: " . $conn->error;
}

$sql = "CREATE TABLE IF NOT EXISTS couriers (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    eik VARCHAR(100) NOT NULL
)";

if ($conn->query($sql) === TRUE) {
    echo "Table Couriers created successfully<br>";
} else {
    echo "Error creating table: " . $conn->error;
}

$sql = "CREATE TABLE IF NOT EXISTS deliveries (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    productsKey INT(6) UNSIGNED NOT NULL,
    couriersKey INT(6) UNSIGNED NOT NULL,
    groupsKey INT(6) UNSIGNED NOT NULL,
    price INT(4) NOT NULL,
    count INT(4) NOT NULL,
    dateOF DATE NOT NULL,
    FOREIGN KEY (productsKey) REFERENCES products(id) ON DELETE CASCADE,
    FOREIGN KEY (groupsKey) REFERENCES groups(id) ON DELETE CASCADE,
    FOREIGN KEY (couriersKey) REFERENCES couriers(id) ON DELETE CASCADE
)";

if ($conn->query($sql) === TRUE) {
    echo "Table Deliveries created successfully<br>";
} else {
    echo "Error creating table: " . $conn->error;
}

$sql = "CREATE TABLE IF NOT EXISTS jobs (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
)";

if ($conn->query($sql) === TRUE) {
    echo "Table Jobs created successfully<br>";
} else {
    echo "Error creating table: " . $conn->error;
}

$sql = "CREATE TABLE IF NOT EXISTS clients (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL
)";

if ($conn->query($sql) === TRUE) {
    echo "Table Clients created successfully<br>";
} else {
    echo "Error creating table: " . $conn->error;
}

$sql = "CREATE TABLE IF NOT EXISTS employees (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    jobsKey INT(6) UNSIGNED NOT NULL,
    phone VARCHAR(100) NOT NULL,
    FOREIGN KEY (jobsKey) REFERENCES jobs(id) ON DELETE CASCADE
)";

if ($conn->query($sql) === TRUE) {
    echo "Table Employees created successfully<br>";
} else {
    echo "Error creating table: " . $conn->error;
}

$sql = "CREATE TABLE IF NOT EXISTS purchases (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    clientsKey INT(6) UNSIGNED NOT NULL,
    employeesKey INT(6) UNSIGNED NOT NULL,
    price INT(4) NOT NULL,
    dateOf DATE NOT NULL,
    FOREIGN KEY (clientsKey) REFERENCES clients(id) ON DELETE CASCADE,
    FOREIGN KEY (employeesKey) REFERENCES employees(id) ON DELETE CASCADE
)";

if ($conn->query($sql) === TRUE) {
    echo "Table Purchases created successfully<br>";
} else {
    echo "Error creating table: " . $conn->error;
}

$sql = "CREATE TABLE IF NOT EXISTS items (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    productsKey INT(6) UNSIGNED NOT NULL,
    purchasesKey INT(6) UNSIGNED NOT NULL,
    quantity INT(4) NOT NULL,
    FOREIGN KEY (productsKey) REFERENCES products(id) ON DELETE CASCADE,
    FOREIGN KEY (purchasesKey) REFERENCES purchases(id) ON DELETE CASCADE

)";

if ($conn->query($sql) === TRUE) {
    echo "Table Items created successfully<br>";
} else {
    echo "Error creating table: " . $conn->error;
}

$conn->close();


