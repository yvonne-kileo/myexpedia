<?php
require_once("db.php");
class passengermanifest extends db {
    function insertpassengermanifest($bookingid, $bookingclassid, $price, $currencyid, $identificationdocid, $passengername, $dob, $genderid){
        $sql="CALL `sp_insertpassengermanifest`({$bookingid}, {$bookingclassid}, {$price}, {$currencyid}, {$identificationdocid}, '{$passengername}', '{$dob}', {$genderid})";
        $this->getData($sql);
        return ["status"=>"success","message"=>"Passenger manifest inserted successfully"];
    }

    function getpassengermanifest(){
        $sql="CALL `sp_getpassengermanifest` ()";
        return $this->getJSON($sql);
    }

    function listpassengermanifest(){
        $sql="CALL sp_listpassengermanifest()";
        return $this->getJSON($sql);
    }

    function deletepassengermanifest($passengermanifestid){
        try {
            $sql="CALL `sp_deletepassengermanifest`({$passengermanifestid})";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Passenger manifest was deleted successfully"];
        } catch (Exception $e) {
            return ["status"=>"error","message"=>"Failed to delete passenger manifest"];
        }
    }
}
?>