<?php
    session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="detailed-product.css">
    <link href="fontawesome/css/fontawesome.css" rel="stylesheet">
    <link href="fontawesome/css/brands.css" rel="stylesheet">
    <link href="fontawesome/css/solid.css" rel="stylesheet">

</head>
<body>
    <?php
        include("header.php");
    ?>
<?php
        $id1 = $_REQUEST["id_product"];
        include("connect.php");
        $sql1 = "SELECT * FROM products where id_product = $id1";
        $resProduct = mysqli_query($conn, $sql1);
        while ($row = mysqli_fetch_array($resProduct)) {
            $id2 = $row["id_product"];
            $img = $row["product_image"];
            $name = $row["name_product"];
            $price = $row["price"];
            $description = $row["description"];
            $type = $row["id_type_product"];
        
        }
        $i = 0;
        
        
        $sql2 = "SELECT * FROM img where id_product = $id1";
        $resProduct2 = mysqli_query($conn, $sql2);
        while ($row2 = mysqli_fetch_array($resProduct2)) {
            $img2[$row2["id_image"]] = $row2["link_image"];    
            $i++;
        }
?>
    

 <div class="container-detail">

    <div class="detailed-product">   
        <div class="img-product">
        <?php
                echo '<img src="'.$img.'"/>';
        ?>
        </div>


        <div class="small-img">
<?php
    if (isset($img2)) {
        foreach ($img2 as $key => $value) {
            echo '<img src="'.$value.'" alt="">';
        }
    }
?>
        </div>


        <div class="description-product">

            <div id="buy">
            <p class="title-product"><?php echo $name;?></p>
            <p class="price"><?php echo number_format($price);?> VNĐ</p>
            <form action="pay.php">

            <div class="box">
            <a href="pay.php?id-from-detailed-product=<?php echo $id2;?>">MUA NGAY!</a>
            </div>
            </form>
            </div>
        </div>
    </div>

    <div class="about-product">
        <span class="font">Thông tin sản phẩm</span>
        <p><?php echo $description;?></p>

        <?php
        if (isset($img2)) {
            foreach ($img2 as $key => $value) {
                echo '<div class="img-container">      
                <img src="'.$value.'" alt="">
                <span></span>
                </div>';
            }
        }
        ?>
        <!--
        <div class="img-container">      
        <img src="assets/cake.jpeg" alt="">
        <span></span>
        </div>
    -->
    </div>

    <div class="similar-product">
        <p>Sản phẩm tương tự</p>
    </div>

    <?php
    // if(isset($_SESSION["id_product"])) {
    //     $arr_id = array_column($_SESSION["id_product"], 'id_product');
    //     //$_SESSION["id_product"][$count] = $id;
    //     if(in_array($id2, $arr_id)) {
            
    //     } else {
    //         $count = count($_SESSION["id_product"]);
    //         // $item_array = [
    //         //     'id_product' => $id
    //         // ];
    //         $_SESSION["id_product"][$count] = ['id_product' => $id2];
    //     }

    // } else {    
    //     // $item_array = [
    //     //     'id_product' => $id
    //     // ];
    //     $_SESSION["id_product"][0] = ['id_product' => $id2];
    // }

?>

    








<div class="content">
        <div class="product">           
<?php
        $sql3 = "SELECT * FROM products where id_type_product = $type";
        $resProduct = mysqli_query($conn, $sql3);
        while ($row2 = mysqli_fetch_array($resProduct)) {
?>
        <div class="product-item">
                <a href="detailed-product.php?id_product=<?php echo $row2['id_product'];?>">
                <?php
                echo '<img src="'.$row2['product_image'].'"/>';
                ?>
                        <!--Limit word < 45-->
                        <p><?php echo $row2["name_product"]; ?></p>
                        <span><?php echo number_format($row2["price"]); ?> VNĐ</span>                       
                </a>
                <div>
                <button onclick="addToCart(<?php echo $row2['id_product']; ?>)">
                        <div class="cart">
                            <h5>Thêm vào giỏ<i class="fas fa-cart-arrow-down"></i></h5>                          
                        </div>
                </button>
                </div>
        </div>
<?php
}

?>
        </div>
    </div>
    
    </div>
    <!--Giỏ hàng-->
    <div id="my-cart">
        <a href="pay.php">
            <i class="fas fa-shopping-cart"></i>
        </a>
        <p id="count-product">
        <?php
                if(isset($_SESSION["id_product"])) {
                    echo count($_SESSION["id_product"]);
                } else {
                    echo 0;
                }
            ?>
        </p>
    </div>


    <script>
        function addToCart(str) {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if(this.readyState == 4 && this.status == 200) {
                    document.getElementById("count-product").innerHTML = this.responseText;
                }
            };

            xmlhttp.open("GET", "cart.php?id=" + str, true);
            xmlhttp.send();
        }
    </script>

<?php
        include("footer.php");
    ?>
</body>
</html>