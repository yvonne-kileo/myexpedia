<?php
require_once("../models/currency.php");

$currency = new currency();

if(isset($_POST['savecurrency'])){
    $currencycode = $_POST['currencycode'];
    $currencyname = $_POST['currencyname'];
    $result = $currency->insertcurrency($currencycode, $currencyname);
    echo json_encode($result);
}

if(isset($_GET['getcurrency'])){
    $result = $currency->getcurrency();
    echo $result;
}

if(isset($_GET['listcurrency'])){
    $result = $currency->listcurrency();
    echo $result;
}

if(isset($_POST['deletecurrency'])){
    $currencyid = $_POST['currencyid'];
    $result = $currency->deletecurrency($currencyid);
    echo json_encode($result);
}
?>