<HTML>
<HEAD>
<TITLE>homework 8</TITLE>
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

<FORM name="form1" method="post" action="#">
<b>TASK 1</b> <br>
Donation! <br><br>
<input type="submit" name="task1" value="Go" />
</form>
<br>

<?php
class Donation {
    public $name;
    public $amount;
    public static $totalDonated = 0;
    public static $numberOfDonors = 0;

    public function __construct($name, $amount) {
        $this->name = $name;
        $this->amount = $amount;
        self::$totalDonated += $amount;
        self::$numberOfDonors++;
    }
    public function info() {
        $percentage = ($this->amount / self::$totalDonated) * 100;
        $formatted_percentage = number_format($percentage, 2);
        echo "{$this->name} donated {$this->amount} ({$formatted_percentage}%)<br>";
    }
}

$donors = array(
    new Donation("Nichola", 85.00),
    new Donation("Mitko", 50.00),
    new Donation("Emily", 90.00),
    new Donation("Iliana", 65.00)
);

if (isset($_POST['task1'])) {
foreach ($donors as $donor) {
    $donor->info();
}

echo "Total Donations = " . Donation::$totalDonated . " BGN <br>";
echo "Number of Donors = " . Donation::$numberOfDonors;
}
?>




 </BODY>
 </html>