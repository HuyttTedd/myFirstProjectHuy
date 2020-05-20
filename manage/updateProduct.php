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
    $flag = "";
    $product_id = "";
        if(isset($_REQUEST["product_id"])) {
            $product_id = $_REQUEST["product_id"];
        }    

        if($_SERVER["REQUEST_METHOD"] === "POST") {
            $id = $_POST["id"];
            $name = $_POST["name"];
            $price = $_POST["price"];
            $img = $_POST["img"];
            $quantity = $_POST["quantity"];
            $descript = $_POST["descript"];
            
            if($id == "") {
                $flag = "ID để trống";
            } else {
                include("connect2.php");
                $sql = "SELECT * from products where id_product = '$id'";
                $res = mysqli_query($conn, $sql);
                if(mysqli_num_rows($res) < 1) {
                    $flag = "ID sản phẩm không tồn tại!";
                } else {
                    $row = mysqli_fetch_array($res);
                    
                    if (empty($name)) {
                        $name = $row["name_product"];
                    } 
                     if(empty($price)) {
                        $price = $row["price"];
                    }
                     if(empty($img)) {
                        $img = $row["product_image"];
                    }
                     if(empty($quantity)) {
                        $quantity = $row["quantity"];
                    }
                     if(empty($descript)) {
                        $descript = $row["description"];
                    }
                }

                $sql2 = "UPDATE products SET name_product='$name',
                price='$price', product_image='$img', quantity='$quantity', description='$descript' WHERE id_product='$id'";
                if ($conn->query($sql2) === TRUE) {
                    $flag = "Sửa thành công!";
                    
                  } else {
                    $flag = "Có lỗi xảy ra!";
                  }
        }
    }
    ?>

    <h1>Sửa sản phẩm <span style="color: red"><?php echo $product_id;?></span></h1>
    <h2><?php echo $flag; ?></h2>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="POST">
        
        <input type="hidden" name="id" value="<?php echo $product_id;?>">
        <div>Sửa tên sản phẩm:</div>
        <input type="text" name="name">
        <div>Sửa giá sản phẩm:</div>
        <input type="text" name="price">
        <div>Sửa ảnh sản phẩm:</div>
        <input type="text" name="img">
        <div>Sửa số lượng sản phẩm:</div>
        <input type="number" name="quantity">
        <div>Sửa mô tả sản phẩm:</div>
        <textarea name="descript" id="" cols="100" rows="10"></textarea>
        <div style="color: red">Chú ý: Mục nào không sửa thì để trống!</div>
        <input type="submit" value="Xác nhận">
        
    </form>
</body>
</html>