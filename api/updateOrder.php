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
        $id = $datas[0];
        $data = serialize($datas[2]);
        


        $date = date('Y-m-d');
        if (  !empty($data) && !empty($id)  ){
            $query = mysqli_query($conn, "UPDATE `orders` SET product='$data' WHERE id='$id'") or die(mysqli_error($conn));			
            if( $query ){
                $response = array();
                header("Content-Type: JSON");
                $response["status"] = true;
                $response["msg"] = "Order Updated";
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