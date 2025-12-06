<?php
require_once("../models/city.php");

$city = new City();

try {
    if (isset($_POST['insertcity'])) {
        $cityname = $_POST['cityname'];
        $countryid = $_POST['countryid'];
        $response = $city->insertcity($cityname, $countryid);
        echo json_encode($response);
        exit;
    }

    if (isset($_GET['getcity'])) {
        $id = $_GET['id'];
        echo $city->getcity($id);
        exit;
    }

    if (isset($_GET['listcity'])) {
        echo $city->listcity();
        exit;
    }

    if (isset($_POST['deletecity'])) {
        $id = $_POST['id'];
        $response = $city->deletecity($id);
        echo json_encode($response);
        exit;
    }

    if (isset($_POST['updatecity'])) {
        $id = $_POST['id'];
        $cityname = $_POST['cityname'];
        $countryid = $_POST['countryid'];
        $response = $city->updatecity($id, $cityname, $countryid);
        echo json_encode($response);
        exit;
    }

} catch (Exception $e) {
    echo json_encode(array("error" => $e->getMessage()));
}
