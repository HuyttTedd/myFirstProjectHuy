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
                <span>Số lượng: <i class="fas fa-minus" onclick="minus(<?php echo $row['id_product']; ?>)"></i><input name="" onkeyup="onlyPositiveNum(<?php echo $row['id_product']; ?>)" id="<?php echo $row['id_product']; ?>" type="text" value="1"><i onclick="plus(<?php echo $row['id_product']; ?>)" class="fas fa-plus"></i></span>
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

        function onlyPositiveNum(str) {
            let i = document.getElementById(str);
            if(isNaN(i.value)) {
                i.value = "";
            }
        }
        function minus(str) {
            let i = document.getElementById(str);
            if(i.value == 1) {
                i.value = 1;
            } else if (Number(i.value) > 1) {
                i.value = Number(i.value) - 1;             
            }
            
        }

        function plus(str) {
            let i = document.getElementById(str);
            
                i.value = Number(i.value) + 1;             
            
            
        }


    </script>

    <div id="demo"></div>
</body>
</html>