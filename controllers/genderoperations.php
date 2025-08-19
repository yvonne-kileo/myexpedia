<?php
require_once("../models/gender.php");

$gender = new gender();

if(isset($_POST['insertgender'])){
    $gendername = $_POST['gendername'];
    $result = $gender->insertgender($gendername);
    echo json_encode($result);
}

if(isset($_GET['getgender'])){
    $result = $gender->getgender();
    echo $result;
}

if(isset($_GET['listgender'])){
    $result = $gender->listgender();
    echo $result;
}

if(isset($_POST['deletegender'])){
    $genderid = $_POST['genderid'];
    $result = $gender->deletegender($genderid);
    echo json_encode($result);
}
?>