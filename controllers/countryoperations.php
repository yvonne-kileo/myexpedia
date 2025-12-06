<?php
require_once("../models/countries.php");

$country = new country();

try {
    // Insert new country
    if(isset($_POST['savecountry'])){
        $countryname = $_POST['countryname'] ?? '';
        echo json_encode($country->insertcountry($countryname));
        exit;
    }

    // Get all countries (for dropdown)
    if(isset($_GET['getcountry'])){
        echo $country->getcountry();
        exit;
    }

    // List countries (for table)
    if(isset($_GET['listcountry'])){
        echo $country->listcountry();
        exit;
    }

    // Delete country
    if(isset($_POST['deletecountry'])){
        $countryid = $_POST['countryid'] ?? 0;
        echo json_encode($country->deletecountry($countryid));
        exit;
    }

} catch(Exception $e){
    echo json_encode(["status"=>"error","message"=>$e->getMessage()]);
}
?>
