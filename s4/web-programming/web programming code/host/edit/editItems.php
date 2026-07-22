<!DOCTYPE html>
<html>
<head>
  <title>Edit Items</title>
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
    input[type="tel"],
    input[type="number"] {
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

<form action="editItems.php" method="post">
    <h2>edit items</h2>

    <div class="form-group">
        <label for="itemId">item:</label>
         <select name="itemId" required>
        <?php
        include '../config.php';
        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $sql = "SELECT id FROM items";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<option value='" . $row["id"] . "'>" . $row["id"] . "</option>";
            }
        } else {
            echo "<option value=''>No items available</option>";
        }

        $conn->close();
        ?>
    </select><br>
    </div>

    <div class="form-group">
        <label for="productId">product:</label>
        <select name="productId" required>
        <?php
        include '../config.php';
        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $sql = "SELECT id, name FROM products";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<option value='" . $row["id"] . "'>" . $row["name"] . "</option>";
            }
        } else {
            echo "<option value=''>No products available</option>";
        }

        $conn->close();
        ?>
    </select><br>
    </div>

    <div class="form-group">
        <label for="purchaseId">purchase:</label>
        <select name="purchaseId" required>
        <?php
        include '../config.php';
        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $sql = "SELECT purchases.id, clients.name FROM purchases JOIN clients ON purchases.clientsKey = clients.id";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<option value='" . $row["id"] . "'>" . $row["name"] . "</option>";
            }
        } else {
            echo "<option value=''>No purchases available</option>";
        }

        $conn->close();
        ?>
    </select><br>
    </div>

    <div class="form-group">
        <label for="newQuantity">quantity:</label>
        <input type="number" name="newQuantity" required><br>
    </div>

    <div class="form-group">
    <input type="submit" value="submit" name="editItem"><br>
    </div>
   
    <div class="links-container">
  <a href='../print/printItems.php' class="home-link">view</a>
  <a href='../index.php' class="home-link">home</a>
</div>
</form>
</body>
</html>

<?php
include '../config.php';

if (isset($_POST['editItem'])) {
    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $itemId = $_POST['itemId'];
    $newProductId = $_POST['productId'];
    $newPurchaseId = $_POST['purchaseId'];
    $newQuantity = $_POST['newQuantity'];

    // Fetch current item details
    $sql = "SELECT productsKey, purchasesKey, quantity FROM items WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $itemId);
    $stmt->execute();
    $stmt->bind_result($currentProductId, $currentPurchaseId, $currentQuantity);
    $stmt->fetch();
    $stmt->close();

    //update product count for selected product
    $sql = "UPDATE products SET count = count + ? WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ii", $currentQuantity, $currentProductId);
    $stmt->execute();
    $stmt->close();

    //update purchase price for current purchase
    $sql = "SELECT price FROM products WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $currentProductId);
    $stmt->execute();
    $stmt->bind_result($currentProductPrice);
    $stmt->fetch();
    $stmt->close();

    $currentTotalPrice = $currentProductPrice * $currentQuantity;
    $sql = "UPDATE purchases SET price = price - ? WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ii", $currentTotalPrice, $currentPurchaseId);
    $stmt->execute();
    $stmt->close();

    //update product count for selected count
    $sql = "UPDATE products SET count = count - ? WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ii", $newQuantity, $newProductId);
    $stmt->execute();
    $stmt->close();

    //update purchase price for selected purchase
    $sql = "SELECT price FROM products WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $newProductId);
    $stmt->execute();
    $stmt->bind_result($newProductPrice);
    $stmt->fetch();
    $stmt->close();

    $newTotalPrice = $newProductPrice * $newQuantity;
    $sql = "UPDATE purchases SET price = price + ? WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ii", $newTotalPrice, $newPurchaseId);
    $stmt->execute();
    $stmt->close();

    $sql = "UPDATE items SET productsKey = ?, purchasesKey = ?, quantity = ? WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("iiii", $newProductId, $newPurchaseId, $newQuantity, $itemId);

    if ($stmt->execute()) {
        echo "Item updated successfully.<br>";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
?>
