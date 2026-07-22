<?php

function calculateTriangleArea($a, $b, $c) {
    if ($a + $b > $c && $a + $c > $b && $b + $c > $a) {
        $p = ($a + $b + $c) / 2;
        $area = sqrt($p * ($p - $a) * ($p - $b) * ($p - $c));
        return number_format($area, 2);
        } else {
        return "Триъгълник с такива страни не съществува.";
    }
}

function determineTriangleType($a, $b, $c) {
    if ($a == $b && $b == $c) {
        return "Триъгълникът е равностранен.";
    } elseif ($a == $b || $a == $c || $b == $c) {
        return "Триъгълникът е равнобедрен.";
    } else {
        return "Триъгълникът е разностранен";
    }
}

