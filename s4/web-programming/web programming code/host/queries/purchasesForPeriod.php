<!DOCTYPE html>
<html>
<head>
    <title>Purchases From-To</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&display=swap">
    <style>
        body {
            background-color: #f5f5f5;
            margin: 20px;
            font-family: 'Poppins', sans-serif;
            position: relative;
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


        a {
            background-color: #e0e0e0;
            color: #333;
            padding: 15px 30px;
            border-radius: 5px;
            margin-top: 10px;
            text-decoration: none;
            transition: background-color 0.3s ease;
            text-align: center;
            width: 100px;
            display: inline-block;
        }

        a:hover {
            background-color: #d0d0d0;
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

    </style>
</head>
<body>
<form action="purchasesForPeriod.php" method="post">
    <h2>purchases from-to</h2>
    <div class="form-group">
    <label for="startDate">start date:</label>
        <input type="text" name="startDate" required><br>
    </div>
    <div class="form-group">
    <label for="endDate">end date:</label>
 <input type="text" name="endDate" required><br>
    </div>
    <div class="form-group">
    <input type="submit" value="search" name="purchasesForPeriod"><br>
    </div>
    <div class="links-container">
    <a href="../index.php" class="home-link">home</a>
    <a href="../queries.php" class="home-link">explore</a>
  </div>
</form>
<?php
include '../config.php';

if (isset($_POST['purchasesForPeriod'])) {
    $startDate = $_POST['startDate']; 
    $endDate = $_POST['endDate']; 

    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "SELECT purchases.*, clients.name AS clientName, employees.name AS employeeName 
            FROM purchases 
            INNER JOIN clients ON purchases.clientsKey = clients.id
            INNER JOIN employees ON purchases.employeesKey = employees.id
            WHERE dateOf BETWEEN ? AND ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $startDate, $endDate);
    $stmt->execute();
    $result = $stmt->get_result();

    echo "<table border='1'>";
    echo "<tr><th>Client</th><th>Employee</th><th>Price</th><th>Date</th><th>Products</th></tr>";
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>" . $row['clientName'] . "</td>";
            echo "<td>" . $row['employeeName'] . "</td>";
            echo "<td>" . $row['price'] . "</td>";
            echo "<td>" . $row['dateOf'] . "</td>";
            echo "<td>";
            // Query to get associated products
            $purchaseId = $row['id'];
            $sql_items = "SELECT products.name 
                          FROM items 
                          INNER JOIN products ON items.productsKey = products.id 
                          WHERE items.purchasesKey = ?";
            $stmt_items = $conn->prepare($sql_items);
            $stmt_items->bind_param("i", $purchaseId);
            $stmt_items->execute();
            $result_items = $stmt_items->get_result();
            if ($result_items->num_rows > 0) {
                while ($item_row = $result_items->fetch_assoc()) {
                    echo $item_row['name'] . "<br>";
                }
            } else {
                echo "No products";
            }
            $stmt_items->close();
            echo "</td>";
            echo "</tr>";
        }
    } else {
        echo "<tr><td colspan='5'>No purchases found in July 2023</td></tr>";
    }
    echo "</table>";

    $stmt->close();
    $conn->close();
}
?>

</body>
</html>

