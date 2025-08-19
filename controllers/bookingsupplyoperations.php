<?php
require_once("../models/bookingsupply.php");

$bookingsupply = new bookingsupply();

if(isset($_POST['savebookingsupply'])){
    $flightid = $_POST['flightid'];
    $bookingclassid = $_POST['bookingclassid'];
    $numberseats = $_POST['numberseats'];
    $price = $_POST['price'];
    $currency = $_POST['currency'];
    $result = $bookingsupply->insertbookingsupply($flightid, $bookingclassid, $numberseats, $price, $currency);
    echo json_encode($result);
}

if(isset($_GET['getbookingsupply'])){
    $result = $bookingsupply->getbookingsupply();
    echo $result;
}

if(isset($_GET['listbookingsupply'])){
    $result = $bookingsupply->listbookingsupply();
    echo $result;
}

if(isset($_POST['deletebookingsupply'])){
    $bookingsupplyid = $_POST['bookingsupplyid'];
    $result = $bookingsupply->deletebookingsupply($bookingsupplyid);
    echo json_encode($result);
}
?>