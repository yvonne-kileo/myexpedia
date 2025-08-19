<?php
require_once("identificationdocs.php");

$identificationdocs = new identificationdocs();

if(isset($_POST['insertidentificationdocs'])){
    $documentname = $_POST['documentname'];
    $result = $identificationdocs->insertidentificationdocs($documentname);
    echo json_encode($result);
}

if(isset($_GET['getidentificationdocs'])){
    $result = $identificationdocs->getidentificationdocs();
    echo $result;
}

if(isset($_GET['listidentificationdocs'])){
    $result = $identificationdocs->listidentificationdocs();
    echo $result;
}

if(isset($_POST['deleteidentificationdocs'])){
    $documentid = $_POST['documentid'];
    $result = $identificationdocs->deleteidentificationdocs($documentid);
    echo json_encode($result);
}
?>