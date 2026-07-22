<!DOCTYPE html>
<html>
<head>
  <title>Store</title>
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

    h1 {
      color: #333; 
      text-shadow: 2px 2px 2px #ddd; 
      margin-bottom: 20px; 
      position: absolute; 
      top: 10px; 
      left: 20px; 
    }

    .section {
      display: flex; 
      justify-content: flex-end; 
      flex-direction: column; 
      align-items: flex-end; 
      width: fit-content; 
      margin: 0 auto; 
    }

    .section a {
      padding: 10px 20px;
      border-radius: 5px;
      text-decoration: none;
      color: inherit;
      margin: 5px;
      transition: background-color 0.3s ease;
    }

    .section a:hover {
      background-color: #e0e0e0; 
    }

    footer {
      background-color: #f5f5f5; 
      padding: 10px;
      font-size: 14px;
      text-align: center;
      position: fixed; 
      bottom: 0; 
      width: 100%; 
    }
  </style>
</head>
<body>

<h1>store</h1>

<div class="section">
  <a href='input.php'>input</a>
  <a href='print.php'>view</a>
  <a href='queries.php'>explore</a>
</div>

<footer id="footer">
<?php echo date("Y"); ?>  &deg;  <span id="current-time"></span>
</footer>

<script>
  function updateTime() {
    var currentTime = new Date().toLocaleTimeString('en-BG', {timeZone: 'Europe/Sofia', hour12: false, hour: "2-digit", minute: "2-digit"});
    document.getElementById('current-time').textContent = currentTime;
  }

  setInterval(updateTime, 1000);
</script>
</body>
</html>
