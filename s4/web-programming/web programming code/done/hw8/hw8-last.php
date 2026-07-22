<HTML>
<HEAD>
<TITLE>Last</TITLE>
</HEAD>
<BODY>
<?php
setcookie("user", "", time() - 3600, "/");
echo "Cookie 'user' is deleted. <br>";
echo '<a href="hw8-welcome.php">Go to Welcome page</a>';
?>
 </BODY>
 </html>