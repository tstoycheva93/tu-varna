<HTML>
<HEAD>
<TITLE>Create Article</TITLE>
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
<FORM name="articleForm" method="post" action="#">
<b> Create article</b> <br><br>
Title: <input type="text" name="title" /> <br>
Author: <input type="text" name="author"  /><br>
Description: <input type="text" name="description"  /><br><br>
<input type="submit" name="articleGo" value="Create and Show" />
</form>

<?php
class Article {
    public $Title;
    public $Author;
    public $Description;

    public function __construct ($t, $a, $d ){
        $this->Title = $t;
        $this->Author = $a;
        $this->Description = $d;
        }

    public function showArticle() {
        $article = $this->Title ."<br> Author: ". $this->Author.
        "<br>Description: ".$this->Description;
        echo "$article<br><br>";
    }
}

if (isset($_POST["articleGo"])) {
    $title=$_POST["title"];
    $author=$_POST["author"];
    $description=$_POST["description"];
    $article = new Article($title, $author, $description);
    $article->showArticle();    
}
?>


 </BODY>
 </html>