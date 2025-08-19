<?php
require_once("../models/airport.php");

$airport = new airport();

if(isset($_POST['saveairport'])){
    $airportname = $_POST['airportname'];
    $cityid = $_POST['cityid'];
    $result = $airport->insertairport($airportname, $cityid);
    echo json_encode($result);
}

if(isset($_GET['getairport'])){
    $result = $airport->getairport();
    echo $result;
}

if(isset($_GET['listairport'])){
    $result = $airport->listairport();
    echo $result;
}

if(isset($_POST['deleteairport'])){
    $airportid = $_POST['airportid'];
    $result = $airport->deleteairport($airportid);
    echo json_encode($result);
}
?>