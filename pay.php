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
</head>
<body>
    <div class="container">
<?php
    include("connect.php");
    if(isset($_SESSION["id_product"])){
        $pay = array_column($_SESSION["id_product"], 'id_product');
    foreach($pay as $key => $value) {
        $sql = "SELECT * FROM products where id_product = $value";
        $res = mysqli_query($conn, $sql);
        $row = mysqli_fetch_array($res);
?>    
        <div class="bill">
            <div class="image"><img src="cake.jpeg" alt=""></div>
            <div class="content">
                <p><?php echo $row["name_product"]; ?></p>
                <span>Số lượng: </span><input type="number">
                <p class="price-product">Giá: <?php echo $row["price"]; ?></p>
            </div>
        </div>
        
<?php   
        }
    }
?>
    </div>
    <!--calculate-->
    <div class="money">
        <div class="sum">
            <p>Tổng tiền: <span id="sum-price"></span></p>
        </div>
        <div class="buy-it">
            <a href="">Mua hàng</a>
        </div>
    </div>

    <script>
        function sum() {
            var x = document.getElementsByClassName("price");
            document.getElementById("sum-price").innerHTML = x[0].value;
        }
    </script>

    <div id="demo"></div>
</body>
</html>