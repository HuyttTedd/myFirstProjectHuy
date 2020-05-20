<?php
 session_start();
?>
<?php
    $phone = $_REQUEST["phone"];
    include("connect2.php");
    $sql = "DELETE from admin where admin_phone_number = '$phone'";
    if(mysqli_query($conn, $sql)) {
        header('location:http://localhost/baitapthunhat/manage/superadmin.php');
    }
?>