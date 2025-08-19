<?php
require_once("db.php");

class airline extends db {

    function checkairline($airlinename){
    $sql="CALL `sp_checkairline`('{$airlinename}')";
    return $this->getData($sql)->rowCount();
    }


    function insertairline($airlinename) {
        if($this->checkairline($airlinename) > 0){
        return ["status"=>"exists","message"=>"airline name already exists"];
    }else{
        $sql = "CALL sp_insert_airline('$airlinename')";
        $this->getData($sql);
        return array("status" => "success", "message" => "Airline inserted successfully");
    }
    }

    function getairline($id) {
        $sql = "CALL sp_get_airline($id)";
        return $this->getJSON($sql);
    }

    function listairline() {
        $sql = "CALL sp_list_airlines()";
        return $this->getJSON($sql);
    }

    function deleteairline($id) {
        $sql = "CALL sp_delete_airline($id)";
        $this->getData($sql);
        return array("status" => "success", "message" => "Airline deleted successfully");
    }

    function updateairline($id, $airlinename) {
        $sql = "CALL sp_update_airline($id, '$airlinename')";
        $this->getData($sql);
        return array("status" => "success", "message" => "Airline updated successfully");
    }
}
?>