<?php


//    $host = "localhost";
//    $username = "root";
//    $password = "";
//    $database = "distribution";

   $host = "localhost";
   $username = "distributionuser";
   $password = "7ge,q.khME$]";
   $database = "distribution";

   $conn = db_connection();

   function db_connection(){
       static $conn;        
       if( $conn == NULL ){
           $conn = mysqli_connect($GLOBALS['host'], $GLOBALS['username'], $GLOBALS['password'], $GLOBALS['database']);        
       }
       return $conn;
   }
?>