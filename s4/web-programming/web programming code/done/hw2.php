<HTML>
<HEAD>
<TITLE>homework 2</TITLE>
<style>
    form{
        border: 2px solid #ccc;
        margin: 0 auto;
        max-width: 400px;
        padding: 10px;
    }
</style>
</HEAD>
<BODY>

<FORM name="form1" method="post" action="#" >
<b>TASK 1:</b> <br>
Enter age: <br><input type="number" name="age1" /> <br>
Enter price: <br><input type="number" name="price1" /> <br>
<input type="submit" name="task1" value="Go" />
</form>
<?php
if (isset($_POST['task1']))
{
$age = $_POST['age1'];
$price = $_POST['price1'];
if ($age<=6 || $age>=65) $price=$price/2;
echo "The price is $price.";
}
echo "</br>";
?>

<FORM name="form2" method="post" action="#" >
<b>TASK 2:</b> <br> Find solution for ax^2+bx+c <br>
a: <input type="number" name="a" /> <br>
b: <input type="number" name="b" /><br>
c: <input type="number" name="c" /><br>
<input type="submit" name="task2" value="Go" />
</form>
<?php
if (isset($_POST['task2']))
{
$a = $_POST['a'];
$b = $_POST['b'];
$c = $_POST['c'];
$d = $b * $b - 4 * $a * $c;
echo "Discriminant: $d <br>";
if ($d < 0) {
    echo "No solution"; 
}
else {
    $root1 = (-($b) + sqrt($d)) / (2 * $a);
    $root2 = (-($b) - sqrt($d)) / (2 * $a);
    echo "Root 1: ", number_format($root1, 2), "<br>";
    echo "Root 2: ", number_format($root2, 2), "<br>";
}
}
echo "<br>";
?>

<FORM name="form3" method="post" action="#" >
<b>TASK 3:</b> <br> Enter number of the month: <br>
<input type="number" name="month" /> <br>
<input type="submit" name="task3" value="Go" />
</form>
<?php
if (isset($_POST['task3']))
{
$month = $_POST['month'];
$season='';
switch ($month):
    case 1:
    case 2:
    case 12:
        $season='Winter';
        break;
    case 3:
    case 4:
    case 5:
        $season='Spring';
        break;
    case 6:
    case 7:
    case 8:
        $season= 'Summer';
        break;
    case 9:
    case 10:
    case 11:
        $season= 'Autumn';
        break;
    default: 
    $season='none';
    break;
endswitch;
echo "The season is ", $season, "<br>";
}
?>
<br>
<FORM name="form4" method="post" action="#" >
<b>TASK 4:</b> <br> Find out if it's August right now! <br>
<input type="submit" name="task4" value="Go" />
</form>
<?php
if (isset($_POST['task4']))
{
$month=date("F");
if ($month==="August") {
    echo "It's August, and it's really hot. <br>";
}
else {
    echo "It's not August, so at least it's not too hot.";
}
echo "<br>";
}
?>
<br>
<FORM name="form5" method="post" action="#" >
<b>TASK 5:</b> <br> 
Enter the number: <br>
<input type="number" name="number"/> <br>
Enter the digit: <br>
<input type="number" name="digit"/> <br>
<input type="submit" name="task5" value="Go" />
</form>
<?php
if (isset($_POST['task5']))
{
$number = $_POST['number'];
$digit = $_POST['digit'];
$count=0;
while ($number>0) {
    if ($number%10==$digit) {
        $count++;
    }
    $number=(int)($number/10);
}
echo "The digit is contained $count times in the number. <br>";
}
?>
<br>

<FORM name="form6" method="post" action="#" >
<b>TASK 6:</b> <br> Print squares and square roots of numbers 1-12! <br>
<input type="submit" name="task6" value="Go" />
</form>
<?php
if (isset($_POST['task6']))
{
    echo "<table border='1'>";
    echo "<tr><th>Number</th><th>Square</th><th>Square Root</th></tr>";
    for($i = 1; $i <= 12; $i++) {
        $square = $i * $i;
        $square_root = sqrt($i);
        $formatted_square_root = number_format($square_root, 2);
        echo "<tr><td>$i</td><td>$square</td><td>$formatted_square_root</td></tr>";
    }
    echo "</table>";
}
?>
<br>



<FORM name="form7" method="post" action="#" >
<b>TASK 7:</b> <br><br> 
Name: <br>
<input type="text" name="name"/> <br>
Surname: <br>
<input type="text" name="surname"/> <br>
E-mail: <br>
<input type="text" name="email"/> <br><br>
Choose a course: <br>
<input type="radio" id="php" name="course" value="PHP">
<label for="php">PHP</label><br>
<input type="radio" id="lisp" name="course" value="Lisp">
<label for="lisp">Lisp</label><br>
<input type="radio" id="perl" name="course" value="Perl">
<label for="perl">Perl</label><br>
<input type="radio" id="unix" name="course" value="Unix">
<label for="unix">Unix</label><br><br>
Additional information: <br>
<input type="text" id="textbox" name="textbox" size="30" placeholder="Enter..."/><br>
<br>
<input type="checkbox" id="confirm" name="confirm" value="Confirm">
<label for="checkbox1">Confirm receiving of information</label><br>
<br>
<input type="submit" name="subm7" value="Submit" />
<input type="reset" name="res7" value="Reset" />
</form>

<?php
if (isset($_POST['subm7']))
{
$name = $_POST['name'];
$surname = $_POST['surname'];
$email = $_POST['email'];
if(isset($_POST['course'])) {
    $course = $_POST['course'];
}
if(isset($_POST['textbox'])) {
    $textbox= $_POST['textbox'];
}
echo "Hello, $name $surname! <br> Your choice is $course. <br>
Additional information: $textbox (may be none). <br>";
}
?>

 </BODY>