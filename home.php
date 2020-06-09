<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop Vàng Mã</title>
    <link rel="stylesheet" href="home.css">
    <link href="fontawesome/css/fontawesome.css" rel="stylesheet">
    <link href="fontawesome/css/brands.css" rel="stylesheet">
    <link href="fontawesome/css/solid.css" rel="stylesheet">

</head>

<body>
    <!--Header-->
    <?php
    include("header.php");
    //MAKE search bar
    //  if (isset($_GET["searchProduct"])) {
    //     $search = $_GET["searchProduct"];
    //     include("connect.php");
    //     $sqlCategory = "SELECT * FROM products where name_product like '%$search%'";
    //     $resCategory = mysqli_query($conn, $sqlCategory);
    //  }
    ?>

    <!--body-->
    <div class="container-body">

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
                while ($dataCategory = mysqli_fetch_array($resCategory)) {
                ?>
                    <div class="item">
                        <a href="home.php?val=<?php echo $dataCategory["type_id"]; ?>&page=1">
                            <div></div>
                            <span><?php echo $dataCategory["type_name"]; ?></span>
                        </a>
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
<!--URL-->
<?php
$url = 'home.php';
    if(isset($_REQUEST["val"])&&isset($_REQUEST["page"])){
        $url = 'home.php?val='.$_REQUEST["val"].'&page='.$_REQUEST["page"].'' ;
    } else if(isset($_REQUEST["searchProduct"]) && isset($_REQUEST["page"])) {
        $url = 'home.php?val='.$_REQUEST["searchProduct"].'&page='.$_REQUEST["page"].'' ;
    }
    
?>
            </div>
            <div class="arrange">
                <span>Sắp xếp <i class="fas fa-chevron-down"></i></span>
                <div class="dropdown">
                
                        <form action="<?php echo $url;?>" method="POST">
                            <input type="hidden" name="arrange" value="ASC">
                            <button type="submit">Sắp xếp theo giá tăng dần</button>
                        </form>
                        <form action="<?php echo $url;?>" method="POST">
                            <input type="hidden" name="arrange" value="DESC">
                            <button type="submit">Sắp xếp theo giá giảm dần</button>
                        </form>

                </div>
            </div>

            <div class="product">

    <?php
        if (isset($_REQUEST['val']) && isset($_REQUEST["page"])) {
            $val_id = $_REQUEST["val"];
            $page = $_REQUEST["page"];
            if (is_numeric($page) && $page > 0) {
                    //số bài giới hạn của 1 trang
                    $limit = 10;
                    $offset = ($page-1)*$limit;

                    include("connect.php");
            if (isset($_POST["arrange"])) {
                $arrange = $_POST["arrange"];
                $sql_display_product = "SELECT * FROM products where id_type_product = $val_id ORDER BY price $arrange limit '$offset', '$limit'";
                
            } else {
                $sql_display_product = "SELECT * FROM products where id_type_product = $val_id limit $offset, $limit";

            }
                    $resProduct = mysqli_query($conn, $sql_display_product);
                    //đếm số record của sản phẩm
                    $sql_count = "SELECT * FROM products where id_type_product = $val_id";
                    $resCount = mysqli_query($conn, $sql_count);
                    $count = mysqli_num_rows($resCount);
                    //tính số page
                    $total_page = ceil($count / $limit);
            while ($data1 = mysqli_fetch_array($resProduct)) {
    ?>
                        <div class="product-item">
                            <a href="detailed-product.php?id_product=<?php echo $data1['id_product']; ?>" >
                                <?php
                                echo '<img src="'.$data1['product_image'].'"/>'; ?>
                                <!--Limit word < 45-->
                                <p><?php echo $data1["name_product"]; ?></p>
                                <span><?php echo number_format($data1["price"]); ?> VNĐ</span>
                            </a>
                            <div>
                                <button onclick="addToCart(<?php echo $data1['id_product']; ?>)">
                                    <div class="cart">
                                        <h5>Thêm vào giỏ<i class="fas fa-cart-arrow-down"></i></h5>
                                    </div>
                                </button>
                            </div>
                        </div>
    <?php
                    }
                    
                }
                }
    ?>

                <!--Hiển thị sản phẩm từ thanh tìm kiếm-->
    <?php
                if (isset($_GET["searchProduct"])) {
                    $search = trim($_GET["searchProduct"]);
                    
                    include "connect.php";

                    $limit = 10;
                    if(!isset($_REQUEST["page"])) {
                        $page = 1;
                    } else {
                        $page = $_REQUEST["page"];
                    }
                    $offset = ($page-1)*$limit;
                    

                    $sqlSearch = "SELECT * FROM products where name_product like '%$search%' limit $offset, $limit";
                    $sql_count = "SELECT * FROM products where name_product like '%$search%'";
                    $resCount = mysqli_query($conn, $sql_count);
                    $count =mysqli_num_rows($resCount);

                    $total_page = ceil($count / $limit);
                    
                    $resSearch = mysqli_query($conn, $sqlSearch);
                    while ($rowSearch = mysqli_fetch_array($resSearch)) {
    ?>
                    <div class="product-item">
                            <a href="detailed-product.php?id_product=<?php echo $rowSearch['id_product']; ?>">
                                <?php
                                echo '<img src="'.$rowSearch['product_image'].'"/>';
                                ?>
                                <!--Limit word < 45-->
                                <p><?php echo $rowSearch["name_product"]; ?></p>
                                <span><?php echo number_format($rowSearch["price"]); ?> VNĐ</span>
                            </a>
                            <div>
                                <button onclick="addToCart(<?php echo $rowSearch['id_product']; ?>)">
                                    <div class="cart">
                                        <h5>Thêm vào giỏ<i class="fas fa-cart-arrow-down"></i></h5>
                                    </div>
                                </button>
                            </div>
                    </div>
    <?php
                    }
                    
                }
    ?>
                <!--TEST PRODUCT-->
                <!--hightlight Product if dont request-->
    <!--            <div class="hightlight">
                    <div class="top-sell"></div>
                    <div class="topic"> -->


                        <?php

                        // if (isset($_REQUEST['val'])) {
                        //     $val_id = $_REQUEST["val"];
                        //     include "connect.php";
                        //     $sql_display_product = "SELECT * FROM products where id_type_product = $val_id";
                        //     $resProduct = mysqli_query($conn, $sql_display_product);
                        //     while ($data1 = mysqli_fetch_array($resProduct)) {
                        ?>
    <!--                            <div class="hightlight-items">
                                    <a href="detailed-product.php?id_product=<?php //echo $data1//['id_product']; ?>">
                                        <?php
                                        //echo '<img src="'.$data1['product_image'].'"/>';
                                        ?>
                                    
                                        <p><?php //echo $data1["name_product"]; ?></p>
                                        <span><?php //echo number_format($data1["price"]); ?> VNĐ</span>
                                    </a>
                                    <div>
                                        <button onclick="addToCart(<?php //echo $data1//['id_product']; ?>)">
                                            <div class="cart">
                                                <h5>Thêm vào giỏ<i class="fas fa-cart-arrow-down"></i></h5>
                                            </div>
                                        </button>
                                    </div>
                                </div> -->
                        <?php
                            //}
                        //}
                        ?>

                    </div>
                    <?php
                if(isset($_REQUEST["searchProduct"])) {
                    echo '<div class="container-paginate">';
                    for ($i = 1; $i <= $total_page; $i++) {
                        echo '<a href="home.php?searchProduct='.$search.'&page='.$i.'" class="paginate">'.$i.'</a>';
                    }
                    echo '</div>';
                } else if(isset($_REQUEST["val"])) {
                    echo '<div class="container-paginate">';
                    for ($i = 1; $i <= $total_page; $i++) {
                        echo '<a href="home.php?val='.$val_id.'&page='.$i.'" class="paginate">'.$i.'</a>';
                    }
                    echo '</div>';
                } 
                    ?>
                    <!--display-->
                </div>
            </div>
        </div>
    <?php 
        if(!isset($_REQUEST["val"]) && !isset($_REQUEST["searchProduct"])) {
            include("home1.php");
        }
    ?>
        <!--Giỏ hàng-->
        <div id="my-cart">
            <a href="pay.php">
                <i class="fas fa-shopping-cart"></i>
            </a>
            <p id="count-product">
                <?php
                if (isset($_SESSION["id_product"])) {
                    echo count($_SESSION["id_product"]);
                } else {
                    echo 0;
                }
                ?>
            </p>
        </div>
        <!--JS__________________---------------------------------------------------------->
        <script src="js/a.js"></script>


        <script>
            function addToCart(str) {
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("count-product").innerHTML = this.responseText;
                    }
                };

                xmlhttp.open("GET", "cart.php?id=" + str, true);
                xmlhttp.send();
            }
        </script>

        <?php
        //session_destroy();
        //$conn->close();
        ?>

        <!--FOOTER-->
        <?php
        include("footer.php");
        
        // echo "<pre>";
        // print_r($_SESSION);
        // echo "</pre>";
        ?>
</body>

</html>