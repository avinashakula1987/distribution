<?php
    $ds          = DIRECTORY_SEPARATOR;  //1
    
    $storeFolder = 'uploads';   //2
    if (!empty($_FILES)) {
        
        $tempFile = $_FILES['file']['tmp_name'];          //3             
        $filename = $_FILES['file']['name'];          //3             
        $explode = explode('.', $filename);
        $fname = $explode[0];
        $ename = end($explode);
        
        $targetPath = dirname( __FILE__ ) . $ds. $storeFolder . $ds;  //4

        
        for( $i=1; $i<=10; $i++ ){
            if( !file_exists($targetPath. $fname."_receipt_".$i.".jpg") ){
                $targetFile =  $targetPath. $fname."_receipt_".$i.".jpg";  //5
                break;
            }
        }
        
        
        
    
        move_uploaded_file($tempFile,$targetFile); //6
        
    }
?>   