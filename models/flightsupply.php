<?php
require_once("db.php");


class flightsupply extends db {
    function checkflightsupply($flightid, $airlineid){
        $sql="CALL `sp_checkflightsupply`({$flightid}, {$airlineid})";
        return $this->getData($sql)->rowCount();
    }

    function insertflightsupply($flightid, $airlineid){
        if($this->checkflightsupply($flightid, $airlineid) > 0){
            return ["status"=>"exists","message"=>"Flight supply already exists"];
        }else{
            $sql="CALL `sp_saveflightsupply`({$flightid}, {$airlineid})";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Flight supply inserted successfully"];
        }
    }

    function getflightsupply(){
        $sql="CALL `sp_getflightsupply` ()";
        return $this->getJSON($sql);
    }

    function listflightsupply(){
        $sql="CALL sp_listflightsupply()";
        return $this->getJSON($sql);
    }

    function deleteflightsupply($flightsupplyid){
        try {
            $sql="CALL `sp_deleteflightsupply`({$flightsupplyid})";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Flight supply was deleted successfully"];
        } catch (Exception $e) {
            return ["status"=>"error","message"=>"Failed to delete flight supply"];
        }
    }
}
?>