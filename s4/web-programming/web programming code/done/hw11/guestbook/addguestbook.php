<?php
class Guestbook {
    private $host = "localhost";
    private $username = "";
    private $password = "";
    private $database = "my_db";
    private $tbl_name = "guestbook";
    private $connection;

    public function __construct() {
        $this->connection = new mysqli($this->host, $this->username, $this->password, $this->database);
        if ($this->connection->connect_error) {
            die("Connection failed: " . $this->connection->connect_error);
        }
    }

    public function insertEntry($name, $email, $comment) {
        $datetime = date("y-m-d h:i:s"); // Date time
        $sql = "INSERT INTO " . $this->tbl_name . "(name, email, comment, datetime) VALUES ('$name', '$email', '$comment', '$datetime')";
        $result = $this->connection->query($sql);
        if ($result) {
            echo "Successful";
            echo "<BR>";
            echo "<a href='viewguestbook.php'>View guestbook</a>"; 
        } else {
            echo "ERROR: " . $this->connection->error;
        }
    }

    public function __destruct() {
        $this->connection->close();
    }
}

$guestbook = new Guestbook();
if (isset($_REQUEST["name"]) && isset($_REQUEST["email"]) && isset($_REQUEST["comment"])) {
    $guestbook->insertEntry($_REQUEST["name"], $_REQUEST["email"], $_REQUEST["comment"]);
}
