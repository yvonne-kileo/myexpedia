<?php
session_start();
$sql = "";

class db {
    private $servername;
    private $databasename;
    private $username;
    private $password;
    private $charset;

    function connect() {
        $this->servername = "localhost";
        $this->databasename = "expediaflightbookings";
        $this->username = "root";
        $this->password = "";
        $this->charset = "utf8mb4";
        try {
            $dsm = "mysql:host=" . $this->servername . ";dbname=" . $this->databasename . ";charset=" . $this->charset;
            $pdo = new PDO($dsm, $this->username, $this->password);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $pdo;
        } catch (PDOException $e) {
            throw new Exception("Connection failed: " . $e->getMessage());
        }
    }

    function getData($sql) {
        try {
            return $this->connect()->query($sql);
        } catch (PDOException $e) {
            throw new Exception("Database query failed: " . $e->getMessage());
        }
    }

    function getJSON($sql) {
        try {
            $rst = $this->getData($sql);
            return json_encode($rst->fetchAll(PDO::FETCH_ASSOC));
        } catch (Exception $e) {
            throw new Exception("Failed to retrieve data: " . $e->getMessage());
        }
    }
}
?>