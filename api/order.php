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
        $customer = mysqli_real_escape_string($conn, $datas->customer);
        $product = mysqli_real_escape_string($conn, $datas->product);
       
        $date = date('Y-m-d');
        if (  !empty($customer) && !empty($product) ){
            $insert = mysqli_query($conn, "INSERT INTO `orders` 
            (`customer`,`product`) VALUES('$customer', '$product')") or die(mysqli_error($conn));
            $lastinsertid = mysqli_insert_id($conn);	
                    
            $response = array();
            header("Content-Type: JSON");
            $response["status"] = true;
            $response["msg"] = "Success";
            echo json_encode($response, JSON_PRETTY_PRINT);
           	
        }else{
            $response = array();
            header("Content-Type: JSON");
            $response["status"] = false;				
            $response["msg"] = "All fields are mandatory";
            echo json_encode($response, JSON_PRETTY_PRINT);
        }
    }

?>