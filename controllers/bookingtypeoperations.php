<?php
require_once("../models/bookingtype.php");

$bookingtype = new bookingtype();

if(isset($_POST['savebookingtype'])){
    $bookingtypename = $_POST['bookingname'];
    $result = $bookingtype->insertbookingtype($bookingname);
    echo json_encode($result);
}

if(isset($_GET['getbookingtype'])){
    $result = $bookingtype->getbookingtype();
    echo $result;
}

if(isset($_GET['listbookingtype'])){
    $result = $bookingtype->listbookingtype();
    echo $result;
}

if(isset($_POST['deletebookingtype'])){
    $bookingtypeid = $_POST['bookingtypeid'];
    $result = $bookingtype->deletebookingtype($bookingtypeid);
    echo json_encode($result);
}
?>