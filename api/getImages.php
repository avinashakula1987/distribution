<?php

    include("./config/Database.php");
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST');
    header("Access-Control-Allow-Headers: X-Requested-With");

    $response = array();
    header("Content-Type: JSON");

    $json = file_get_contents('php://input');
    $datas = json_decode($json);       
    $id = $datas->id;
    $storeFolder = "../uploads/$id/";

    $images = glob($storeFolder . '*.jpg', GLOB_BRACE);
    foreach( $images as $image ){
        $row = array();
        $row['image'] = explode("../", $image)[1];       
        $response[] = $row;
    }
    // echo print_r($images);
    // echo $storeFolder;
    echo json_encode($response, JSON_PRETTY_PRINT);
?>