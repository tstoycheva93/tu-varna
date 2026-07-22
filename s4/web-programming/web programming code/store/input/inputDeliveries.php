<!DOCTYPE html>
<html>
<head>
  <title>Input Deliveries</title>
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
input[type="date"] {
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
  background-color: #e0e0e0;
  color: #333;
  padding: 15px 30px;
  border-radius: 5px;
  margin-top: auto;
  text-decoration: none;
  transition: background-color 0.3s ease;
}

.home-link:hover {
  background-color: #d0d0d0;
}
</style>
</head>
<body>

<form action="inputDeliveries.php" method="post">
  <h2>input a delivery</h2>

  <div class="form-group">
    <label for="selectProduct">product:</label>
    <select name="selectProduct" id="selectProduct" required>
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
    </select>
  </div>

  <div class="form-group">
    <label for="selectGroup">group:</label>
    <select name="selectGroup" id="selectGroup" required>
      <?php
        include '../config.php';

        $sql = "SELECT id, name FROM groups";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
          while ($row = $result->fetch_assoc()) {
            echo "<option value='" . $row["id"] . "'>" . $row["name"] . "</option>";
          }
        } else {
          echo "<option value=''>No groups available</option>";
        }
      ?>
    </select>
  </div>

  <div class="form-group">
    <label for="selectCourier">courier:</label>
    <select name="selectCourier" id="selectCourier" required>
      <?php
        include '../config.php';

        $sql = "SELECT id, name FROM couriers";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
          while ($row = $result->fetch_assoc()) {
            echo "<option value='" . $row["id"] . "'>" . $row["name"] . "</option>";
          }
        } else {
          echo "<option value=''>No couriers available</option>";
        }
      ?>
    </select>
  </div>

  <div class="form-group">
    <label for="price">price:</label>
    <input type="text" name="price" id="price" required>
  </div>

  <div class="form-group">
    <label for="count">amount:</label>
    <input type="text" name="count" id="count" required>
  </div>

  <div class="form-group">
    <label for="date">date:</label>
    <input type="date" name="date" id="date" required>
  </div>

  <div class="form-group">
    <input type="submit" value="submit" name="deliveries">
  </div>

  <br>
  <a href='../index.php' class="home-link" style="text-align: right">home</a>
  <a href='../print/printDeliveries.php' class="home-link" style="text-align: right">view</a><br>
</form>

</body>
</html>

<?php
include '../config.php';

if (isset($_POST['deliveries'])) {
    $productKey = $_POST['selectProduct'];
    $courierKey = $_POST['selectCourier'];
    $groupKey = $_POST['selectGroup']; 
    $price=$_POST['price'];
    $count=$_POST['count'];
    $date=$_POST['date'];

    $sql = "INSERT INTO deliveries (productsKey,couriersKey,groupsKey,price,count,dateOf) VALUES (?, ?, ?, ?, ?,?)";
    $stmt = $conn->prepare($sql);

    if (!$stmt) {
        echo "Prepare failed: (" . $conn->errno . ") " . $conn->error;
    } else {
        $stmt->bind_param('iiiiis', $productKey, $courierKey, $groupKey,$price, $count,$date);
        
        if ($stmt->execute()) {
            echo "Success!<br>";
        } else {
            echo "Error: " . $stmt->error;
        }
        $stmt->close();
    }

}

$sql = "UPDATE products SET count = count + ? WHERE id = ?";
$stmt = $conn->prepare($sql);

if (!$stmt) {
    throw new Exception("Prepare failed: (" . $conn->errno . ") " . $conn->error);
} else {
    $stmt->bind_param('ii', $count, $productKey); 
    
    if (!$stmt->execute()) {
        throw new Exception("Execute failed: " . $stmt->error);
    }

    $stmt->close();
}

$conn->commit();
$conn->close();

?>
