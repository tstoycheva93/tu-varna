<!DOCTYPE html>
<html>
<head>
  <title>Edit Deliveries</title>
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

<form action="editDeliveries.php" method="post">
    <h2>edit delivery</h2>
    <div class="form-group">
        <label for="deliveryId">delivery:</label> 
           <select name="deliveryId" required>
        <?php
        include '../config.php';
        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $sql = "SELECT id FROM deliveries ORDER BY id ASC";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<option value='" . $row["id"] . "'>" . $row["id"] . "</option>";
            }
        } else {
            echo "<option value=''>No deliveries available</option>";
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
        <label for="courierId">courier:</label>
        <select name="courierId" required>
        <?php
        include '../config.php';
        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $sql = "SELECT id, name FROM couriers";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<option value='" . $row["id"] . "'>" . $row["name"] . "</option>";
            }
        } else {
            echo "<option value=''>No couriers available</option>";
        }

        $conn->close();
        ?>
    </select><br>
    </div>

    <div class="form-group">
        <label for="groupId">group:</label>
        <select name="groupId" required>
        <?php
        include '../config.php';
        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $sql = "SELECT id, name FROM groups";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<option value='" . $row["id"] . "'>" . $row["name"] . "</option>";
            }
        } else {
            echo "<option value=''>No groups available</option>";
        }

        $conn->close();
        ?>
    </select><br>
    </div>

    <div class="form-group">
        <label for="newPrice">price:</label>
        <input type="number" name="newPrice" required><br>
    </div>

    <div class="form-group">
        <label for="newCount">count:</label>
        <input type="number" name="newCount" required><br>
    </div>

    <div class="form-group">
        <label for="newDate">date:</label>
        <input type="date" name="newDate" required><br>
    </div>

    <div class="form-group">
         <input type="submit" value="submit" name="editDelivery"><br> 
    </div>

    <div class="links-container">
  <a href='../print/printDeliveries.php' class="home-link">view</a>
  <a href='../index.php' class="home-link">home</a>
</div>
</form>
</body>
</html>

<?php
include '../config.php';

if (isset($_POST['editDelivery'])) {
    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $deliveryId = $_POST['deliveryId'];
    $productId = $_POST['productId'];
    $courierId = $_POST['courierId'];
    $groupId = $_POST['groupId'];
    $newPrice = $_POST['newPrice'];
    $newCount = $_POST['newCount'];
    $newDate = $_POST['newDate'];

    $sql = "UPDATE deliveries SET productsKey = ?, couriersKey = ?, groupsKey = ?, price = ?, count = ?, dateOF = ? WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("iiiiisi", $productId, $courierId, $groupId, $newPrice, $newCount, $newDate, $deliveryId);

    if ($stmt->execute()) {
        echo "Delivery updated successfully.<br>";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
?>
