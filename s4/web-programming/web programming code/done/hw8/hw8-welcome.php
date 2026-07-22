<HTML>
<HEAD>
<TITLE>Welcome</TITLE>
</HEAD>
<BODY>
<?php
if(isset($_COOKIE["user"])) {
    echo "Welcome " . $_COOKIE["user"] . "!<br>";
    echo "All cookies:<br>";

    foreach ($_COOKIE as $key => $value) {
        echo $key . " : " . $value . "<br>";
    }
    echo '<a href="hw8-last.php">Delete Cookie</a>';
} else {
    echo "Cookie 'user' is not set!<br>";
    echo '<a href="hw8-index.php">Go to Index page</a>';

}
?>
 </BODY>
 </html>