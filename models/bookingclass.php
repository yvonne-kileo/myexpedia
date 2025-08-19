<?php
require_once("db.php");


class bookingclass extends db {
    function checkbookingclass($typename){
        $sql="CALL `sp_checkbookingclass`('{$typename}')";
        return $this->getData($sql)->rowCount();
    }

    function insertbookingclass($typename){
        if($this->checkbookingclass($typename) > 0){
            return ["status"=>"exists","message"=>"booking class name already exists"];
        }else{
            $sql="CALL `sp_insertbookingclass`('{$typename}')";
            $this->getData($sql);
            return ["status"=>"success","message"=>"booking class inserted successfully"];
        }
    }

    function getbookingclass(){
        $sql="CALL `sp_getbookingclass` ()";
        return $this->getJSON($sql);
    }

    function listbookingclass(){
        $sql="CALL sp_listbookingclass()";
        return $this->getJSON($sql);
    }

    function deletebookingclass($bookingclassid){
        try {
            $sql="CALL `sp_deletebookingclass`({$bookingclassid})";
            $this->getData($sql);
            return ["status"=>"success","message"=>"booking class was deleted successfully"];
        } catch (Exception $e) {
            return ["status"=>"error","message"=>"Failed to delete booking class"];
        }
    }
}
?>