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
    <?php
        function checkPhone($val) {
            $pattern = '#^(03|05|07|08|09)[0-9]{8}$#';
            if(preg_match($pattern, $val)) {
                return true;
            } else {
                return false;
            }
        }

        $phoneErr = $addressErr = $nameErr = "";
        if($_SERVER["REQUEST_METHOD"] === "POST") {
            $phone = $_POST["phone-number"];
            if(checkPhone($phone)) {
                header('location:http://localhost/baitapthunhat/bill.php');
            } else {
                $phoneErr = "Số điện thoại không hợp lệ";
            }
        }
    ?>

    <div class="container-info">
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="POST"> 
        <div class="item">
            <div>Họ và tên:</div>
            <input type="text" name="name">
            <span><?php echo $nameErr;?></span>
        </div>

        <div class="item">
            <div>Số điện thoại:</div>
            <input type="text" name="phone-number">
            <span><?php echo $phoneErr;?></span>
        </div>

        <div class="item">
            <div>Địa chỉ giao hàng:</div>
            <input type="text" name="address">  
            <span><?php echo $addressErr;?></span>
        </div>

        <div class="item">
            <div>Lời nhắn: </div>
            <textarea name="message" rows="4" cols="50" placeholder="Ghi chú trên hóa đơn, người gửi,..."></textarea>
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
                    <p><?php echo $row["name_product"] ?></p>
                    <p>Đơn giá: <?php echo $row["price"]; ?> X <?php echo $_SESSION["display_quantity"][$row["id_product"]];?></p>
            </div>        
        </div>
        <?php
            }
        }
        ?>
        <div class="item">
            <div>Tổng tiền: <?php echo $_SESSION["total"]; ?></div>
            
        </div>

        <input type="submit" value="MUA HÀNG" id="submit-bill">
        </form>
    </div>
</body>
</html>

