<?php
    if( isset($_POST['removeImg']) ){
        $img = $_POST['removeImg'];
        if( file_exists($img) ){
            unlink($img);
            echo "Deleted";
        }else{
            echo "Attachment not found";
        }
    }
    exit();
?>