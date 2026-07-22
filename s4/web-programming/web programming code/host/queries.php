<!DOCTYPE html>
<html>
<head>
<head>
  <title>Explore</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&display=swap">
  <style>
    body {
      background-color: #f5f5f5;
      margin: 20px;
      display: flex;
      flex-direction: column;
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
    @media only screen and (max-width: 600px) {
  body {
    padding: 10px;
  }
}
  </style>
</head>

<body>


<h2>products</h2>
<a href='queries/productsByPriceNameGroup.php'>search products</a><br><br>
<a href='queries/topFiveProducts.php'>bestselling products</a><br><br>

<h2>purchases</h2>
<a href='queries/purchasesForPeriod.php'>purchases from-to</a><br>
<a href='queries/purchasesForEmployeeDateASC.php'>purchases by employee</a><br>
<a href='queries/purchasesForClient.php'>purchases by client</a><br><br>

<h2>deliveries</h2>
<a href='queries/deliveredProductsOnDate.php'>delivered products by date</a><br>
<a href='queries/deliveriesByCourier.php'>deliveries by courier</a><br><br>

<a href='index.php' class="home-link" style="text-align: right">home</a>

</body>
</html>
