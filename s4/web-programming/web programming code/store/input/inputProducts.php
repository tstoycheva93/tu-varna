<!DOCTYPE html>
<html>
<head>
  <title>Input Products</title>
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

<form action="inputProducts.php" method="post">
<h2>input a product</h2>

<div class="form-group">
<label for="name">name:</label>
<input type="text" name="name" required><br>
</div>

<div class="form-group">
<label for="price">price:</label>
<input type="text" name="price" required><br>  
</div>

<div class="form-group">
<label for="selectGroup">category:</label>
<select name="selectGroup" required>
        <?php
        include '../config.php';

        $sql = "SELECT id, name FROM groups";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<option value='" . $row["id"] . "'>" . $row["name"] . "</option>";
            }
        } else {
            echo "<option value=''>No groups available</option>";
        }
        ?>
    </select><br>
</div>

<div class="form-group">
<label for="count">count:</label>
<input type="text" name="count" required><br>
</div>

<div class="form-group">
<input type="submit" value="submit" name="products"><br>
</div>
<a href='../index.php' class="home-link">home</a>
<a href='../print/printProducts.php' class="home-link">view</a>
</form>
</body>
</html>

<?php
include '../config.php';

if (isset($_POST['products'])) {
    $name = $_POST['name'];
    $price = $_POST['price'];
    $groupKey = $_POST['selectGroup']; 
    $count=$_POST['count'];

    $sql = "INSERT INTO products (name, price, groupsKey,count) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);

    if (!$stmt) {
        echo "Prepare failed: (" . $conn->errno . ") " . $conn->error;
    } else {
        $stmt->bind_param('sisi', $name, $price, $groupKey,$count);
        
        if ($stmt->execute()) {
            echo "Success!<br>";
        } else {
            echo "Error: " . $stmt->error;
        }

        $stmt->close();
    }

    $conn->close();
}
?>
