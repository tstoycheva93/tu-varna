<!DOCTYPE html>
<html>

<head>
  <title>Input Items</title>
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
  </style>
</head>

<body>

  <form action="inputItems.php" method="post">
    <h2>input purchase items</h2>
    <div class="form-group">
      <label for="selectProduct">product:</label>
      <select name="selectProduct" required>
        <?php
        include '../config.php';

        $sql = "SELECT id, name FROM products";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
          while ($row = $result->fetch_assoc()) {
            echo "<option value='" . $row["id"] . "'>" . $row["name"] . "</option>";
          }
        } else {
          echo "<option value=''>No products available</option>";
        }
        ?>
      </select><br>
    </div>

    <div class="form-group">
      <label for="selectPurchase">purchase:</label>
      <select name="selectPurchase" required>
        <?php
        include '../config.php';

        $sql = "SELECT purchases.id, clients.name AS clientName, employees.name AS employeeName, purchases.dateOf 
                FROM purchases 
                JOIN clients ON purchases.clientsKey = clients.id 
                JOIN employees ON purchases.employeesKey = employees.id 
                ORDER BY purchases.id ASC";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
          while ($row = $result->fetch_assoc()) {
            echo "<option value='" . $row["id"] . "'>" . $row["clientName"] . " - " . $row["employeeName"] . " - " . $row["dateOf"] . "</option>";
          }
        } else {
          echo "<option value=''>No purchases available</option>";
        }
        ?>
      </select><br>
    </div>

    <div class="form-group">
      <label for="quantity">quantity:</label>
      <input type="text" name="quantity" required><br>
    </div>

    <div class="form-group">
      <input type="submit" value="submit" name="items"><br>
    </div>
    <a href='../index.php' class="home-link">home</a>
    <a href='../print/printItems.php' class="home-link">view</a>
  </form>
</body>

</html>

<?php
include '../config.php';

if (isset($_POST['items'])) {
  $productsKey = $_POST['selectProduct'];
  $purchasesKey = $_POST['selectPurchase'];
  $quantity = $_POST['quantity'];

  //get the price of the selected products
  $sql = "SELECT price FROM products WHERE id = ?";
  $stmt = $conn->prepare($sql);
  if (!$stmt) {
    echo "Prepare failed: (" . $conn->errno . ") " . $conn->error;
  } else {
    $stmt->bind_param('i', $productsKey);
    $stmt->execute();
    $stmt->bind_result($productPrice);
    $stmt->fetch();
    $stmt->close();

    $totalPrice = $productPrice * $quantity;

    $sql = "INSERT INTO items (productsKey, purchasesKey, quantity) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);
    if (!$stmt) {
      echo "Prepare failed: (" . $conn->errno . ") " . $conn->error;
    } else {
      $stmt->bind_param('iii', $productsKey, $purchasesKey, $quantity);
      if ($stmt->execute()) {
        echo "Success!<br>";
      } else {
        echo "Error: " . $stmt->error;
      }
      $stmt->close();
    }

    //update product count
    $sql = "UPDATE products SET count = count - ? WHERE id = ?";
    $stmt = $conn->prepare($sql);
    if (!$stmt) {
      echo "Prepare failed: (" . $conn->errno . ") " . $conn->error;
    } else {
      $stmt->bind_param('ii', $quantity, $productsKey);
      $stmt->execute();
      $stmt->close();
    }

    //add price of purchased products to the total price in purchases
    $sql = "UPDATE purchases SET price = price + ? WHERE id = ?";
    $stmt = $conn->prepare($sql);
    if (!$stmt) {
      echo "Prepare failed: (" . $conn->errno . ") " . $conn->error;
    } else {
      $stmt->bind_param('di', $totalPrice, $purchasesKey);
      $stmt->execute();
      $stmt->close();
    }
  }
}

$conn->close();
?>