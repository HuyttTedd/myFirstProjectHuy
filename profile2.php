<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="profile2.css">
    <link href="fontawesome/css/fontawesome.css" rel="stylesheet">
    <link href="fontawesome/css/brands.css" rel="stylesheet">
    <link href="fontawesome/css/solid.css" rel="stylesheet">
</head>
<body>
    <?php
if ($_SESSION["create_bill"]["confirm"] != 2) {
    header('location:http://localhost/baitapthunhat/pay.php');
}
include "header.php";
$randomStr = $_SESSION["bill_id"];
include "connect.php";
?>


<div class="container-profile">
        <div class="bill-item">
            <p>Mã đơn hàng đã đặt:<?php echo $randomStr; ?></p>
    <?php

$sql3 = "SELECT * from billdetailed where bill_id = '$randomStr'";
$res = mysqli_query($conn, $sql3);

while ($row = mysqli_fetch_array($res)) {
    $idToPrint = $row["product_id"]; ?>
    <div class="item">
        <div class="line"></div>

    <?php
$sql4 = "SELECT * from products where id_product = '$idToPrint'";
    $res2 = mysqli_query($conn, $sql4);

    while ($row2 = mysqli_fetch_array($res2)) {
        echo '<p><span class="red">Tên sản phẩm:</span> ' . $row2["name_product"] . '</p>';
        echo '<p><span class="red">Đơn giá:</span> ' . number_format($row2["price"]) . ' VNĐ</p>';
    } ?>


                <div><span class="red">Số lượng:</span> <?php echo $row["product_quantity"]; ?></div>
                <div class="line"></div>
            </div>

    <?php
}
?>

            <p class="red">Tổng tiền: <?php echo number_format($_SESSION["total"]); ?> VNĐ</p>
        </div>
        <div class="redirect">
        <div>
            <a href="home.php">Mua hàng tiếp</a>
        </div>
        <div>
            <a href="personalPage.php">Xem tình trang đơn hàng trong trang cá nhân</a>
        </div>
        </div>
    </div>
    <?php
//session_unset()
// echo "<pre>";
// print_r($_SESSION);
// echo "</pre>";
unset($_SESSION["total"]);
unset($_SESSION["bill_id"]);
unset($_SESSION["count_money"]);
unset($_SESSION["display_quantity"]);
unset($_SESSION["id_product"]);
unset($_SESSION["info_customer"]["sent"]);
unset($_SESSION["create_bill"]);

?>
</body>
</html>