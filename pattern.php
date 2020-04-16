<div class="product-item">
                <a href="#">
                <img src="http://placehold.it/250x250">
                <!--Limit word < 45-->
                <p><?php echo "chim to ko lo chet doi chim to ko lo chet doi";?></p>
                <span>10000000</span>
                </a>
            </div>



            <!--Carousel
    <div class="carousel-wrap">
        <div class="owl-carousel">
          <div class="item"><img src="http://placehold.it/250x250"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
        </div>
      </div>-->

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
                    <p><?php echo $resProduct["name_product"]; ?></p>
                    <span><?php echo $resProduct["price"]; ?></span>
            </a>
    </div>
<?php
    }
}
?>

.buy-now {
    text-decoration: none;
    text-transform: uppercase;
    color: white;
    font-weight: bold;
    background-color: red;
    padding: 1rem 3rem;
    font-size: 1rem;
    border-radius: 4px;

}


.title-product {
    color: red;
    text-transform: uppercase;
    font-weight: bold;
    font-size: 1.5rem;
}

<?php
                if(isset($_SESSION["id_product"])) {
                    echo count($_SESSION["id_product"]);
                } else {
                    echo 0;
                }
                
            ?>

<?php
    $id = $_REQUEST["id"];
    if(isset($_SESSION["id_product"])) {
        $arr_id = array_column($_SESSION["id_product"], 'id_product');
        //$_SESSION["id_product"][$count] = $id;
        if(in_array($id, $arr_id)) {

        } else {
            $count = count($_SESSION["id_product"]);
            $item_array = [
                'id_product' => $id
            ];
            $_SESSION["id_product"][$count] = $item_array;
        }

    } else {    
        $item_array = [
            'id_product' => $id
        ];
        $_SESSION["id_product"][0] = $item_array;
    }

    echo count($_SESSION["id_product"]);


?>


<div class="container">
        <div class="bill">
            <div class="image"><img src="cake.jpeg" alt=""></div>
            <div class="content">
                <p>Titleasddddddddasdasdsdsdsdsdsdsádddddddddsadasd</p>
                <span>Số lượng: </span><input type="number">
                <p class="price-product">Giá: <input type="text" onkeyup="sum()" class="price" value="asadsdsa"></p>
            </div>
        </div>
    </div>

    <div class="detailed-item"> 
            <img src="anhnen1.jpg" alt="">
            <div class="price-and-quantity">
                <p></p>
                <p>Đơn giá</p>
            </div>        
        </div>


        <div class="product-item">
                    <a href="#">
                        <img src="cake.jpeg">
                        <!--Limit word < 45-->
                        <p><?php echo "asadsdsdsdssdsdsdsdsdsdsdsdsdsdsdsdsdsds"; ?></p>
                        <span><?php echo "as"; ?></span>
                    </a>
                    <div>
                    <button>                                       
                            <h5 id="cart">Thêm vào giỏ hàng<i class="fas fa-cart-arrow-down"></i></h5>                                              
                    </button>
                    </div>
            </div>


            #c38f54