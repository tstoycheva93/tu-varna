<HTML>
<HEAD>
<TITLE>homework 3</TITLE>
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

<FORM name="form1" method="post" action="#" >
<b>TASK 1:</b> <br>
Print numbers 1-10 to the power of 3! <br>
<input type="submit" name="task1" value="Go" />
</form>
<?php
if(isset($_POST['task1'])) {
    echo "<ul>";
    for($i = 1; $i <= 10; $i++) {
        $cube = $i * $i * $i;
        echo "<li style='list-style-type: none;'>";
        echo "<span>&#9642;</span> x={$i}";
        echo "<ul class='cube'><li> x^3={$cube}</li></ul>";
        echo "</li>";
    }
    echo "</ul>";
}
?>
<br>

<FORM name="form2" method="post" action="#" >
<b>TASK 2:</b> <br> Print things! <br>
<input type="submit" name="task2" value="Go" />
</form>

<?php
if (isset($_POST['task2']))
{
$i=1;
while ($i<10) {
    echo "abc ";
    $i++;
}
echo "<br>";
$i=1;
do {
    echo "xyz ";
    $i++;
    
} while ($i< 10);
echo "<br>";
for ($i=1;$i<10;$i++)
{
    echo "$i &nbsp&nbsp&nbsp&nbsp";
}
echo '<ol style="margin-left: 5px;">';
for ($i = 65; $i <= 70; $i++) {
    echo '<li>Item ' . chr($i) . '</li>';
}
echo '</ol>';
}
?>
<br>


<FORM name="form3" method="post" action="#" >
<b>TASK 3:</b> <br> Print table with 1-7 multiplication! <br>
<input type="submit" name="task3" value="Go" />
</form>

<table>
<?php
if (isset($_POST['task3']))
{
    for ($i = 1; $i <= 7; $i++) {
        echo "<tr>";
        for ($j = 1; $j <= 7; $j++) {
            echo "<td>" . ($i * $j) . "</td>";
        }
        echo "</tr>";
    }
}
?>
</table>
<br>

<FORM name="form4" method="post" action="#" >
<b>TASK 4:</b> <br> Determine a prime number! <br>
<input type="number" name="prime"/> <br>
<input type="submit" name="task4" value="Go" />
</form>

<?php
if (isset($_POST['task4']))
{
$number= $_POST['prime'];
$isPrime=true;
if ($number <= 1) {
    $isPrime = false;
} 
else {
    for ($i = 2; $i <= sqrt($number); $i++) {
        if ($number % $i == 0) {
            $isPrime = false;
            break;
        }
    }
if ($isPrime) {
    echo "The number $number is prime. <br>";
}
else {
    echo "The number $number is not prime. <br>";
}
}
}
?>
<br>


<FORM name="form5" method="post" action="#" >
<b>TASK 5:</b> <br> 
Count even digits in number! <br>
<input type="number" name="number"/> <br>
<input type="submit" name="task5" value="Go" />
</form>

<?php
if (isset($_POST['task5']))
{
$number = $_POST['number'];
$numberStr = (string)$number;
$count=0;
for ($i = 0; $i < strlen($numberStr); $i++) {
    if ($numberStr[$i] % 2 == 0) {
        $count++;
    }
}
echo "There are $count even digits in the number $number. <br>";
}
?>
<br>

<FORM name="form6" method="post" action="#" >
<b>TASK 6:</b> <br>
Print numbers between 1-100 with digit sum equal to X! <br> 
<input type="text" name="number"> <br>
<button type="submit" name="task6">Go</button>
</form>

<?php
if(isset($_POST['task6'])) {
    $X = ($_POST['number']); 

    for ($i = 1; $i <= 100; $i++) {
        $sum = array_sum(str_split($i)); 
        if ($sum == $X) {
            echo $i . "<br>";
        }
    }
}
?>

 </BODY>