<?php
require_once("../models/bookingclass.php");

$bookingclass = new bookingclass();

if(isset($_POST['insertbookingclass'])){
    $bookingclassname = $_POST['typename'];
    $result = $bookingclass->insertbookingclass($typename);
    echo json_encode($result);
}

if(isset($_GET['getbookingclass'])){
    $result = $bookingclass->getbookingclass();
    echo $result;
}

if(isset($_GET['listbookingclass'])){
    $result = $bookingclass->listbookingclass();
    echo $result;
}

if(isset($_POST['deletebookingclass'])){
    $bookingclassid = $_POST['bookingclassid'];
    $result = $bookingclass->deletebookingclass($bookingclassid);
    echo json_encode($result);
}
?>