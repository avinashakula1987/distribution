<?php
    date_default_timezone_set('Asia/Kolkata');
    $ds          = DIRECTORY_SEPARATOR;  //1
    
    $storeFolder = 'uploads';   //2

    function makeDirectries($mainFolder, $filename){
        echo $mainFolder;
        $filename = "$mainFolder/" . $filename . "/";
        if (!file_exists($filename)) {    
            mkdir($filename, 0777, true); 
        }
        return true;
    }
    if (!empty($_FILES)) {
        
        $tempFile = $_FILES['file']['tmp_name'];          //3             
        $filename = $_FILES['file']['name'];          //3             
        $explode = explode('_', $filename);
        $fname = $explode[0];
        $ename = end($explode);
        if( makeDirectries($storeFolder, $fname) ){
            $targetPath = dirname( __FILE__ ) . $ds. $storeFolder . $ds . $fname . $ds;  //4
        }

        $date = date('d-m-Y-h-i-s');
        $targetFile =  $targetPath. $fname."_".$date.".jpg";  //5
        
        
        
    
        move_uploaded_file($tempFile,$targetFile); //6
        
    }
?>   