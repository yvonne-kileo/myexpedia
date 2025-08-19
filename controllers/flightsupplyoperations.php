<?php
require_once("../models/flightsupply.php");

$flightsupply = new flightsupply();

if(isset($_POST['insertflightsupply'])){
    $flightid = $_POST['flightid'];
    $airlineid = $_POST['airlineid'];
    $result = $flightsupply->insertflightsupply($flightid, $airlineid);
    echo json_encode($result);
}

if(isset($_GET['getflightsupply'])){
    $result = $flightsupply->getflightsupply();
    echo $result;
}

if(isset($_GET['listflightsupply'])){
    $result = $flightsupply->listflightsupply();
    echo $result;
}

if(isset($_POST['deleteflightsupply'])){
    $flightsupplyid = $_POST['flightsupplyid'];
    $result = $flightsupply->deleteflightsupply($flightsupplyid);
    echo json_encode($result);
}
?>