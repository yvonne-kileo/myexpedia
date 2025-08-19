<?php
require_once("db.php");

class identificationdocs extends db {
    function insertidentificationdocs($documentname){
        $sql="CALL `sp_insertidentificationdocs`('{$documentname}')";
        $this->getData($sql);
        return ["status"=>"success","message"=>"Identification document inserted successfully"];
    }

    function getidentificationdocs(){
        $sql="CALL `sp_getidentificationdocs` ()";
        return $this->getJSON($sql);
    }

    function listidentificationdocs(){
        $sql="CALL sp_listidentificationdocs()";
        return $this->getJSON($sql);
    }

    function deleteidentificationdocs($documentid){
        try {
            $sql="CALL `sp_deleteidentificationdocs`({$documentid})";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Identification document was deleted successfully"];
        } catch (Exception $e) {
            return ["status"=>"error","message"=>"Failed to delete identification document"];
        }
    }
}
?>