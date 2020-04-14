<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="pay.css">
    <script src="https://kit.fontawesome.com/f1e0b185be.js" crossorigin="anonymous"></script>

</head>
<body>

    <div class="container">
    
    <?php
        if(empty($_SESSION["id_product"])) {
            echo '<div class="empty-cart"><p>Giỏ hàng trống</p></div>';
        }
    ?>
<?php
//delete item
    if(isset($_POST["delete-item"])) {
        $delete_id = $_POST["delete-item"];
        unset($_SESSION["count_money"][$delete_id]);
        unset($_SESSION["display_quantity"][$delete_id]);
        foreach($_SESSION["id_product"] as $key => $value) {
            if($value["id_product"] == $delete_id) {
                unset($_SESSION["id_product"][$key]);
                echo "<script>window.location = 'pay.php'</script>";
            }
        }
    }
    //Total variable
    $total = 0;
    
    include("connect.php");
    if(isset($_SESSION["id_product"])){
        $pay = array_column($_SESSION["id_product"], 'id_product');
    foreach($pay as $key => $value) {
        $sql = "SELECT * FROM products where id_product = $value";
        $res = mysqli_query($conn, $sql);
        $row = mysqli_fetch_array($res);
        if(!isset($_SESSION["display_quantity"][$row['id_product']])) {
            $_SESSION["display_quantity"][$row['id_product']] = 1;
        }
?>    
        <div class="bill">
            <div class="image"><img src="cake.jpeg" alt=""></div>
            <div class="content">
                <p><?php echo $row["name_product"]; ?></p>
                <span>
                    Số lượng: 
                   <a href="#"><i class="fas fa-minus" onclick="minus(<?php echo $row['id_product']; ?>)"></i></a>
                <!--Input-->
                    <input name="" 
                    onkeyup="onlyPositiveNum(<?php echo $row['id_product']; ?>)" 
                    id="<?php echo $row['id_product']; ?>"
                     type="text"
                    value="<?php echo $_SESSION["display_quantity"][$row['id_product']]; ?>"
                    >
                <!--Input-->
                   <a href="#"><i onclick="plus(<?php echo $row['id_product']; ?>)" class="fas fa-plus"></i></a>
                </span>
                <p class="price-product">
                    Đơn giá: <?php echo $row["price"]; ?>
                </p>
                <form action="pay.php" method="post">
                    <input type="text" id="delete-item" name="delete-item" value="<?php echo $row['id_product']; ?>" >
                    <input type="submit" value="Xóa sản phẩm" id="submit-delete-item">
                </form>

            </div>

        </div>
        
<?php   
    if(!isset($_SESSION["count_money"][$row['id_product']])) {
        $_SESSION["count_money"][$row['id_product']] = [$row["price"] => 1];
    }

        }
        
    }
?>
    </div>
    <?php

    //TOTAL
    if(isset($_SESSION["count_money"])) {
        foreach($_SESSION["count_money"] as $key => $value) {
            foreach($value as $key2 => $value2) {
                $total += (int)$key2 * (int)$value2;
            }
        }
    }
    ?>
    <!--calculate-->
    <div class="money">
        <div class="sum">
            <p>Tổng tiền: <span id="sum-price"><?php echo $total; ?></span></p>
        </div>
        <div class="buy-it">
            <a href="info.php">Mua hàng</a>
        </div>
    </div>

    <script src="js/pay.js"></script>

    <div id="demo"></div>

    <?php
        //session_destroy();
        // echo "<pre>";
        // print_r($_SESSION["id_product"]);
        // echo "</pre>";
    ?>
</body>
</html>