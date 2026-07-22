<!DOCTYPE html>
<html>
<head>
  <title>Delivered Products on Date</title>
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
      background-color: #d0d0d0;
    }

    .table-container {
      margin-top: 50px; 
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
<div class="form-container">
  <h2>search by date:</h2>
  <form action="deliveredProductsOnDate.php" method="post">
    <div class="form-group">
      <label for="deliveryDate">date:</label>
      <input type="text" id="deliveryDate" name="deliveryDate" required>
    </div>
    <div class="form-group">
      <input type="submit" value="search" name="deliveredProductsOnDate">
    </div>
  </form>
</div>

<div class="links-container">
  <a href='../index.php' class="home-link">home</a>
  <a href='../queries.php' class="home-link">explore</a>
</div>

<div class="table-container">
  <?php
  include '../config.php';

  if (isset($_POST['deliveredProductsOnDate'])) {
      $searchDate = $_POST['deliveryDate'];

      $conn = new mysqli($servername, $username, $password, $dbname);
      if ($conn->connect_error) {
          die("Connection failed: " . $conn->connect_error);
      }

      $sql = "SELECT products.name AS productName, deliveries.dateOF, couriers.name AS courierName 
              FROM products 
              INNER JOIN deliveries ON products.id = deliveries.productsKey 
              LEFT JOIN couriers ON deliveries.couriersKey = couriers.id
              WHERE deliveries.dateOF = ?";
      $stmt = $conn->prepare($sql);
      $stmt->bind_param("s", $searchDate);
      $stmt->execute();
      $result = $stmt->get_result();

      if ($result->num_rows > 0) {
          echo "<table>";
          echo "<tr><th>Product</th><th>Courier</th><th>Date of Delivery</th></tr>";
          while ($row = $result->fetch_assoc()) {
              echo "<tr>";
              echo "<td>" . $row['productName'] . "</td>";
              echo "<td>" . $row['courierName'] . "</td>";
              echo "<td>" . $row['dateOF'] . "</td>";
              echo "</tr>";
          }
          echo "</table>";
      } else {
          echo "No products delivered on $searchDate";
      }

      $stmt->close();
      $conn->close();
  }
  ?>
</div>

</body>
</html>
