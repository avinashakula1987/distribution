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
        $payment = mysqli_real_escape_string($conn, $datas->payment);
        $modeOfPayment = mysqli_real_escape_string($conn, $datas->modeOfPayment);
        $toBePaid = mysqli_real_escape_string($conn, $datas->toBePaid);
        $customerId = mysqli_real_escape_string($conn, $datas->customerId);
        $walletAmount = mysqli_real_escape_string($conn, $datas->walletAmount);
        $walletAmount2 = mysqli_real_escape_string($conn, $datas->walletAmount2);

        if( $modeOfPayment == "Wallet" ){     
            $query = mysqli_query($conn, "UPDATE `customers` SET `wallet`='$walletAmount2' WHERE id='$customerId'") or die(mysqli_error($conn));	
            if($query){
                $date = date('Y-m-d');      
                if (  !empty($table) && !empty($id) && !empty($payment) && !empty($modeOfPayment) ){
                    $getquery = mysqli_query($conn, "SELECT * FROM `$table` WHERE id='$id'") or die(mysqli_error($conn));			
                    if( $getquery ){
                        $fetch = mysqli_fetch_object($getquery);
                        $paid = $fetch->paid;
                        if( empty($paid) ){
                            $parent_array = array(); 
                            $parent_array[0]["date"] = $date;
                            $parent_array[0]["payment"] = $payment;
                            $parent_array[0]["modeOfPayment"] = $modeOfPayment;
                            $d = json_encode($parent_array);
                            $query = mysqli_query($conn, "UPDATE `$table` SET paid='$d' WHERE id='$id'") or die(mysqli_error($conn));			
                            if( $query ){
                                $response = array();
                                header("Content-Type: JSON");
                                $response["status"] = true;
                                $response["msg"] = "Payment received";
                                echo json_encode($response, JSON_PRETTY_PRINT);
                            }else{
                                $response = array();
                                header("Content-Type: JSON");
                                $response["status"] = false;				
                                $response["msg"] = "Something went wrong";
                                echo json_encode($response, JSON_PRETTY_PRINT);
                            }	
                        }else{
                            $parent_array = json_decode($paid); 
                            $count = count($parent_array);
                            $parent_array[$count]["date"] = $date;
                            $parent_array[$count]["payment"] = $payment;
                            $parent_array[$count]["modeOfPayment"] = $modeOfPayment;

                            $d = json_encode($parent_array);
                            $query = mysqli_query($conn, "UPDATE `$table` SET paid='$d' WHERE id='$id'") or die(mysqli_error($conn));			
                            if( $query ){
                                $response = array();
                                header("Content-Type: JSON");
                                $response["status"] = true;
                                $response["msg"] = "Payment successfully updated";
                                echo json_encode($response, JSON_PRETTY_PRINT);
                            }
                        }
                    }
                        
                }else{
                    $response = array();
                    header("Content-Type: JSON");
                    $response["status"] = false;				
                    $response["msg"] = "Wrong data received";
                    echo json_encode($response, JSON_PRETTY_PRINT);
                }
            }
        }else if( $toBePaid != 0 ){
            $wallet = $payment - $toBePaid;
            $query = mysqli_query($conn, "UPDATE `customers` SET `wallet`=`wallet`+$wallet WHERE id='$customerId'") or die(mysqli_error($conn));	
            if($query){
                $date = date('Y-m-d');      
                if (  !empty($table) && !empty($id) && !empty($payment) && !empty($modeOfPayment) ){
                    $getquery = mysqli_query($conn, "SELECT * FROM `$table` WHERE id='$id'") or die(mysqli_error($conn));			
                    if( $getquery ){
                        $fetch = mysqli_fetch_object($getquery);
                        $paid = $fetch->paid;
                        if( empty($paid) ){
                            $parent_array = array(); 
                            $parent_array[0]["date"] = $date;
                            $parent_array[0]["payment"] = $toBePaid;
                            $parent_array[0]["modeOfPayment"] = $modeOfPayment;
                            $d = json_encode($parent_array);
                            $query = mysqli_query($conn, "UPDATE `$table` SET paid='$d' WHERE id='$id'") or die(mysqli_error($conn));			
                            if( $query ){
                                $response = array();
                                header("Content-Type: JSON");
                                $response["status"] = true;
                                $response["msg"] = "Payment received";
                                echo json_encode($response, JSON_PRETTY_PRINT);
                            }else{
                                $response = array();
                                header("Content-Type: JSON");
                                $response["status"] = false;				
                                $response["msg"] = "Something went wrong";
                                echo json_encode($response, JSON_PRETTY_PRINT);
                            }	
                        }else{
                            $parent_array = json_decode($paid); 
                            $count = count($parent_array);
                            $parent_array[$count]["date"] = $date;
                            $parent_array[$count]["payment"] = $payment;
                            $parent_array[$count]["modeOfPayment"] = $modeOfPayment;

                            $d = json_encode($parent_array);
                            $query = mysqli_query($conn, "UPDATE `$table` SET paid='$d' WHERE id='$id'") or die(mysqli_error($conn));			
                            if( $query ){
                                $response = array();
                                header("Content-Type: JSON");
                                $response["status"] = true;
                                $response["msg"] = "Payment successfully updated";
                                echo json_encode($response, JSON_PRETTY_PRINT);
                            }
                        }
                    }
                        
                }else{
                    $response = array();
                    header("Content-Type: JSON");
                    $response["status"] = false;				
                    $response["msg"] = "Wrong data received";
                    echo json_encode($response, JSON_PRETTY_PRINT);
                }
            }
        }else{

            $date = date('Y-m-d');      
            if (  !empty($table) && !empty($id) && !empty($payment) && !empty($modeOfPayment) ){
                $getquery = mysqli_query($conn, "SELECT * FROM `$table` WHERE id='$id'") or die(mysqli_error($conn));			
                if( $getquery ){
                    $fetch = mysqli_fetch_object($getquery);
                    $paid = $fetch->paid;
                    if( empty($paid) ){
                        $parent_array = array(); 
                        $parent_array[0]["date"] = $date;
                        $parent_array[0]["payment"] = $payment;
                        $parent_array[0]["modeOfPayment"] = $modeOfPayment;
                        $d = json_encode($parent_array);
                        $query = mysqli_query($conn, "UPDATE `$table` SET paid='$d' WHERE id='$id'") or die(mysqli_error($conn));			
                        if( $query ){
                            $response = array();
                            header("Content-Type: JSON");
                            $response["status"] = true;
                            $response["msg"] = "Payment received";
                            echo json_encode($response, JSON_PRETTY_PRINT);
                        }else{
                            $response = array();
                            header("Content-Type: JSON");
                            $response["status"] = false;				
                            $response["msg"] = "Something went wrong";
                            echo json_encode($response, JSON_PRETTY_PRINT);
                        }	
                    }else{
                        $parent_array = json_decode($paid); 
                        $count = count($parent_array);
                        $parent_array[$count]["date"] = $date;
                        $parent_array[$count]["payment"] = $payment;
                        $parent_array[$count]["modeOfPayment"] = $modeOfPayment;

                        $d = json_encode($parent_array);
                        $query = mysqli_query($conn, "UPDATE `$table` SET paid='$d' WHERE id='$id'") or die(mysqli_error($conn));			
                        if( $query ){
                            $response = array();
                            header("Content-Type: JSON");
                            $response["status"] = true;
                            $response["msg"] = "Payment successfully updated";
                            echo json_encode($response, JSON_PRETTY_PRINT);
                        }
                    }
                }
                    
            }else{
                $response = array();
                header("Content-Type: JSON");
                $response["status"] = false;				
                $response["msg"] = "Wrong data received";
                echo json_encode($response, JSON_PRETTY_PRINT);
            }
        }
    }

?>