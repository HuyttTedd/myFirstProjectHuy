<link rel="stylesheet" href="home1.css">

<?php
    include("connect.php");
    $sql = "SELECT * from product_type";
    $res = mysqli_query($conn, $sql);
    while($row = mysqli_fetch_array($res)) {
?>
    <div class="container-hl">
        <div class="title-hl">
            <?php echo $row["type_name"]; ?>
        </div>
        <div class="product-hl">
<?php
    $sql1 = "SELECT * from products order by rand() limit 6";
    $res1 = mysqli_query($conn, $sql1);
            while($row1 = mysqli_fetch_array($res1)) {

?>

            <div class="item-hl">
                <a href="detailed-product.php?id_product=<?php echo $row1["id_product"]; ?>">
                    <img src="<?php echo $row1["product_image"]; ?>" alt="">
                </a>
            </div>
<?php
        }
?>
        </div>
        <div class="more">
            <a href="home.php?val=<?php echo $row["type_id"]; ?>&page=1">Xem chi tiết!</a>
        </div>
    </div>
<?php
    }
?>

    <!--Body-->
<!--
    <div class="container-hl">
        <div class="title-hl">
            title title
        </div>
        <div class="product-hl">
            <div class="item-hl">
                <a href="">
                    <img src="http://dummyimage.com/250x250.jpg/ff4444/ffffff" alt="">
                </a>
            </div>
            <div class="item-hl">
                <a href="">
                    <img src="http://dummyimage.com/250x250.jpg/ff4444/ffffff" alt="">
                </a>
            </div>
            <div class="item-hl">
                <img src="http://dummyimage.com/250x250.jpg/ff4444/ffffff" alt="">
            </div>
            <div class="item-hl">
                <img src="http://dummyimage.com/250x250.jpg/ff4444/ffffff" alt="">
            </div>
            <div class="item-hl">
                <img src="http://dummyimage.com/250x250.jpg/ff4444/ffffff" alt="">
            </div>
            <div class="item-hl">
                <img src="http://dummyimage.com/250x250.jpg/ff4444/ffffff" alt="">
            </div>
        </div>
        <div class="more">
            <a href="#">Xem thêm!</a>
        </div>
    </div> -->
