<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xóa sản phẩm</title>
</head>
<body>
<?php
        if(!isset($_SESSION["admin_info"]["admin_phone"])) {
            header('location:http://localhost/baitapthunhat/manage/index.php');
        }
?>
    <div>
        <a style="text-decoration: none; color: red" href="admin.php">Trở về trang chủ</a>
    </div>
    <div class='item'>
    <a href="listProduct.php" style="text-decoration: none; color: red">Danh sách tất cả sản phẩm</a>
    </div>
<?php
    include("connect2.php");
    $confirm = "";
    $product_id = "";
        if(isset($_REQUEST["product_id"])) {
            $product_id = $_REQUEST["product_id"];
    } 
    if($_SERVER["REQUEST_METHOD"] === "POST") {
        
        $sql = "DELETE from products where id_product = '$product_id'";
        $res = mysqli_query($conn, $sql);
if ($res) {
    echo "Xóa sản phẩm thành công!";

} else {
    echo "Có lỗi!";
}

    }
?>


    <h1>Xóa sản phẩm</h1>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="POST">
        Bạn có chắc muốn xóa sản phẩm có <?php echo $product_id; ?>?<br>
        <input type="hidden" name="id" value="<?php echo $product_id; ?>">
        <input type="submit" value="Xác nhận xóa!">
    </form>
<hr> <hr><hr>


    <p><?php echo $confirm; ?></p>
</body>
</html>