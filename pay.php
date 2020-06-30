<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop Vàng Mã Giỏ Hàng</title>
    <link rel="stylesheet" href="pay.css">
    <link href="fontawesome/css/fontawesome.css" rel="stylesheet">
    <link href="fontawesome/css/brands.css" rel="stylesheet">
    <link href="fontawesome/css/solid.css" rel="stylesheet">

</head>
<body>
    <?php
    if (!isset($_SESSION['info_customer']["phone_number"])) {
        header('location:http://localhost/baitapthunhat/home.php');
    }
        include("header.php");
    ?>
    <!--chuyển hướng từ trang chi tiết sản phẩm-->
    <?php
    if (isset($_REQUEST["id-from-detailed-product"])) {
        $id3 = $_REQUEST["id-from-detailed-product"];
        if (isset($_SESSION["id_product"])) {
            $arr_id = array_column($_SESSION["id_product"], 'id_product');
            //$_SESSION["id_product"][$count] = $id;
            if (in_array($id3, $arr_id)) {
            } else {
                $count = count($_SESSION["id_product"]);
                // $item_array = [
                //     'id_product' => $id
                // ];
                $_SESSION["id_product"][$count] = ['id_product' => $id3];
            }
        } else {
            // $item_array = [
            //     'id_product' => $id
            // ];
            $_SESSION["id_product"][0] = ['id_product' => $id3];
        }
    }
    
    ?>

    <!------------------------------------------------------------------------->
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
            $_SESSION["display_quantity"][$row['id_product']]["quantity"] = 1;
            $_SESSION["display_quantity"][$row['id_product']]["product_name"] = $row["name_product"];
            $_SESSION["display_quantity"][$row['id_product']]["price"] = $row["price"];
        }
?>    
        <div class="bill">
            <div class="image">
            <?php
                echo '<img src="'.$row['product_image'].'"/>';
            ?>  
            </div>
            <div class="content">
                <p><?php echo $row["name_product"]; ?></p>
                <span>
                    Số lượng: 
                   <i class="fas fa-minus" onclick="minus(<?php echo $row['id_product']; ?>)"></i>
                <!--Input-->
                    <input name="" 
                    onkeyup="onlyPositiveNum(<?php echo $row['id_product']; ?>, this.value, <?php echo $row['quantity']; ?>)" 
                    id="<?php echo $row['id_product']; ?>"
                     type="number"
                    value="<?php echo $_SESSION["display_quantity"][$row['id_product']]["quantity"]; ?>"
                    >
                <!--Input-->
                   <i onclick="plus(<?php echo $row['id_product']; ?>)" class="fas fa-plus"></i>
                </span>
                <p class="price-product">
                    Đơn giá: <?php echo number_format($row["price"]); ?> VNĐ
                </p>
                <p style="font-size: .8rem; color: white">Số lượng: <?php echo $row['quantity']; ?></p>
                <form action="pay.php" method="post">
                    <input type="text" id="delete-item" name="delete-item" value="<?php echo $row['id_product']; ?>" >
                    <input type="submit" value="Xóa sản phẩm" class="submit-delete-item-real">
                </form>

        <button class="submit-delete-item">Xóa sản phẩm</button>
            </div>

        </div>

    <div class="popup">
        <div class="popup-content">
            <p>Bạn có chắc muốn xóa sản phẩm này</p>
            <button class="accept-form">Đồng ý</button>
            <button class="cancel-form">Hủy</button>
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

    $_SESSION["total"] = $total;
    ?>
    <!--calculate-->
    <div class="money">
        <div class="sum">
            <p>Tổng tiền: <span id="sum-price"><?php echo number_format($total); ?> VNĐ</span></p>
        </div>
        <div class="buy-it">
            <a href="info.php">Mua hàng</a>
        </div>
    </div>

    <script src="pay.js"></script>

    <!--*********POPUP***********POPUP***************POPUP***********************************
    <div class="popup" id="popup">
        <div class="popup-content">
            <p>Bạn có chắc muốn xóa sản phẩm này</p>
            <button id="accept-form">Đồng ý</button>
            <button id="cancel-form">Hủy</button>
        </div>
    </div>
    *********POPUP***********POPUP***************POPUP***********************************-->
    <script>
        var openPopup = document.getElementsByClassName("submit-delete-item");
        var acceptForm = document.getElementsByClassName("accept-form");
        var cancelForm = document.getElementsByClassName("cancel-form");
        
        for(let i = 0; i < openPopup.length; i++) {
            openPopup[i].onclick = function (e) {
                document.getElementsByClassName("popup")[i].style.display = "block";
            }
            cancelForm[i].onclick = function() {
                document.getElementsByClassName("popup")[i].style.display = "none";
        }
            acceptForm[i].onclick = function() {
                document.getElementsByClassName("submit-delete-item-real")[i].click();
            }
        }



    </script>

    <?php
        //session_destroy();
        // echo "<pre>";
        // print_r($_SESSION["id_product"]);
        // echo "</pre>";
    include("footer.php");
        // echo "<pre>";
        //     print_r($_SESSION);
        // echo "</pre>";
    ?>
</body>
</html>