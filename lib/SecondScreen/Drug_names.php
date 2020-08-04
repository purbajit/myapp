<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "DrugDB";
    $table = "Drug";

    $action = $_POST['action'];

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    if('CREATE_TABLE' == $action){
        $sql = "CREATE TABLE IF NOT EXISTS $table (
            id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            drug_name VARCHAR(50) NOT NULL,
            Programme_name VARCHAR(10) NOT NULL,
            Batch_no VARCHAR(20) NOT NULL,
            ExpiryDate VARCHAR(30) NOT NULL,
            ManufactureDate VARCHAR(30) NOT NULL,
            AvailableQnty VARCHAR(20) NOT NULL

            )";
        if ($conn->query($sql) === TRUE) {
            echo "success";
        } else {
            echo "error";
        }
        $conn->close();
        return;
    }

    if('GET_ALL' == $action){
        $dbdata = array();
        $sql = "SELECT id, drug_name,Programme_name,Batch_no,ExpiryDate,ManufacturingDate,Available Qnty FROM $table ORDER BY id DESC";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $dbdata[]=$row;
            }
            echo json_encode($dbdata);
        } else {
            echo "error";
        }
        $conn->close();
        return;
    }

    if('ADD_DRUG' == $action){
        $drug_name = $_POST['drug_name'];
        $Programme_name = $_POST['Programme_name'];
        $Batch_no = $_POST['Batch_no'];
        $ExpiryDate = $_POST['ExpiryDate'];
        $ManufactureDate = $_POST['ManufactureDate'];
        $AvailableQnty = $_POST['AvailableQnty'];
        
        $sql = "INSERT INTO $table (drug_name,Programme_name,Batch_no,ExpiryDate,ManufactureDate,AvailableQnty) VALUES('$drug_name''$Programme_name''$Batch_no''$ExpiryDate''$ManufactureDate''$AvailableQnty')";
        $result = $conn->query($sql);
        echo 'success';
        return;
    }

    if('UPDATE_DRUG' == $action){
        $drug_id = $_POST['drug_id'];
        $drug_name = $_POST['drug_name'];
        $Programme_name = $_POST['Programme_name'];
        $Batch_no = $_POST['Batch_no'];
        $ExpiryDate = $_POST['ExpiryDate'];
        $ManufactureDate = $_POST['ManufactureDate'];
        $AvailableQnty = $_POST['AvailableQnty'];

        $sql = "UPDATE $table SET drug_name = '$drug_name',Programme_name = '$Programme_name',Batch_no = '$Batch_no',ExpiryDate = '$ExpiryDate',ManufactureDate = '$ManufactureDate',AvailableQnty = '$AvailableQnty' WHERE id = $drug_id";
        if ($conn->query($sql) === TRUE) {
            echo "success";
        } else {
            echo "error";
        }
        $conn->close();
        return;
    }

    if('DELETE_DRUG' == $action){
        $drug_id = $_POST['drug_id'];
        $sql = "DELETE FROM $table WHERE id = $drug_id";
        if ($conn->query($sql) === TRUE) {
            echo "success";
        } else {
            echo "error";
        }
        $conn->close();
        return;
    }
    
?>
