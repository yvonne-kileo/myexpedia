<?php
require_once("../models/paymentmethod.php");

$paymentmethod = new paymentmethod();

if(isset($_POST['savepaymentmethod'])){
    $paymentname = $_POST['paymentname'];
    $result = $paymentmethod->insertpaymentmethod($paymentname);
    echo json_encode($result);
}

if(isset($_GET['getpaymentmethod'])){
    $result = $paymentmethod->getpaymentmethod();
    echo $result;
}

if(isset($_GET['listpaymentmethod'])){
    $result = $paymentmethod->listpaymentmethod();
    echo $result;
}

if(isset($_POST['deletepaymentmethod'])){
    $paymentmethodid = $_POST['paymentmethod'];
    $result = $paymentmethod->deletepaymentmethod($paymentmethod);
    echo json_encode($result);
}
?>