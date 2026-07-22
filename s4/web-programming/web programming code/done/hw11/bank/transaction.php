<?php
class Database {
    private $host = "localhost";
    private $username = "root";
    private $password = "";
    private $database = "test";
    private $connection;

    public function __construct() {
        $this->connection = new mysqli($this->host, $this->username, $this->password, $this->database);
        if ($this->connection->connect_error) {
            die("Connection failed: " . $this->connection->connect_error);
        }
        $this->connection->autocommit(FALSE); 
    }

    public function executeQuery($query) {
        $result = $this->connection->query($query);
        if (!$result) {
            $this->connection->rollback();
            die("Error executing query: " . $this->connection->error);
        }
        return $result;
    }

    public function commit() {
        $this->connection->commit();
    }

    public function getAccountBalances() {
        $accounts = [];
        $result = $this->executeQuery("SELECT * FROM accounts");
        while ($row = $result->fetch_assoc()) {
            $accounts[] = $row;
        }
        return $accounts;
    }

    public function __destruct() {
        $this->connection->close();
    }
}

class Transfer {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function transferFunds($from, $to, $amount) {
        $this->db->executeQuery("UPDATE accounts SET balance = balance + $amount WHERE id = $to");
        $this->db->executeQuery("UPDATE accounts SET balance = balance - $amount WHERE id = $from");
        $this->db->commit();
    }
}

$db = new Database();
$transfer = new Transfer($db);

if (isset($_POST["submit"]) && is_numeric($_POST['amt'])) {
    $transfer->transferFunds($_POST['from'], $_POST['to'], $_POST['amt']);
}

$accounts = $db->getAccountBalances();
?>

<html>
<head></head>
<body>
<h3>TRANSFER</h3>
<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
Transfer $ <input type="text" name="amt" size="5"> from
<select name="from">
<?php
foreach ($accounts as $a) {
    echo "<option value=\"" . $a['id'] . "\">" . $a['label'] . "</option>";
}
?>
</select>
to
<select name="to">
<?php
foreach ($accounts as $a) {
    echo "<option value=\"" . $a['id'] . "\">" . $a['label'] . "</option>";
}
?>
</select>
<input type="submit" name="submit" value="Transfer">
</form>
<h3>ACCOUNT BALANCES</h3>
<table border=1>
<?php
foreach ($accounts as $a) {
    echo "<tr><td>" . $a['label'] . "</td><td>" . $a['balance'] . "</td></tr>";
}
?>
</table>
</body>
</html>
