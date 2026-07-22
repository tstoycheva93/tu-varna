
<!DOCTYPE html>
<html>
<head>
  <title>View Items</title>
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
  </style>
</head>
<body>
<?php
include "../config.php";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT items.*, 
               products.name AS productName, 
               purchases.clientsKey AS purchaseClientId, 
               clients.name AS clientName,
               employees.name as employeeName
        FROM items 
        LEFT JOIN products ON items.productsKey = products.id
        LEFT JOIN purchases ON items.purchasesKey = purchases.id
        LEFT JOIN clients ON purchases.clientsKey = clients.id
        LEFT JOIN employees ON purchases.employeesKey=employees.id";
$result = $conn->query($sql);
echo "<div class='table-container'>";
echo "<table border='1'>";
echo "<tr><th>Product</th><th>Client</th><th>Emplpyee</th><th>Quantity</th></tr>";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>".$row['productName']."</td>";
        echo "<td>".$row['clientName']."</td>";
        echo "<td>".$row['employeeName']."</td>";
        echo "<td>".$row['quantity']."</td>";
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='4'>0 results</td></tr>";
}
echo "</table>";
echo "</div>";
$conn->close();
?>
<div class="links-container">
  <a href='../edit/editItems.php' class="home-link">edit</a>
  <a href='../delete/deleteItems.php' class="home-link">delete</a>
  <a href='../index.php' class="home-link">home</a>
</div>
</body>
</html>


