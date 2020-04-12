<?php
    session_start(); 
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/home.css">
    <script src="https://kit.fontawesome.com/f1e0b185be.js" crossorigin="anonymous"></script>

</head>
<body>
    <!--Header-->
    <header>
        
        <span>LOGO</span>
        

        <input type="checkbox" id="check">
        <label for="check" class="checkbtn"><i class="fa fa-bars" aria-hidden="true"></i></label>
        

    <div class="header1">
        <!--Form-->
        <form action="" id="search">
            <input type="text" id="search" placeholder="Bạn muốn mua gì?">
        </form>

        <div class="navlink">
            <a href="">Trang chủ</a>
            <a href="">Chủ đề</a>
            <a href="">Ưu đãi</a>
            <a href="">Xem bói</a>
        </div>

        
    </div>

        <ul>
            <li><a href="" class="aaa">Đăng nhập</a></li>
            <li><a href="">Đăng ký</a></li> 
        </ul>
    
    </header>

        <!--body-->

    <div class="first-part">
        <!--Carousel-->
        <div class="carousel">
            <div class="leftArrow" onclick="plusSlides(-1)"><i class="fa fa-arrow-left"></i></div>
            <div class="rightArrow" onclick="plusSlides(1)"><i class="fa fa-arrow-right"></i></div>

            <div class="imageHolder">
                <img src="assets/cake.jpeg" alt="">
            </div>
            <div class="imageHolder">
                <img src="assets/panda5.jpg" alt="">
            </div>
            <div class="imageHolder">
                <img src="assets/panda4.jpg" alt="">
            </div>
            <div class="imageHolder">
                <img src="assets/panda.jpg" alt="">
            </div>          
        </div>
        
        <div id="dotsContainer">
            
        </div>
    </div>

    <div class="content">
        <div class="category">
            <?php
                include("connect.php");
                $sqlCategory = "SELECT * FROM product_type";
                $resCategory = mysqli_query($conn, $sqlCategory);
                while($dataCategory = mysqli_fetch_array($resCategory)) {
            ?>  
                    <div class="item">
                <a href="home.php?val=<?php echo $dataCategory["type_id"]; ?>"><div></div>
                <span><?php echo $dataCategory["type_name"];?></span></a>
                    </div>
            <?php        
                }
                $conn->close();
            ?>

            <!--Pattern category 
            <div class="item">
                <a href=""><img src="http://placehold.it/130x55">
                <span></span></a>
            </div>
            -->
    
        </div>
        <div class="arrange">
            <p>sap xep</p>
        </div>
        <div class="product">
            
<?php

        if (isset($_REQUEST['val'])) {
        $valId = $_REQUEST["val"];
        include("connect.php");
        $sql_display_product = "SELECT * FROM products where id_type_product = $valId";
        $resProduct = mysqli_query($conn, $sql_display_product);
        while ($dataProduct = mysqli_fetch_array($resProduct)) {
?>
        <div class="product-item">
                <a href="#">
                        <img src="cake.jpeg">
                        <!--Limit word < 45-->
                        <p><?php echo $dataProduct["name_product"]; ?></p>
                        <span><?php echo $dataProduct["price"]; ?></span>                       
                </a>
                <button onclick="addToCart(<?php echo $dataProduct['id_product']; ?>)">
                        <div class="cart">
                            <h5>Thêm vào giỏ<i class="fas fa-cart-arrow-down"></i></h5>                          
                        </div>
                </button>
        </div>
<?php
}
}
?>

<!--TEST PRODUCT-->
            <div class="product-item">
                    <a href="#">
                        <img src="cake.jpeg">
                        <!--Limit word < 45-->
                        <p><?php echo "as"; ?></p>
                        <span><?php echo "as"; ?></span>
                    </a>
                    <div>
                    <button>                                       
                            <h5 id="carttt">Thêm vào giỏ hàng<i class="fas fa-cart-arrow-down"></i></h5>                                              
                    </button>
                    </div>
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
    <!--JS-->
    <script src="js/a.js"></script>


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
      //session_destroy();
      $conn->close();
    ?>
</body>
</html>