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
        $username = mysqli_real_escape_string($conn, $datas->username);
        $password = mysqli_real_escape_string($conn, $datas->password);
        $email = mysqli_real_escape_string($conn, $datas->email);
        $mobile = mysqli_real_escape_string($conn, $datas->mobile);
        $role = mysqli_real_escape_string($conn, $datas->role);

        $date = date('Y-m-d');
        if (  !empty($username) && !empty($password) && !empty($email) && !empty($mobile) && !empty($role) ){
            $query = mysqli_query($conn, "SELECT * FROM `users` WHERE email='$email' OR mobile='$mobile'") or die(mysqli_error($conn));			
            if( mysqli_num_rows($query) == 0 ){
                $insert = mysqli_query($conn, "INSERT INTO `users` 
                (`username`,`password`,`email`,`mobile`,`role`,`status`) VALUES('$username', '$password', '$email', '$mobile', '$role', '1')") or die(mysqli_error($conn));
                $lastinsertid = mysqli_insert_id($conn);
                $_SESSION['SESS_DIT_UID'] = $lastinsertid;			
                $_SESSION['SESS_DIT_UNAME'] = $username;			
                        
                $response = array();
                header("Content-Type: JSON");
                $response["status"] = true;
                $response["id"] = $lastinsertid;
                $response["name"] = $username;
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
            $response["msg"] = "All fields are mandatory";
            echo json_encode($response, JSON_PRETTY_PRINT);
        }
    }

?>