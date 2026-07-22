<!DOCTYPE html>
<html>
<head>
  <title>Bestsellers</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&display=swap">
  <style>
    body {
      background-color: #f5f5f5;
      margin: 20px;
      font-family: 'Poppins', sans-serif;
      position: relative;
    }

    .form-container {
      margin: 20px;
    }

    h2 {
      color: #333;
      text-shadow: 2px 2px 2px #ddd;
      margin-bottom: 10px;
    }

    .form-group {
      margin-bottom: 15px;
    }

    .form-group label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }

    select,
    input[type="text"],
    input[type="date"],
    input[type="tel"] {
      width: 250px;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-family: inherit;
    }

    input[type="submit"] {
      background-color: #333;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease, box-shadow 0.3s ease;
      font-family: 'Poppins', sans-serif;
      font-weight: bold;
    }

    input[type="submit"]:hover {
      background-color: #222;
      box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.2);
      transform: translateY(-1px);
    }

    .links-container {
      position: absolute;
      top: 20px;
      right: 20px;
      display: flex;
      flex-direction: column;
      align-items: flex-end;
    }

    .home-link {
  background-color: #e0e0e0;
  color: #333;
  padding: 15px 30px;
  border-radius: 5px;
  margin-top: 10px;
  text-decoration: none;
  transition: background-color 0.3s ease;
  text-align: center;
  width: 100px;
}

.home-link:hover {
  background-color: #d0d0d0;}

    .table-container {
      margin-top: 50px; 
      width: 100%;
    }

    table {
      border-collapse: collapse;
      width: 100%;
      margin-top: 80px;
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
  </style>
</head>
<body>
<form action="topFiveProducts.php" method="post">
    <h2>view bestsellers</h2>
    <div class="form-group">    
        <input type="submit" value="view" name="topFiveProducts"><br>
</div>
<div class="links-container">
    <a href="../index.php" class="home-link">home</a>
    <a href="../queries.php" class="home-link">explore</a>
  </div>
</form>
</body>
</html>
<?php
include '../config.php';

if (isset($_POST['topFiveProducts'])) {
    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "SELECT products.name AS productName, SUM(items.quantity) AS totalQuantity 
            FROM items 
            INNER JOIN products ON items.productsKey = products.id 
            GROUP BY items.productsKey 
            ORDER BY totalQuantity DESC 
            LIMIT 5";
    $result = $conn->query($sql);

    echo "<table border='1'>";
    echo "<tr><th>Product Name</th><th>Quantity Sold</th></tr>";
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>" . $row['productName'] . "</td>";
            echo "<td>" . $row['totalQuantity'] . "</td>";
            echo "</tr>";
        }
    } else {
        echo "<tr><td colspan='2'>No products found</td></tr>";
    }
    echo "</table>";

    $conn->close();
}
?>
