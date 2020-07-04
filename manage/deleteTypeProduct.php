<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xóa loại sản phẩm</title>
</head>
<body>

<?php
        if(!isset($_SESSION["admin_info"]["admin_phone"])) {
            header('location:http://localhost/baitapthunhat/manage/index.php');

        }
include("headerAdmin.php");
        //request
        if(isset($_REQUEST["type_id"])) {
            $product_type_id = $_REQUEST["type_id"];
            include("connect2.php");
            $sql = "UPDATE product_type set status = 4 where type_id = '$product_type_id'";
            $res = mysqli_query($conn, $sql);
            if($res) {
                header('location:http://localhost/baitapthunhat/manage/listProduct.php');
            } else {
                echo "Có lỗi xảy ra!";
            }
        }
        if(isset($_REQUEST["type_id2"])) {
            $product_type_id = $_REQUEST["type_id2"];
            include("connect2.php");
            $sql = "UPDATE product_type set status = 0 where type_id = '$product_type_id'";
            $res = mysqli_query($conn, $sql);
            if($res) {
                header('location:http://localhost/baitapthunhat/manage/listProduct.php');
            } else {
                echo "Có lỗi xảy ra!";
            }
        }
?>
</body>
</html>