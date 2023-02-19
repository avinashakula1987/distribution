<?php

    include("./config/Database.php");
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST');
    header("Access-Control-Allow-Headers: X-Requested-With");

    // header("Access-Control-Allow-Origin: *");
    // header("Content-Type: application/json; charset=UTF-8");
    // header("Access-Control-Allow-Methods: POST");
    // header("Access-Control-Max-Age: 3600");
    // header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

    if( $conn ){
        $json = file_get_contents('php://input');
        $datas = json_decode($json);
        $name = mysqli_real_escape_string($conn, $datas->name);
        $description = mysqli_real_escape_string($conn, $datas->description);

        $date = date('Y-m-d');
        if (  !empty($name) && !empty($description) ){
            $query = mysqli_query($conn, "SELECT * FROM `transport` WHERE name='$name'") or die(mysqli_error($conn));			
            if( mysqli_num_rows($query) == 0 ){
                $insert = mysqli_query($conn, "INSERT INTO `transport` 
                (`name`,`description`) VALUES('$name', '$description')") or die(mysqli_error($conn));                        
                $response = array();
                header("Content-Type: JSON");
                $response["status"] = true;          
                $response["msg"] = "Success";
                echo json_encode($response, JSON_PRETTY_PRINT);
            }else{
                $response = array();
                header("Content-Type: JSON");
                $response["status"] = false;				
                $response["msg"] = "Email Id or Mobile No. already taken";
                echo json_encode($response, JSON_PRETTY_PRINT);
            }			
        }else{
            $response = array();
            header("Content-Type: JSON");
            $response["status"] = false;				
            $response["msg"] = "* fields are mandatory";
            echo json_encode($response, JSON_PRETTY_PRINT);
        }
    }

?>