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
        $id = mysqli_real_escape_string($conn, $datas->id);
        $q = "SELECT id, product FROM `orders` WHERE id='$id'";
            $query = mysqli_query($conn, $q) or die(mysqli_error($conn));			
            if( mysqli_num_rows($query) == 1 ){
                $response = array();
                header("Content-Type: JSON");
                while( $result = mysqli_fetch_object($query) ){
                    $product = unserialize($result->product);
                    $id = $result->id;                   

                    $row = array();
                    $row['product'] = $product;
                    $row['id'] = $id;                   
                    
                    $response[] = $row;
                    // $response["status"] = true;
                    // $response["username"] = $result['username'];
                    // $response["password"] = $result['password'];
                    // $response["email"] = $result['email'];
                    // $response["mobile"] = $result['mobile'];
                    // $response["role"] = $result['role'];
                    // $response["accountstatus"] = $result['status'];
                    // $response["msg"] = "Success";
                }
                echo json_encode($response, JSON_PRETTY_PRINT);
            }else{
                $response = array();
                header("Content-Type: JSON");
                $response["status"] = false;				
                $response["msg"] = "No Order available";
                echo json_encode($response, JSON_PRETTY_PRINT);
            }			
        
    }

?>