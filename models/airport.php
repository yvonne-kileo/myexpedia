<?php
require_once("db.php");

class airport extends db{
    function checkairport($airportname){
        $sql="CALL `sp_checkairport`('{$airportname}')";
        return $this->getData($sql)->rowCount();
    }

    function insertairport($airportname, $cityid){
        if($this->checkairport($airportname) > 0){
            return ["status"=>"exists","message"=>"airport name already exists"];
        }else{
            $sql="CALL `sp_saveairport`('{$airportname}', {$cityid})";
            $this->getData($sql);
            return ["status"=>"success","message"=>"airport inserted successfully"];
        }
    }

    function getairport(){
        $sql="CALL `sp_getairport` ()";
        return $this->getJSON($sql);
    }

    function listairport(){
        $sql="CALL sp_listairport()";
        return $this->getJSON($sql);
    }

    function deleteairport($airportid){
        try {
            $sql="CALL `sp_deleteairport`({$airportid})";
            $this->getData($sql);
            return ["status"=>"success","message"=>"airport was deleted successfully"];
        } catch (Exception $e) {
            return ["status"=>"error","message"=>"Failed to delete airport"];
        }
    }
}
?>