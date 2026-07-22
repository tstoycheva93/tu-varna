<HTML>
<HEAD>
<TITLE>homework 5</TITLE>
<style>
    form{
        border: 2px solid #ccc;
        margin: 0 auto;
        max-width: 400px;
        padding: 10px;
    }
    table {
        border: 2px solid black; 
    }
    td {
        border: 1px solid black; 
        padding: 8px;
        text-align: center;
    }
</style>
</HEAD>
<BODY>

<form name="form1">
    <b>TASK 1</b> <br>
    Area of a rectangle: <br>
    <?php
    function recArea($l, $w) {
        return $l * $w;
    }
    $length = "2";
    $width = "4";
    $area = recArea($length, $width);
    ?>
    <p>The area of a rectangle with length <?php echo $length; ?> and width <?php echo $width; ?> is <?php echo "$area."; ?></p>
</form>
<br>

<!-- ------------------------------------------------------------------------ -->

<FORM name="form2" method="post" action="#" >
<b>TASK 2</b> <br>
Area of a rectangle:<br><br>
Enter length and width of the rectangle.<br>
Length: <input type="number" name="length"/> <br>
Width: <input type="number" name="width"/> <br>
<input type="submit" name="task2" value="Go" />
</form>

<?php
    function rectArea($l, $w) {
        return $l * $w;
    }
    if (isset($_POST["task2"])) {
    $length = $_POST['length'];
    $width = $_POST['width'];
    $area = rectArea($length, $width);
    echo "The area of a rectangle with length $length and width $width is $area.";
    }
    ?>

<br>

<!-- ------------------------------------------------------------------------ -->


<FORM name="form3" method="post" action="#">
<b>TASK 3</b> <br>
Work with strings!<br>
<input type="submit" name="task3" value="Go"/>
</form>

<?php
if(isset($_POST["task3"])) {
    function calculateStringLength($string) {
        return strlen($string);
    }
    
    function searchForSubstring($string, $substring) {
        return strpos($string, $substring) !== false;
    }
    
    function splitString($string) {
        return explode(" ", $string);
    }
    
    function replaceSubstring($string, $search, $replace) {
        return str_replace($search, $replace, $string);
    }
    
    function compareStrings($string1, $string2) {
        return $string1 === $string2 ? "Низовете са еднакви." : "Низовете не са еднакви.";
    }
    
    $string1 = "Студентът Иван Иванов има отлична оценка по дисциплина Web приложения.";
    $string2 = "Иван Петров има отлична оценка по Web приложения.";
    
    echo "Дължина на първия низ: " . calculateStringLength($string1) . "<br>";
    echo "Дължина на втория низ: " . calculateStringLength($string2) . "<br>";
    
    echo searchForSubstring($string1, "Иванов") ? "Иванов е намерен в първия низ.<br>" : "Иванов не е намерен в първия низ.<br>";
    
    $parts1 = splitString($string1);
    $parts2 = splitString($string2);
    
    echo "Части на първия низ: ";
    print_r($parts1);
    echo "<br>";
    
    echo "Части на втория низ: ";
    print_r($parts2);
    echo "<br>";
    
    $newString1 = replaceSubstring($string1, "дисциплина", "предмет");
    echo "Първи низ след замяна: $newString1 <br>";
    
    echo compareStrings($string1, $string2);
}
    ?>
<br>

</body>
</html>
