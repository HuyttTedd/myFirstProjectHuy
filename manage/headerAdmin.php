<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="headerAdmin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<header>

    <?php
if(isset($_SESSION["admin_info"]["admin_phone"])) {
?>
<a href="adminLogout.php">Đăng xuất</a>
<?php
} else {
?>
<a href="index.php">Đăng nhập</a>
<?php
}
?>
<?php
    if($_SESSION["admin_info"]["admin_level"] > 0) {
?>
<div class="dropdown">
            <button class="btn">Quản lý Admin <i class="fa fa-caret-down"></i></button>
            <div class="content">
                <a href="superadmin.php">Danh sách Admin</a>
                <a href="addAdmin.php">Thêm Admin</a>
            </div>
    </div>
<?php
    }
?>


    <a href="deleteCustomer.php">Khoá tài khoản KH</a>
        <div class="dropdown">
            <button class="btn">Quản lý sản phẩm <i class="fa fa-caret-down"></i></button>
            <div class="content">
                <a href="listProduct.php">Danh sách sản phẩm</a>
                <a href="addTypeProduct.php">Thêm loại sản phẩm</a>
                <a href="addProduct.php">Thêm sản phẩm</a>
                <a href="add_img_hl.php">Ảnh nổi bật</a>
            </div>
        </div>
    
    <a href="manageBills.php">Tình trạng đơn hàng</a>
    
</header>                   
</body>
</html>