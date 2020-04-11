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