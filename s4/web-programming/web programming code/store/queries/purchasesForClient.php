<!DOCTYPE html>
<html>
<head>
    <title>Purchases By Client</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&display=swap">
    <style>
        body {
            background-color: #f5f5f5;
            margin: 20px;
            font-family: 'Poppins', sans-serif;
        }

        .container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .form-container {
            max-width: 400px;
        }

        h2 {
            color: #333;
            text-shadow: 2px 2px 2px #ddd;
            margin-bottom: 10px;
            text-transform: lowercase;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            text-transform: lowercase;
        }

        select,
        input[type="text"],
        input[type="date"],
        input[type="tel"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-family: inherit;
        }

        select {
            text-transform: none; /* Reset text-transform for the select element */
        }

        input[type="submit"] {
            background-color: #333;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
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
            text-transform: lowercase;
            width: 150px; /* Ensure both links have the same width */
            text-align: center; /* Center the text within the links */
        }

        .home-link:hover {
            background-color: #d0d0d0;
        }

        .links-container {
            position: absolute;
      top: 20px;
      right: 20px;
      display: flex;
      flex-direction: column;
      align-items: flex-end;
        }

        .links-container a {
            margin-bottom: 10px;
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
            text-transform: none; /* Ensure table data is displayed in normal case */
        }

        th {
            background-color: #f0f0f0;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="form-container">
<form action="purchasesForClient.php" method="post">
    <h2>purchases by client</h2>
    <div class="form-group">
        <label for="clientName">client:</label>
        <select name="clientName" required>
        <?php
        include '../config.php';

        $sql = "SELECT name FROM clients";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<option value='" . $row["name"] . "'>" . $row["name"] . "</option>";
            }
        } else {
            echo "<option value=''>No clients available</option>";
        }
        ?>
    </select><br>
    </div>

    <div class="form-group">
    <input type="submit" value="Search" name="purchasesForClient"><br>
    
    </div>
    <div class="links-container">
    <a href="../index.php" class="home-link">home</a>
    <a href="../queries.php" class="home-link">explore</a>
  </div>
</form>
</div>

</body>
</html>

<?php
include '../config.php';

if (isset($_POST['purchasesForClient'])) {
    $clientName = $_POST['clientName'];

    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "SELECT purchases.id, clients.name AS clientName, employees.name AS employeeName, purchases.price, purchases.dateOf, GROUP_CONCAT(products.name) AS purchasedProducts
            FROM purchases 
            INNER JOIN clients ON purchases.clientsKey = clients.id
            INNER JOIN employees ON purchases.employeesKey = employees.id
            LEFT JOIN items ON purchases.id = items.purchasesKey
            LEFT JOIN products ON items.productsKey = products.id
            WHERE clients.name LIKE ?
            GROUP BY purchases.id";
    $stmt = $conn->prepare($sql);
    $searchTerm = "%{$clientName}%";
    $stmt->bind_param("s", $searchTerm);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        echo "<table border='1'>";
        echo "<tr><th>Client</th><th>Employee</th><th>Price</th><th>Date</th><th>Products</th></tr>";
        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>" . $row['clientName'] . "</td>";
            echo "<td>" . $row['employeeName'] . "</td>";
            echo "<td>" . $row['price'] . "</td>";
            echo "<td>" . $row['dateOf'] . "</td>";
            echo "<td>" . $row['purchasedProducts'] . "</td>";
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "No purchases found for '$clientName'.";
    }

    $stmt->close();
    $conn->close();
}
?>
