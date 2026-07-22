<!DOCTYPE html>
<html>
<head>
  <title>Input</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&display=swap">
  <style>
    body {
      background-color: #f5f5f5;
      margin: 20px;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
      font-family: 'Poppins', sans-serif;
    }

    h2 {
      color: #333;
      text-shadow: 2px 2px 2px #ddd;
      margin-bottom: 10px;
    }

    a {
      padding: 10px 20px;
      border-radius: 5px;
      text-decoration: none;
      color: inherit;
      margin: 5px;
      transition: background-color 0.3s ease;
    }

    a:hover {
      background-color: #e0e0e0;
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

<h2>resources</h2>
<a href='input/inputJobs.php'> jobs</a><br>
<a href='input/inputEmployees.php'> employees</a><br>
<a href='input/inputClients.php'> clients</a><br><br>

<h2>products</h2>
<a href='input/inputGroups.php'> groups</a><br>
<a href='input/inputProducts.php'> products</a><br><br>

<h2>logistics</h2>
<a href='input/inputCouriers.php'> couriers</a><br>
<a href='input/inputDeliveries.php'> deliveries</a><br><br>

<h2>records</h2>
<a href='input/inputPurchases.php'> purchases</a><br>
<a href='input/inputItems.php'> items</a><br><br>

<a href='index.php' class="home-link" style="text-align: right">home</a>

</body>
</html>
