<?php
require_once("../models/city.php");

$city = new City();

if (isset($_POST['insertcity'])) {
    $cityname = $_POST['cityname'];
    $countryid = $_POST['countryid'];
    $response = $city->insertcity($cityname, $countryid);
    echo json_encode($response);
}

if (isset($_GET['getcity'])) {
    $id = $_GET['id'];
    echo $city->getcity($id);
}

if (isset($_GET['listcity'])) {
    echo $city->listcity();
}

if (isset($_POST['deletecity'])) {
    $id = $_POST['id'];
    $response = $city->deletecity($id);
    echo json_encode($response);
}

if (isset($_POST['updatecity'])) {
    $id = $_POST['id'];
    $cityname = $_POST['cityname'];
    $countryid = $_POST['countryid'];
    $response = $city->updatecity($id, $cityname, $countryid);
    echo json_encode($response);
}
?>