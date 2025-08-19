<?php
require_once("db.php");

class bookingtype extends db {
    function checkbookingtype($bookingtypename){
        $sql="CALL `sp_checkbookingtype`('{$bookingtypename}')";
        return $this->getData($sql)->rowCount();
    }

    function insertbookingtype($bookingtypename){
        if($this->checkbookingtype($bookingtypename) > 0){
            return ["status"=>"exists","message"=>"booking type name already exists"];
        }else{
            $sql="CALL `sp_savebookingtype`('{$bookingtypename}')";
            $this->getData($sql);
            return ["status"=>"success","message"=>"booking type inserted successfully"];
        }
    }

    function getbookingtype(){
        $sql="CALL `sp_getbookingtype` ()";
        return $this->getJSON($sql);
    }

    function listbookingtype(){
        $sql="CALL sp_listbookingtype()";
        return $this->getJSON($sql);
    }

    function deletebookingtype($bookingtypeid){
        try {
            $sql="CALL `sp_deletebookingtype`({$bookingtypeid})";
            $this->getData($sql);
            return ["status"=>"success","message"=>"booking type was deleted successfully"];
        } catch (Exception $e) {
            return ["status"=>"error","message"=>"Failed to delete booking type"];
        }
    }
}
?>