<?php
require_once("../models/countries.php");

try {
    $country = new country();

    if (isset($_POST['savecountry'])) {
        $countryname = $_POST['countryname'];
        $response = $country->insertcountry($countryname);
        echo json_encode($response);
    }

    if (isset($_GET['getcountry'])) {
        $response = $country->getcountry();
        echo $response;
    }

    if (isset($_GET['listcountry'])) {
        $response = $country->listcountry();
        echo $response;
    }

    if (isset($_POST['deletecountry'])) {
        $countryid = $_POST['countryid'];
        $response = $country->deletecountry($countryid);
        echo json_encode($response);
    }
} catch (Exception $e) {
    echo json_encode(array("error" => $e->getMessage()));
}
?>