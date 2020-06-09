<?php
 session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
    body {
        margin: 0;
        padding: 0;
    }
    .normal-admin{
        background: #ffffcc;
        padding: 2rem;
    }
    .normal-admin .item {
        margin: 1.5rem 0;
        
    }

    .normal-admin .item a {
        text-decoration: none;
        color: black;
        background: #99ff66;
        padding: .4rem;
        border-radius: 7px;
    }

    .normal-admin .item a:hover {
        background: #ffff66;
    }

    .super-admin{
        background: #ffffcc;
        padding: 2rem;
    }
    .super-admin .item {
        margin: 1.5rem 0;
        
    }

    .super-admin .item a {
        text-decoration: none;
        color: black;
        background: #99ff66;
        padding: .4rem;
        border-radius: 7px;
    }

    .super-admin .item a:hover {
        background: #ffff66;
    }
    .status {
        background: yellow !important;
    }
    .status:hover {
        background: #e6e600 !important;
    }
    h1 {
        text-align: center;
       
    }
    h3 {
        color: red;
    }

    .logout {
        text-decoration: none;
        color: white;
        background: #4d4d00;
        padding: .5rem;
        margin-bottom: 1rem;
        float: right;
    }
</style>
<body>
    <?php
        if(!isset($_SESSION["admin_info"]["admin_phone"])) {
            header('location:http://localhost/baitapthunhat/manage/index.php');
        }
    ?>
<h1>Trang chủ ADMIN</h1>
<div>
    <h2 style="color: #666600">Xin chào <?php echo $_SESSION["admin_info"]["admin_name"];?>!</h2>
    <a href="adminLogout.php" class="logout">Đăng xuất</a>
</div>
<div class="normal-admin">
    <h3>Sản phẩm</h3>
    <div class='item'>
        <a href="manageBills.php" class="status">Quản lý tình trạng đơn hàng</a>
    </div>
    <div class='item'>
    <a href="listProduct.php">Danh sách tất cả sản phẩm</a>
    </div>
    <div class='item'>
    <a href="addTypeProduct.php">Thêm loại sản phẩm</a>
    </div>
    <div class='item'>
    <a href="addProduct.php">Thêm sản phẩm</a>
    </div>
    <!--
    <div class='item'>
    <a href="updateProduct.php">Sửa sản phẩm</a>
    </div>
    <div class='item'>
    <a href="updateTypeProduct.php">Sửa loại sản phẩm</a>
    </div>
    <div class='item'>
    <a href="deleteTypeProduct.php">Xóa loại sản phẩm</a>
    </div>
    <div class='item'>
    <a href="deleteProduct.php">Xóa sản phẩm</a>
    </div>
    -->
    <h3>Khách hàng</h3>
    <div class='item'>
    <a href="customer.php">Xem thông tin tất cả khách hàng</a>
    </div>
    <div class='item'>
    <a href="updateCustomer.php">Sửa thông tin khách hàng</a>
    </div>
    <div class='item'>
    <a href="deleteCustomer.php">Xóa tài khoản khách hàng</a>
    </div>
</div>
<hr>
<?php
    if ($_SESSION["admin_info"]["admin_level"] > 0) {
        echo '<div class="super-admin">
        <h3>Super Admin</h3>
        <div class="item">
            <a href="superadmin.php">Danh sách tất cả admin</a>
        </div>
        <div class="item">
            <a href="addAdmin.php">Thêm admin</a>
        </div>
    </div>';
    }
?>

</body>
</html>