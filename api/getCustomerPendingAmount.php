<?php

    include("./config/Database.php");
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST');
    header("Access-Control-Allow-Headers: X-Requested-With");

    if( $conn ){
        $json = file_get_contents('php://input');    
        $datas = json_decode($json);   
        $id = mysqli_real_escape_string($conn, $datas->id);  
        $getquery = mysqli_query($conn, "SELECT * FROM `customers` WHERE id='$id'") or die(mysqli_error($conn));			
        $getallInvoices = mysqli_query($conn, "SELECT product FROM `orders` WHERE customer='$id'") or die(mysqli_error($conn));			
        if( $getquery ){
            $fetch = mysqli_fetch_object($getquery);
            $productsList = array();
            while( $fetch2 = mysqli_fetch_object($getallInvoices) ){
                $products = unserialize($fetch2->product);
                $productsList[] = $products;
            }
            $payments = $fetch->payments;
           
            if( empty($payments) ){               
                $response = array();
                header("Content-Type: JSON");
                $response["status"] = true;
                $response["msg"] = "Payment received";
                $response["paidSoFar"] = 0;
                $response["products"] = $productsList;
                echo json_encode($response, JSON_PRETTY_PRINT);                
            }else{
                $parent_array = json_decode($payments);      
                $response = array();
                header("Content-Type: JSON");
                $response["status"] = true;
                $response["msg"] = "Payment successfully updated";
                $response["paidSoFar"] = $parent_array;  
                $response["products"] = $productsList;              
                echo json_encode($response, JSON_PRETTY_PRINT);                
            }
        }
    }

?>