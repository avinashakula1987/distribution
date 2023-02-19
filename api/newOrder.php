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
        
        $customer = $datas[0];
        $modeofpayment = $datas[1];
        $products = serialize($datas[2]);
        $customerState = $datas[3];
        
        if( isset($datas[4]) != "avinash" ){
            $editId = $datas[4];
            $query1 = mysqli_query($conn, "SELECT product FROM `orders` WHERE id='$editId'") or die(mysqli_error($conn));			
            if( mysqli_num_rows($query1) == 1 ){
                $response = array();
                $result = mysqli_fetch_object($query1);
                $oldProduct = unserialize($result->product);               
                $data = array_merge($oldProduct, $datas[2]);
                $products = serialize($data);
                $updateProducts = mysqli_query($conn, "UPDATE `orders` SET product='$products' WHERE id='$editId'") or die(mysqli_error($conn));			
                if( $updateProducts ){
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
            }    
        }else{
        

       
        $date = date('Y-m-d');
        // if (  !empty($customer) && !empty($products) ){
            $insert = mysqli_query($conn, "INSERT INTO `orders` (`customer`,`product`,`modeofpayment`,`customerState`,`orderedOn`) VALUES('$customer', '$products', '$modeofpayment', '$customerState', '$date')") or die(mysqli_error($conn));
            $lastinsertid = mysqli_insert_id($conn);	
                    
            $response = array();
            header("Content-Type: JSON");
            $response["status"] = true;
            $response["msg"] = "Success";
            echo json_encode($response, JSON_PRETTY_PRINT);
           	
        // }else{
        //     $response = array();
        //     header("Content-Type: JSON");
        //     $response["status"] = false;				
        //     $response["msg"] = "All fields are mandatory";
        //     echo json_encode($response, JSON_PRETTY_PRINT);
        // }
        }
    }

?>