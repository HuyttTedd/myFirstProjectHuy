<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xóa sản phẩm</title>
</head>
<body>
<?php
        if(!isset($_SESSION["admin_info"]["admin_phone"])) {
            header('location:http://localhost/baitapthunhat/manage/index.php');
        }
        include("headerAdmin.php");
?>

<?php
    include("connect2.php");
    $confirm = "";
    $product_id = "";

    if(isset($_REQUEST["product_id"])) {
        $product_id = $_REQUEST["product_id"];
        include("connect2.php");
        $sql = "UPDATE products set status = 4 where id_product = '$product_id'";
        $res = mysqli_query($conn, $sql);
        if($res) {
            header('location:http://localhost/baitapthunhat/manage/listProduct.php');
        } else {
            echo "Có lỗi xảy ra!";
        }
    }

    if(isset($_REQUEST["product_id2"])) {
        $product_id = $_REQUEST["product_id2"];
        include("connect2.php");
        $sql = "UPDATE products set status = 0 where id_product = '$product_id'";
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