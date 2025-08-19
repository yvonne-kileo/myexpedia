<?php
require_once("db.php");

class currency extends db {
    function checkcurrency($currencycode){
        $sql="CALL `sp_checkcurrency`('{$currencycode}')";
        return $this->getData($sql)->rowCount();
    }

    function insertcurrency($currencycode, $currencyname){
        if($this->checkcurrency($currencycode) > 0){
            return ["status"=>"exists","message"=>"Currency already exists"];
        }else{
            $sql="CALL `sp_savecurrency`('{$currencycode}', '{$currencyname}')";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Currency inserted successfully"];
        }
    }

    function getcurrency(){
        $sql="CALL `sp_getcurrency` ()";
        return $this->getJSON($sql);
    }

    function listcurrency(){
        $sql="CALL sp_listcurrency()";
        return $this->getJSON($sql);
    }

    function deletecurrency($currencyid){
        try {
            $sql="CALL `sp_deletecurrency`({$currencyid})";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Currency was deleted successfully"];
        } catch (Exception $e) {
            return ["status"=>"error","message"=>"Failed to delete currency"];
        }
    }
}
?>