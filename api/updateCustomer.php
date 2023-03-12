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
        $editId = mysqli_real_escape_string($conn, $datas->editId);
        $name = mysqli_real_escape_string($conn, $datas->name);
        $email = mysqli_real_escape_string($conn, $datas->email);
        $mobile = mysqli_real_escape_string($conn, $datas->mobile);
        $role = mysqli_real_escape_string($conn, $datas->role);
        $location = mysqli_real_escape_string($conn, $datas->location);
        $pincode = mysqli_real_escape_string($conn, $datas->pincode);
        $address = mysqli_real_escape_string($conn, $datas->address);
        $gst = mysqli_real_escape_string($conn, $datas->gst);
        $state = mysqli_real_escape_string($conn, $datas->states);
        $maplocation = mysqli_real_escape_string($conn, $datas->maplocation);

        $date = date('Y-m-d');
        if (  !empty($name) && !empty($location) && !empty($email) && !empty($mobile) && !empty($role) ){
            $query = mysqli_query($conn, "SELECT * FROM `customers` WHERE id='$editId'") or die(mysqli_error($conn));			
            if( mysqli_num_rows($query) == 1 ){
                $insert = mysqli_query($conn, "UPDATE `customers` 
                SET `name`='$name', 
                `location`='$location', 
                `email`='$email',
                `mobile`='$mobile',
                `role`='$role',
                `pincode`='$pincode',
                `address`='$address', 
                `state`='$state',
                `gst`='$gst', 
                `maplocation`='$maplocation' WHERE id='$editId' ") or die(mysqli_error($conn));
                			
                        
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