<!DOCTYPE html>
<html>
<head>
  <title>Input Clients</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&display=swap">
  <style>
    body {
      background-color: #f5f5f5;
      margin: 20px;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
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
    @media only screen and (max-width: 600px) {
  body {
    padding: 10px;
  }
}
  </style>
</head>
<body>


<form action="inputClients.php" method="post">
<h2>input a client</h2>
  <div class="form-group">
    <label for="name">name:</label>
    <input type="text" id="name" name="name" required>
  </div>
  <div class="form-group">
    <label for="phone">phone:</label>
    <input type="tel" id="phone" name="phone" placeholder="123-456-7890" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required>
  </div>
  <div class="form-group">
    <input type="submit" value="submit" name="clients">
  </div>
  <a href='../index.php' class="home-link">home</a>
  <a href='../print/printClients.php' class="home-link">view</a>
</form>

</body>
</html>

<?php
include '../config.php';

if (isset($_POST['clients'])) {
    $name = $_POST['name'];
    $phone = $_POST['phone'];

    $sql = "INSERT INTO clients (name, phone) VALUES (?, ?)";
    $stmt = $conn->prepare($sql);

    $stmt->bind_param('ss', $name, $phone);

    if ($stmt->execute()) {
        echo "Success!<br>";
    } else {
        echo "Error: " . $stmt->error;
    }
    $conn->close();
}
?>
