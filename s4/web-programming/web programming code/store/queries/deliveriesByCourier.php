<!DOCTYPE html>
<html>
<head>
    <title>Deliveries by Courier</title>
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
            text-transform: lowercase;
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
<div class="container">
    <div class="form-container">
        <form action="deliveriesByCourier.php" method="post">
            <h2>deliveries by courier</h2>
            <div class="form-group">
                <label for="courierName">courier name:</label>
                <select name="courierName" required>
                    <?php
                    include '../config.php';

                    $sql = "SELECT name FROM couriers";
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                            echo "<option value='" . $row["name"] . "'>" . $row["name"] . "</option>";
                        }
                    } else {
                        echo "<option value=''>No couriers available</option>";
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <input type="submit" value="search" name="deliveriesByCourier">
            </div>
        </form>
    </div>
    <div class="links-container">
        <a href='../index.php' class="home-link">home</a>
        <a href='../queries.php' class="home-link">explore</a>
    </div>
</div>
</body>
</html>
<?php
include '../config.php';

if (isset($_POST['deliveriesByCourier'])) {
    $courierName = $_POST['courierName'];

    $sql = "SELECT deliveries.*, couriers.name AS couriersName, products.name AS productName, groups.name AS groupName 
            FROM deliveries 
            INNER JOIN couriers ON deliveries.couriersKey = couriers.id
            INNER JOIN products ON deliveries.productsKey = products.id
            INNER JOIN groups ON deliveries.groupsKey = groups.id
            WHERE couriers.name = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $courierName);
    $stmt->execute();
    $result = $stmt->get_result();

    echo "<table>";
    echo "<tr><th>Courier</th><th>Product</th><th>Group</th><th>Price</th><th>Count</th></tr>";
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>".$row['couriersName']."</td>";
            echo "<td>".$row['productName']."</td>";
            echo "<td>".$row['groupName']."</td>";
            echo "<td>".$row['price']."</td>";
            echo "<td>".$row['count']."</td>";
            echo "</tr>";
        }
    } else {
        echo "<tr><td colspan='5'>No deliveries found for courier '$courierName'.</td></tr>";
    }
    echo "</table>";
} 
?>
