<?php
function readFileToString($filename) {
    $fileContent = file_get_contents($filename);
    return $fileContent;
}

function findMultiplesOfFive ($array) {
    $product=1;
    echo "Елементи на масива, кратни на пет: ";
    foreach ($array as $key => $value) {
        if ($value % 5 == 0) {
            echo "$value ";
            $product *= $value;
        }
}
echo "<br> Тяхното произведение: $product <br>";


}

function printLargerNeighbors($array) {
    echo "Елементи на масива, по-големи от своите съседи: ";
    foreach ($array as $key => $value) {
        if ($key == 0 && $value > $array[$key + 1]) {
            echo "$value ";
        }
        if ($key == count($array) - 1 && $value > $array[$key - 1]) {
            echo "$value ";
        }
        if ($key > 0 && $key < count($array) - 1 && $value > $array[$key - 1] && $value > $array[$key + 1]) {
            echo "$value ";
        }
    }
}
