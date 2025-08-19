<?php
require_once("db.php");

class city extends db{

    function checkcity($p_cityname){
        $sql="CALL `sp_checkcity`('{$p_cityname}')";
        return $this->getData($sql)->rowCount();
    }

    function insertcity($cityname, $countryid){
    if($this->checkcity($cityname) > 0){
        return ["status"=>"exists","message"=>"city name already exists"];
    }else{
        $sql="CALL `sp_insertcity`('{$cityname}', {$countryid})";
        $this->getData($sql);
        return ["status"=>"success","message"=>"city inserted successfully"];
    }
    }
    

    function getcity() {
        $sql = "CALL sp_getcity()";
        return $this->getJSON($sql);
    }

    function listcity() {
        $sql = "CALL sp_listcities()";
        return $this->getJSON($sql);
    }

    function deletecity($id) {
        $sql = "CALL sp_deletecity($id)";
        $this->getData($sql);
        return array("status" => "success", "message" => "City deleted successfully");
    }
}
