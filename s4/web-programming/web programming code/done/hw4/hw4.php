<HTML>
<HEAD>
<TITLE>homework 4</TITLE>
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
Print students' grades! <br>
<input type="submit" name="task1" value="Go" />
</form>

<?php
if (isset($_POST["task1"])) {
$students = array(
    "Иван Иванов" => 4,
    "Драган Драганов" => 5.45,
    "Димо Петров" => 5.67
);

echo "<ol>";
foreach ($students as $name => $success) {
    echo "<li>Студент $name има успех $success</li>";
}
echo "</ol>";

echo "<ul>";
foreach ($students as $name => $success) {
    echo "<li> Студент $name има успех $success</li>";
}
echo "</ul>";

echo "<table border='1'>
        <tr>
            <th>Име, фамилия</th>
            <th>Успех</th>
        </tr>";
foreach ($students as $name => $success) {
    echo "<tr>
            <td>$name</td>
            <td>$success</td>
          </tr>";
}
echo "</table>";
}
?>
<br>

<!-- ------------------------------------------------------------------------ -->

<FORM name="form2" method="post" action="#" >
<b>TASK 2:</b> <br>
Print the 10 largest cities! <br>
<input type="submit" name="cities1" value="Go" /> <br>
Sort alphabetially! <br>
<input type="submit" name="cities2" value="Go" /> <br>
Add 4 more cities and sort alphabetically! <br>
<input type="submit" name="cities3" value="Go" />
</form>

<?php
$cities = array(
    "Tokyo",
    "Mexico City",
    "New York City",
    "Mumbai",
    "Seoul", 
    "Shanghai", 
    "Lagos", 
    "Buenos Aires",
    "Cairo",
    "London"
);

if (isset($_POST["cities1"])) {
    foreach($cities as $city) {
        if ($city===end($cities)){
        echo "$city.";
        }
        else echo "$city, ";


    }
} 

else if (isset($_POST["cities2"])) {
   
    sort($cities, SORT_STRING);
    echo "<ul>";
    foreach ($cities as $city) {
        echo "<li>$city</li>";
    }
    echo "</ul>";
} 

else if (isset($_POST["cities3"])) {
    $cities[]="Los Angeles";
    $cities[]="Calcutta";
    $cities[]="Osaka";
    $cities[]="Beijing";
    sort($cities, SORT_STRING);

    echo "<ol>";
    foreach ($cities as $city) {
        echo "<li>$city</li>";
    }
    echo "</ol>";

    echo "<table border='1'>
        <tr>
            <th>Value</th>
            <th>Key</th>
        </tr>";
foreach ($cities as $city => $key) {
    echo "<tr>
            <td>$key</td>
            <td>$city</td>
          </tr>";
}
echo "</table>";


}
?>
<br>
<!-- ------------------------------------------------------------------------ -->

<FORM name="form3" method="post" action="#" >
<b>TASK 3:</b> <br>
Please enter your information: <br><br>
City: <input type="text" name="city"/> <br>
Month: <input type="text" name="month"/> <br>
Year: <input type="text" name="year"/> <br> <br>
Please choose the kinds of weather you experienced from the list below. <br>
Choose all that apply. <br><br>
  <input type="checkbox" id="checkbox1" name="weather[]" value="Sunshine">Sunshine<br>
  <input type="checkbox" id="checkbox1" name="weather[]" value="Clouds">Clouds<br>
  <input type="checkbox" id="checkbox1" name="weather[]" value="Rain">Rain<br>
  <input type="checkbox" id="checkbox1" name="weather[]" value="Hail">Hail<br>
  <input type="checkbox" id="checkbox1" name="weather[]" value="Sleet">Sleet<br>
  <input type="checkbox" id="checkbox1" name="weather[]" value="Snow">Snow<br>
  <input type="checkbox" id="checkbox1" name="weather[]" value="Wind">Wind<br>
  <input type="checkbox" id="checkbox1" name="weather[]" value="Cold">Cold<br>
  <input type="checkbox" id="checkbox1" name="weather[]" value="Heat">Heat<br><br>

<input type="submit" name="task3" value="Go" /> <br>
</form>

<?php
if (isset($_POST["task3"]))
 {              $inputLocal = array(
                'city' => $_POST['city'],
                'month' => $_POST['month'],
                'year' => $_POST['year']
                );

        $weather = $_POST['weather'];
    
        echo "In {$inputLocal['city']} in the month of {$inputLocal['month']} {$inputLocal['year']}, you observed the following weather:<br>";            echo "<ul>";
            foreach ($weather as $option) {
                echo "<li>$option</li>";
            }
            echo "</ul>";
        }
        
?>




 </BODY>