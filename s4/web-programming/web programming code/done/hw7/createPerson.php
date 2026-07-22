<HTML>
<HEAD>
<TITLE>Create Person</TITLE>
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
<FORM name="personForm" method="post" action="#">
<b> Create person</b> <br><br>
Name: <input type="text" name="name"/> <br>
Surname: <input type="text" name="surname"/><br>
Email: <input type="text" name="email"/><br><br>
<input type="submit" name="personGo" value="Create and Show" />
</form>

<?php
class Person {
    public $firstName;
    public $surname;
    public $email;

    public function __construct ($n, $s, $e ){
        $this->firstName = $n;
        $this->surname = $s;
        $this->email = $e;
        }

    public function showPerson() {
        $person = $this->firstName ." ". $this->surname.
        "<br>Email: ".$this->email;
        echo "$person<br><br>";
    }
}
if (isset($_POST["personGo"])) {
    $name=$_POST["name"];
    $surname=$_POST["surname"];
    $email=$_POST["email"];
    $person = new Person($name, $surname, $email);
    $person->showPerson();    
}
?>


 </BODY>
 </html>