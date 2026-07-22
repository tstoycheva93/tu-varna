<?php
class DatabaseSetup {
    private $host = 'localhost';
    private $username = 'root';
    private $password = '';
    private $connection;

    public function __construct() {
        $this->connection = new mysqli($this->host, $this->username, $this->password);
        if ($this->connection->connect_errno) {
            exit('Connect failed: ' . $this->connection->connect_error);
        }
    }

    public function createDatabase($name) {
        $sql = "CREATE DATABASE $name";
        if ($this->connection->query($sql) === TRUE) {
            echo "Database '$name' successfully created<br>";
        } else {
            echo 'Error: ' . $this->connection->error;
        }
    }

    public function createTable($database, $tableName) {
        $sql = "CREATE TABLE $database.$tableName "
             . "(id int not null auto_increment, label VARCHAR(20) NOT NULL, "
             . "balance INT NOT NULL, PRIMARY KEY (id))";
        if ($this->connection->query($sql) === TRUE) {
            echo "Table '$tableName' successfully created";
        } else {
            echo 'Error: ' . $this->connection->error;
        }
    }

    public function __destruct() {
        $this->connection->close();
    }
}

$databaseSetup = new DatabaseSetup();
$databaseSetup->createDatabase('test');
$databaseSetup->createTable('test', 'accounts');
