<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="info.css">
</head>
<body>
    <div class="container-info">
        <form action=""> 
        <div class="item">
            <div>Số điện thoại:</div>
            <input type="text">
        </div>

        <div class="item">
            <div>Địa chỉ giao hàng:</div>
            <input type="text">  
        </div>

        <div class="item">
            <div>Lời nhắn: </div>
            <textarea name="message" rows="4" cols="50"></textarea>
        </div>

        <div class="item">
            <div>Tổng tiền:</div>
            <input type="text" id="price-bill">
        </div>
        <div class="item">
            <p>Chi tiết sản phẩm: </p>
        </div>

        <?php
            include("connect.php");
            $pay = array_column($_SESSION["id_product"], 'id_product');
        foreach ($pay as $key => $value) {
            $sql = "SELECT * FROM products where id_product = $value";
            $res = mysqli_query($conn, $sql);
            while ($row = mysqli_fetch_array($res)) {
                ?>
            <div class="detailed-item"> 
                <img src="anhnen1.jpg" alt="">
                <div class="price-and-quantity">
                    <p><?php echo $row["name_product"]." X ".$_SESSION["display_quantity"][$row["id_product"]]; ?></p>
                    <p>Đơn giá: <?php echo $row["price"]; ?></p>
            </div>        
        </div>
        <?php
            }
        }
        ?>
        
        <input type="submit" value="MUA HÀNG" id="submit-bill">
        </form>
    </div>
</body>
</html>

