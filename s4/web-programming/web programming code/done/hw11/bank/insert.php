<?php
class Database {
    private $host = 'localhost';
    private $username = 'root';
    private $password = '';
    private $database = 'test';
    private $connection;

    public function __construct() {
        $this->connection = new mysqli($this->host, $this->username, $this->password, $this->database);
        if ($this->connection->connect_errno) {
            exit('Connect failed: ' . $this->connection->connect_error);
        }
    }

    public function executeQuery($sql) {
        if ($this->connection->query($sql) === TRUE) {
            echo '1 record added';
        } else {
            echo 'Error: ' . $this->connection->error;
        }
    }

    public function __destruct() {
        $this->connection->close();
    }
}

$database = new Database();
$sql1 = 'INSERT INTO accounts (id, label, balance) VALUES ("1", "Savings #1", 1000)';
$sql2 = 'INSERT INTO accounts (id, label, balance) VALUES ("2", "Current #1", 2000)';
$sql3 = 'INSERT INTO accounts (id, label, balance) VALUES ("3", "Current #2", 3000)';
$database->executeQuery($sql1);
$database->executeQuery($sql2);
$database->executeQuery($sql3);
