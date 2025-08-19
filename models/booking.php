<?php
class booking extends db {
require_once("db.php");

    function checkbooking($flightid, $bookingdate){
        $sql="CALL `sp_checkbooking`({$flightid}, '{$bookingdate}')";
        return $this->getData($sql)->rowCount();
    }

    function insertbooking($bookingtypeid, $currencyid, $flightid, $bookingdate, $paymentmethod){
        if($this->checkbooking($flightid, $bookingdate) > 0){
            return ["status"=>"exists","message"=>"Booking already exists"];
        }else{
            $sql="CALL `sp_savebooking`({$bookingtypeid}, {$currencyid}, {$flightid}, '{$bookingdate}', '{$paymentmethod}')";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Booking inserted successfully"];
        }
    }

    function getbooking(){
        $sql="CALL `sp_getbooking` ()";
        return $this->getJSON($sql);
    }

    function listbooking(){
        $sql="CALL sp_listbooking()";
        return $this->getJSON($sql);
    }

    function deletebooking($bookingid){
        try {
            $sql="CALL `sp_deletebooking`({$bookingid})";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Booking was deleted successfully"];
        } catch (Exception $e) {
            return ["status"=>"error","message"=>"Failed to delete booking"];
        }
    }
}
?>