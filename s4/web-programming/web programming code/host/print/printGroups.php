
<!DOCTYPE html>
<html>
<head>
  <title>View Groups</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&display=swap">
  <style>
    body {
      background-color: #f5f5f5;
      margin: 20px;
      font-family: 'Poppins', sans-serif;
      position: relative;
    }

    .table-container {
      margin-top: 20px; 
      width: 100%;
    }

    table {
      border-collapse: collapse;
      width: 100%;
      margin-top: 20px;
    }

    th, td {
      padding: 10px;
      border: 1px solid #ddd;
      text-align: left;
    }

    th {
      background-color: #f0f0f0;
      font-weight: bold;
    }

    .links-container {
      margin-top: 20px;
      display: flex;
      justify-content: flex-end;
    }

    .home-link {
      background-color: #e0e0e0;
      color: #333;
      padding: 15px 30px;
      border-radius: 5px;
      margin-left: 10px; /* Add some space between links */
      text-decoration: none;
      transition: background-color 0.3s ease;
    }

    .home-link:hover {
      background-color: #d0d0d0;
    }
    @media only screen and (max-width: 600px) {
  body {
    padding: 10px;
  }
}
  </style>
</head>
<body>
<?php
include "../config.php";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM groups";
$result = $conn->query($sql);
echo "<div class='table-container'>";
echo "<table border='1'>";
echo "<tr><th>Category</th></tr>";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>".$row['name']."</td>";
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='1'>0 results</td></tr>";
}
echo "</table>";
echo "</div>";
$conn->close();
?>
<div class="links-container">
  <a href='../edit/editGroups.php' class="home-link">edit</a>
  <a href='../delete/deleteGroups.php' class="home-link">delete</a>
  <a href='../index.php' class="home-link">home</a>
</div>
</body>
</html>
