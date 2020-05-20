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
<div>
        <a style="text-decoration: none; color: red" href="admin.php">Trở về trang chủ</a>
    </div>
    <div>
        <a style="text-decoration: none; color: red" href="listProduct.php">Danh sách sản phẩm</a>
    </div>
<?php
        if(!isset($_SESSION["admin_info"]["admin_phone"])) {
            header('location:http://localhost/baitapthunhat/manage/index.php');
        }

        //request
        if(isset($_REQUEST["type_id"])) {
            $product_type_id = $_REQUEST["type_id"];
            include("connect2.php");
            $sql = "DELETE from product_type where type_id = '$product_type_id'";
            $res = mysqli_query($conn, $sql);
            if($res) {
                header('location:http://localhost/baitapthunhat/manage/listProduct.php');
            } else {
                echo "Chú ý: Loại sản phẩm muốn xóa phải không có sản phẩm nào!";
            }
        }
?>
</body>
</html>