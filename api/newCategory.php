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
        $category = mysqli_real_escape_string($conn, $datas->category);

        $date = date('Y-m-d');
        if (  !empty($category)  ){
            $query = mysqli_query($conn, "SELECT * FROM `categories` WHERE category='$category'") or die(mysqli_error($conn));			
            if( mysqli_num_rows($query) == 0 ){
                $insert = mysqli_query($conn, "INSERT INTO `categories` 
                (`category`,`status`) VALUES('$category', '1')") or die(mysqli_error($conn));
                $lastinsertid = mysqli_insert_id($conn);
                        
                $response = array();
                header("Content-Type: JSON");
                $response["status"] = true;
                $response["id"] = $lastinsertid;
                $response["name"] = $category;
                $response["msg"] = "Success";
                echo json_encode($response, JSON_PRETTY_PRINT);
            }else{
                $response = array();
                header("Content-Type: JSON");
                $response["status"] = false;				
                $response["msg"] = "Category already taken";
                echo json_encode($response, JSON_PRETTY_PRINT);
            }			
        }else{
            $response = array();
            header("Content-Type: JSON");
            $response["status"] = false;				
            $response["msg"] = "Category is mandatory";
            echo json_encode($response, JSON_PRETTY_PRINT);
        }
    }

?>