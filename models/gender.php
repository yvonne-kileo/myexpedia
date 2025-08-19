<?php
require_once("db.php");

class gender extends db {
    function insertgender($gendername){
        $sql="CALL `sp_savegender`('{$gendername}')";
        $this->getData($sql);
        return ["status"=>"success","message"=>"Gender inserted successfully"];
    }

    function getgender(){
        $sql="CALL `sp_getgender` ()";
        return $this->getJSON($sql);
    }

    function listgender(){
        $sql="CALL sp_listgender()";
        return $this->getJSON($sql);
    }

    function deletegender($genderid){
        try {
            $sql="CALL `sp_deletegender`({$genderid})";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Gender was deleted successfully"];
        } catch (Exception $e) {
            return ["status"=>"error","message"=>"Failed to delete gender"];
        }
    }
}
?>