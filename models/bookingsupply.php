<?php
require_once("db.php");


class bookingsupply extends db {
    function checkbookingsupply($bookingclassid){
        $sql="CALL `sp_checkbookingsupply`({$bookingclassid})";
        return $this->getData($sql)->rowCount();
    }

    function insertbookingsupply($flightid, $bookingclassid, $numberseats, $price, $currency){
        if($this->checkbookingsupply($bookingclassid) > 0){
            return ["status"=>"exists","message"=>"Booking supply already exists"];
        }else{
            $sql="CALL `sp_savebookingsupply`({$flightid}, {$bookingclassid}, {$numberseats}, {$price}, '{$currency}')";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Booking supply inserted successfully"];
        }
    }

    function getbookingsupply(){
        $sql="CALL `sp_getbookingsupply` ()";
        return $this->getJSON($sql);
    }

    function listbookingsupply(){
        $sql="CALL sp_listbookingsupply()";
        return $this->getJSON($sql);
    }

    function deletebookingsupply($bookingsupplyid){
        try {
            $sql="CALL `sp_deletebookingsupply`({$bookingsupplyid})";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Booking supply was deleted successfully"];
        } catch (Exception $e) {
            return ["status"=>"error","message"=>"Failed to delete booking supply"];
        }
    }
}
?>