<?php
require_once("db.php");

class country extends db {

    // Check if country exists
    function checkcountry($p_countryname){
        $sql = "CALL sp_checkcountry('{$p_countryname}')";
        $rst = $this->getData($sql);
        return $rst->rowCount();
    }

    // Insert new country
    function insertcountry($countryname){
        if($this->checkcountry($countryname) > 0){
            return ["status"=>"exists","message"=>"Country name already exists"];
        } else {
            $sql = "CALL sp_savecountry('{$countryname}')";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Country inserted successfully"];
        }
    }

    // Get all countries as JSON
    function getcountry(){
        $sql = "CALL sp_getcountry()";
        return $this->getJSON($sql);
    }

    function listcountry(){
        $sql = "CALL sp_listcountry()";
        return $this->getJSON($sql);
    }

    function deletecountry($id){
        $sql = "CALL sp_deletecountry({$id})";
        $this->getData($sql);
        return ["status"=>"success","message"=>"Country deleted successfully"];
    }
}
?>
