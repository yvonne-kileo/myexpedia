<?php
require_once("db.php");

class paymentmethod extends db {
    function checkpaymentmethod($paymentname){
        $sql="CALL `sp_checkpaymentmethod`('{$paymentname}')";
        return $this->getData($sql)->rowCount();
    }

    function insertpaymentmethod($paymentname){
        if($this->checkpaymentmethod($paymentname) > 0){
            return ["status"=>"exists","message"=>"Payment method already exists"];
        }else{
            $sql="CALL `sp_savepaymentmethod`('{$paymentname}')";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Payment method inserted successfully"];
        }
    }

    function getpaymentmethod(){
        $sql="CALL `sp_getpaymentmethod` ()";
        return $this->getJSON($sql);
    }

    function listpaymentmethod(){
        $sql="CALL sp_listpaymentmethod()";
        return $this->getJSON($sql);
    }

    function deletepaymentmethod($paymentmethod){
        try {
            $sql="CALL `sp_deletepaymentmethod`({$paymentmethod})";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Payment method was deleted successfully"];
        } catch (Exception $e) {
            return ["status"=>"error","message"=>"Failed to delete payment method"];
        }
    }
}
?>