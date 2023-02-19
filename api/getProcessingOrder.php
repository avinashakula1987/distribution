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
        $q = "SELECT orders.id, orders.paid, orders.product, orders.customer as customerId, customers.name as customer, customers.wallet as walletAmount, transport.name as transport, orders.orderedOn, orders.acceptedOn, orders.processedOn, orders.completedOn FROM `orders`, `customers`, `transport` WHERE orders.customer=customers.id AND orders.transport=transport.id AND orders.status='2' AND orders.id='$id'";
            $query = mysqli_query($conn, $q) or die(mysqli_error($conn));			
            if( mysqli_num_rows($query) > 0 ){
                $response = array();
                header("Content-Type: JSON");
                while( $result = mysqli_fetch_object($query) ){
                    $paid = json_decode($result->paid);
                    $product = unserialize($result->product);
                    $id = $result->id;
                    $customer = $result->customer;
                    $customerId = $result->customerId;
                    $transport = $result->transport;
                    $orderedOn = $result->orderedOn;
                    $acceptedOn = $result->acceptedOn;
                    $processedOn = $result->processedOn;
                    $completedOn = $result->completedOn;
                    $walletAmount = $result->walletAmount;

                    $row = array();
                    $row['product'] = $product;
                    $row['id'] = $id;
                    $row['customer'] = $customer;
                    $row['customerId'] = $customerId;
                    $row['transport'] = $transport;
                    $row['paid'] = $paid;
                    $row['orderedOn'] = $orderedOn;
                    $row['acceptedOn'] = $acceptedOn;
                    $row['processedOn'] = $processedOn;
                    $row['completedOn'] = $completedOn;
                    $row['walletAmount'] = $walletAmount;
                    
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