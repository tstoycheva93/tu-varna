<HTML>
<HEAD>
<TITLE>homework 7</TITLE>
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
<b>TASK 1:</b> <br>
Show books! <br>
<input type="submit" name="task1" value="Go" />
</form>

<?php
class Books {
    public $Title;
    public $Author;
    public $Price;

    public function __construct ($t, $a, $p ){
        $this->Title = $t;
        $this->Author = $a;
        $this->Price = $p;
        }

    public function showBooks() {
        $book = $this->Title ."<br> Author: ". $this->Author.
        "<br>Price: ".$this->Price;
        echo "$book<br><br>";
    }

}

$book1=new Books("Pride and Prejudice", "Jane Austen", 20);
$book2=new Books("Emma", "Jane Austen", 25);
$book3=new Books("Persuasion", "Jane Austen", 15);


if (isset($_POST["task1"])) {
$book1->showBooks();
$book2->showBooks();
$book3->showBooks();
}
?>

<br>

<FORM name="form2" method="post" action="#">
<b>TASK 2:</b> <br> Create a programmer!<br>
<input type="submit" name="task2" value="Go"/>
</form>

<?php
class Person {
    public $firstName;
    public $lastName;

    public function __construct ($f, $l){
        $this->firstName = $f;
        $this->lastName = $l;
        }

    public function showPerson() {
        $person = $this->firstName ." ". $this->lastName;
        echo "Hello! <br>
        My name is $person.<br>";
    }
}

class Programmer extends Person {
    public $langs=array();

    public function setLang($lang) {
        $this->langs[] = $lang;
    }

    public function showProgrammer() {
        echo "I know the languages " . implode(", ", $this->langs) . "<br>";
    }
}

if (isset($_POST["task2"])) {
    $programmer = new Programmer("Ivan", "Ivanov");
    $programmer->setLang("Lisp");
    $programmer->setLang("Java");
    $programmer->setLang("PHP");
    $programmer->showPerson();  
    $programmer->showProgrammer();
}
?>
<br>

<FORM name="article" method="post" action="createArticle.php" >
<b>TASK 3.1:</b> <br> Create articles and people! <br><br>
<input type="submit" name="article" value="Create article" />
</form>
<br>
<FORM name="person" method="post" action="createPerson.php" >
<b>TASK 3.2:</b> <br> Create articles and people! <br><br>
<input type="submit" name="person" value="Create person" />
</form>



 </BODY>
 </html>