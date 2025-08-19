<?php
require_once("../models/booking.php");

$booking = new booking();

if(isset($_POST['savebooking'])){
    $bookingtypeid = $_POST['bookingtypeid'];
    $currencyid = $_POST['currencyid'];
    $flightid = $_POST['flightid'];
    $bookingdate = $_POST['bookingdate'];
    $paymentmethod = $_POST['paymentmethod'];
    $result = $booking->insertbooking($bookingtypeid, $currencyid, $flightid, $bookingdate, $paymentmethod);
    echo json_encode($result);
}

if(isset($_GET['getbooking'])){
    $result = $booking->getbooking();
    echo $result;
}

if(isset($_GET['listbooking'])){
    $result = $booking->listbooking();
    echo $result;
}

if(isset($_POST['deletebooking'])){
    $bookingid = $_POST['bookingid'];
    $result = $booking->deletebooking($bookingid);
    echo json_encode($result);
}
?>