<?php
require_once("db.php");

class country extends db{
    function checkcountry($p_countryname){
        $sql="CALL `sp_checkcountry`('{$p_countryname}')";
        return $this->getData($sql)->rowCount();

    }

    function insertcountry($countryname){
        if($this->checkcountry($countryname) > 0){
            return ["status"=>"exists","message"=>"country name already exists"];
        }else{
            $sql="CALL `sp_savecountry`('{$countryname}')";
            $this->getData($sql);
            return ["status"=>"success","message"=>"country inserted successfully"];
        }
    }

    function getcountry(){
        $sql="CALL `sp_getcountry` ()";
        return $this->getJSON($sql);
    }

    function listcountry(){
        $sql="CALL sp_listcountry()";
        return $this->getJSON($sql);
    }

    function deletecountry($p_id){
        try {
            $sql="CALL `sp_deletecountry`({$p_id})";
            $this->getData($sql);
            return ["status"=>"success","message"=>"country was deleted successfully"];
        } catch (Exception $e) {
            return ["status"=>"error","message"=>"Failed to delete country"];
        }
    }
}
?>