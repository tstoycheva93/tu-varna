<!DOCTYPE html>
<html>
<head>
  <title>Delete Item</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&display=swap">
  <style>
    body {
      background-color: #f5f5f5;
      margin: 20px;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      min-height: 100vh;
      font-family: 'Poppins', sans-serif;
    }


    h2 {
  color: #333;
  text-shadow: 2px 2px 2px #ddd;
  margin-bottom: 10px;
}
    .form-group {
      width: 250px;
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

    .home-link {
      display: block;
      background-color: #e0e0e0;
      color: #333;
      padding: 15px 30px;
      border-radius: 5px;
      margin-top: 10px;
      text-decoration: none;
      transition: background-color 0.3s ease;
    }

    .home-link:hover {
      background-color: #d0d0d0;
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
  </style>
</head>
<body>

<form action="deleteItems.php" method="post">
    <h2>delete item</h2>
    <div class="table-container">
    <table border="1">
        <tr>
            <th>Select</th>
            <th>Item ID</th>
            <th>Product</th>
            <th>Purchase ID</th>
            <th>Quantity</th>
        </tr>
        <?php
        include '../config.php';
        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $sql = "SELECT items.id, products.name AS productName, purchases.id AS purchaseId, items.quantity 
                FROM items 
                INNER JOIN products ON items.productsKey = products.id
                INNER JOIN purchases ON items.purchasesKey = purchases.id";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td><input type='radio' name='itemId' value='" . $row["id"] . "' required></td>";
                echo "<td>" . $row["id"] . "</td>";
                echo "<td>" . $row["productName"] . "</td>";
                echo "<td>" . $row["purchaseId"] . "</td>";
                echo "<td>" . $row["quantity"] . "</td>";
                echo "</tr>";
            }
        } else {
            echo "<tr><td colspan='5'>No items available</td></tr>";
        }

        $conn->close();
        ?>
    </table><br>
    </div>
    <div class="form-group"> 
        <input type="submit" value="delete" name="deleteItem"><br>
    </div>
    <div class="links-container">
  <a href='../print/printItems.php' class="home-link">view</a>
  <a href='../index.php' class="home-link">home</a>
</div>
</form>

<?php
if (isset($_POST['deleteItem'])) {
    include '../config.php';
    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $itemId = $_POST['itemId'];

    //get details for the selected items entry
    $sql = "SELECT products.name AS productName, purchases.id AS purchaseId, purchases.clientsKey, items.quantity 
            FROM items 
            INNER JOIN products ON items.productsKey = products.id
            INNER JOIN purchases ON items.purchasesKey = purchases.id
            WHERE items.id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $itemId);
    $stmt->execute();
    $stmt->bind_result($productName, $purchaseId, $clientId, $quantity);
    $stmt->fetch();
    $stmt->close();

    //get price from products
    $sql = "SELECT price FROM products WHERE name = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $productName);
    $stmt->execute();
    $stmt->bind_result($productPrice);
    $stmt->fetch();
    $stmt->close();

    //update count in products
    $sql = "UPDATE products SET count = count + ? WHERE name = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("is", $quantity, $productName);
    $stmt->execute();
    $stmt->close();

    //using both, update price in purchase
    $decrement = $quantity * $productPrice;
    $sql = "UPDATE purchases SET price = price - ? WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ii", $decrement, $purchaseId);
    $stmt->execute();
    $stmt->close();

    //delete selected item
    $sql = "DELETE FROM items WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $itemId);

    if ($stmt->execute()) {
        echo "Item deleted successfully.<br>";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
?>
</body>
</html>
