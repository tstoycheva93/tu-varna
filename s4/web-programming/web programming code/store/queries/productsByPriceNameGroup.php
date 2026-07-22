<!DOCTYPE html>
<html>
<head>
    <title>Search Products</title>
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
        <form action="productsByPriceNameGroup.php" method="post">
            <h2>search products</h2>
            <div class="form-group">
                <label for="searchType">field:</label>
                <select name="searchType" required>
                    <option value="name">Name</option>
                    <option value="price">Price</option>
                    <option value="group">Group</option>
                </select>
            </div>
            <div class="form-group">
                <label for="searchTerm">value:</label>
                <input type="text" name="searchTerm" required><br>
            </div>
            <div class="form-group">
                <input type="submit" value="search" name="productsByPriceNameGroup">
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

if (isset($_POST['productsByPriceNameGroup'])) {
    $searchType = $_POST['searchType'];
    $searchTerm = $_POST['searchTerm'];

    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "";
    if ($searchType === "group") {
        $sql = "SELECT products.id, products.name, products.price, groups.name AS groupName 
                FROM products 
                INNER JOIN groups ON products.groupsKey = groups.id 
                WHERE groups.name LIKE ?";
    } else {
        $sql = "SELECT products.id, products.name, products.price, groups.name AS groupName 
                FROM products 
                INNER JOIN groups ON products.groupsKey = groups.id 
                WHERE products.$searchType LIKE ?";
    }
    
    $stmt = $conn->prepare($sql);
    $searchTerm = "%{$searchTerm}%";
    $stmt->bind_param("s", $searchTerm);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        echo "<table border='1'>";
        echo "<tr><th>Name</th><th>Price</th><th>Group</th></tr>";
        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>" . ucfirst($row['name']) . "</td>"; 
            echo "<td>" . $row['price'] . "</td>";
            echo "<td>" . ucfirst($row['groupName']) . "</td>"; 
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "No products found.";
    }

    $stmt->close();
    $conn->close();
}
?>


