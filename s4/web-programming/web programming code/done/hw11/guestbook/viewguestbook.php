<?php
class Guestbook {
    private $host = "localhost";
    private $username = "";
    private $password = "";
    private $database = "my_db";
    private $connection;

    public function __construct() {
        $this->connection = new mysqli($this->host, $this->username, $this->password, $this->database);
        if ($this->connection->connect_error) {
            die("Connection failed: " . $this->connection->connect_error);
        }
    }

    public function getEntries() {
        $entries = [];
        $sql = "SELECT * FROM guestbook";
        $result = $this->connection->query($sql);
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $entries[] = $row;
            }
        }
        return $entries;
    }

    public function __destruct() {
        $this->connection->close();
    }
}

$guestbook = new Guestbook();
$entries = $guestbook->getEntries();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Книга</title>
</head>
<body>
<table width="400" border="0" align="center" cellpadding="3" cellspacing="0">
<tr>
<td><strong>View Guestbook | <a href="index.php">Sign Guestbook</a> </strong></td>
</tr>
</table>
<br>

<?php foreach ($entries as $entry): ?>
    <table width="400" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
    <tr>
    <td><table width="400" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
    <tr>
    <td>ID</td>
    <td>:</td>
    <td><?php echo $entry['id']; ?></td>
    </tr>
    <tr>
    <td width="117">Name</td>
    <td width="14">:</td>
    <td width="357"><?php echo $entry['name']; ?></td>
    </tr>
    <tr>
    <td>Email</td>
    <td>:</td>
    <td><?php echo $entry['email']; ?></td>
    </tr>
    <tr>
    <td valign="top">Comment</td>
    <td valign="top">:</td>
    <td><?php echo $entry['comment']; ?></td>
    </tr>
    <tr>
    <td valign="top">Date/Time </td>
    <td valign="top">:</td>
    <td><?php echo $entry['datetime']; ?></td>
    </tr>
    </table></td>
    </tr>
    </table>
    <BR>
<?php endforeach; ?>

</body>
</html>
