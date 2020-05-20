<?php
    session_start();
    session_destroy();
    
    if(empty($_SESSION)) {
        header('location:http://localhost/baitapthunhat/manage/index.php');
    } else {
        header('location:http://localhost/baitapthunhat/manage/adminLogout.php');
    }
?>

