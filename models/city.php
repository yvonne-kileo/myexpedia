<?php
require_once("db.php");

class City extends db {

    // Check if city exists
    public function checkcity($cityname) {
        $sql = "CALL sp_checkcity('$cityname')";
        $rst = $this->getData($sql);
        return $rst->rowCount(); // returns number of rows
    }

    // Insert city
    public function insertcity($cityname, $countryid) {
        if ($this->checkcity($cityname) > 0) {
            return ["status" => "exists", "message" => "City name already exists"];
        } else {
            $sql = "CALL sp_insertcity('$cityname', $countryid)";
            $this->getData($sql);
            return ["status" => "success", "message" => "City inserted successfully"];
        }
    }

    // Get cities as JSON
    public function getcity() {
        $sql = "CALL sp_getcity()";
        return $this->getJSON($sql);
    }

    public function listcity() {
        $sql = "CALL sp_listcities()";
        return $this->getJSON($sql);
    }

    public function deletecity($id) {
        $sql = "CALL sp_deletecity($id)";
        $this->getData($sql);
        return ["status" => "success", "message" => "City deleted successfully"];
    }

    public function updatecity($id, $cityname, $countryid) {
        $sql = "CALL sp_updatecity($id, '$cityname', $countryid)";
        $this->getData($sql);
        return ["status" => "success", "message" => "City updated successfully"];
    }
}
?>
