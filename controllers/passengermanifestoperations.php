<?php
require_once("../models/passengermanifest.php");

$passengermanifest = new passengermanifest();

if(isset($_POST['savepassengermanifest'])){
    $bookingid = $_POST['bookingid'];
    $bookingclassid = $_POST['bookingclassid'];
    $price = $_POST['price'];
    $currencyid = $_POST['currencyid'];
    $identificationdocid = $_POST['identificationdocid'];
    $passengername = $_POST['passengername'];
    $dob = $_POST['dob'];
    $genderid = $_POST['genderid'];
    $result = $passengermanifest->insertpassengermanifest($bookingid, $bookingclassid, $price, $currencyid, $identificationdocid, $passengername, $dob, $genderid);
    echo json_encode($result);
}

if(isset($_GET['getpassengermanifest'])){
    $result = $passengermanifest->getpassengermanifest();
    echo $result;
}

if(isset($_GET['listpassengermanifest'])){
    $result = $passengermanifest->listpassengermanifest();
    echo $result;
}

if(isset($_POST['deletepassengermanifest'])){
    $passengermanifestid = $_POST['passengermanifestid'];
    $result = $passengermanifest->deletepassengermanifest($passengermanifestid);
    echo json_encode($result);
}
?>