<?php
require_once("../models/airline.php");

$airline = new airline();

if(isset($_POST['saveairline'])){
    $airlinename = $_POST['airlinename'];
    $result = $airline->insertairline($airlinename);
    echo json_encode($result);
}

if(isset($_GET['getairline'])){
    $result = $airline->getairline();
    echo $result;
}

if(isset($_GET['listairline'])){
    $result = $airline->listairline();
    echo $result;
}

if(isset($_POST['deleteairline'])){
    $airlineid = $_POST['airlineid'];
    $result = $airline->deleteairline($airlineid);
    echo json_encode($result);

}catch (Exception $e) {
    echo json_encode(array("error" => $e->getMessage()));
}
?>