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
        $table = mysqli_real_escape_string($conn, $datas->table);
        $id = mysqli_real_escape_string($conn, $datas->id);
        $transport = mysqli_real_escape_string($conn, $datas->transport);

        $date = date('Y-m-d');
        if (  !empty($table) && !empty($id)  ){
            $query = mysqli_query($conn, "UPDATE `$table` SET status='2', transport='$transport' WHERE id='$id'") or die(mysqli_error($conn));			
            if( $query ){
                $response = array();
                header("Content-Type: JSON");
                $response["status"] = true;
                $response["msg"] = "Order Accepted";
                echo json_encode($response, JSON_PRETTY_PRINT);
            }else{
                $response = array();
                header("Content-Type: JSON");
                $response["status"] = false;				
                $response["msg"] = "Something went wrong";
                echo json_encode($response, JSON_PRETTY_PRINT);
            }			
        }else{
            $response = array();
            header("Content-Type: JSON");
            $response["status"] = false;				
            $response["msg"] = "Wrong data received";
            echo json_encode($response, JSON_PRETTY_PRINT);
        }
    }

?>