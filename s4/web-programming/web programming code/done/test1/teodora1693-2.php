<HTML>
<HEAD>
<TITLE>Form</TITLE>
<style>
    form{
        padding: 10px;
        border: 0px solid #ccc;
        max-width:400 px;
        margin: 0 auto;
    }

    table {
        border: 0px solid black; 
        padding:2px;
    }
    td {
        border: 1px solid #ccc;
        padding-right: 100px;
        text-align: left;
    }
</style>
</HEAD>
<BODY>
    
<FORM name="task2" action="#" enctype="multipart/form-data">

<?php
$filename1="allNumbers.txt";
$filename2="primeNumbers.txt";

$initialString="7,30,9,88,25,41,44,28,39,100,121,118";
$file1=fopen($filename1,'ab') or die("Файлът не може да се отвори.");
file_put_contents($filename1,$initialString);
$firstString=file_get_contents($filename1);
fclose($file1);

$firstArray=explode(",",$firstString);
$primeArray=prime($firstArray);
$primeString=implode(",",$primeArray);

$file2=fopen($filename2,'wb') or die("Файлът не може да се отвори.");
file_put_contents($filename2,$primeString);
$primeString=file_get_contents($filename2);
fclose($file2);

$differentNumbers=array_diff($firstArray,$primeArray);
$divBy3=[];
$mul=1;
foreach ($differentNumbers as $number){
    if ($number%3==0) {
        $divBy3[]=$number;
        $mul*=$number;
    }
}

$differentString=implode(",",$differentNumbers);
$divisibleString=implode(",",$divBy3);

$max1=max($firstArray);
$max2=max($primeArray);

$fact1=factoriel($max1);
$fact2=factoriel($max2);

echo "<table>";
    echo "<tr>
            <td>All numbers: $firstString</td>
        </tr>";
    echo "<tr>
            <td>Prime numbers: $primeString</td>
          </tr>";
    echo "<tr>
          <td>Different numbers: $differentString</td>
        </tr>";
    echo "<tr>
            <td>Divisible by 3: $divisibleString</td>
        </tr>";
    echo "<tr>
            <td>Multiplication: $mul</td>
          </tr>";
    echo "<tr>
          <td>Largest numbers: $max1 for $filename1, and $max2 for $filename2.</td>
        </tr>";
    echo "<tr>
        <td>Factorials: $fact1 for $max1 and $fact2 for $max2.</td>
      </tr>";
echo "</table>";

function prime($array) {
    $primeArray = [];

    foreach ($array as $value) {
        if ((int)$value > 1) {
            $isPrime = true;
            for ($i = 2; $i <= sqrt((int)$value); $i++) {
                if ((int)$value % $i == 0) {
                    $isPrime = false;
                    break;
                }
            }
            if ($isPrime) {
                $primeArray[] = $value;
            }
        }
    }

    return $primeArray;
}
function factoriel ($num){
    if ($num==0) {
        return 1;
    }
    else {
        return $num*factoriel($num-1);
    }
    }
?>

</form>
</body>
</html>




