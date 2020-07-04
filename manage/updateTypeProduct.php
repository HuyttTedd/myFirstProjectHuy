<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sửa loại sản phẩm</title>
</head>
<body>

<?php
        if(!isset($_SESSION["admin_info"]["admin_phone"])) {
            header('location:http://localhost/baitapthunhat/manage/index.php');
        }
        $product_type_id = "";
        $flag = "";
        //request
        if(isset($_REQUEST["type_id"])) {
            $product_type_id = $_REQUEST["type_id"];
        }
        if(isset($_POST["submit"])) {
            $name = $_POST["name"];
            include("connect2.php");
            $sql = "UPDATE product_type SET type_name = '$name' where type_id = '$product_type_id'";
            if(mysqli_query($conn, $sql)) {
                $flag = "Sửa thành công!";
            }
        }
        include("headerAdmin.php");
?>

<form action="" method="POST">

    <input type="hidden" value="<?php echo $product_type_id; ?>" name="id">
    <div>
        Sửa tên loại sản phẩm thành:
    </div>
    <input type="text" name="name">
    <div><?php echo $flag; ?></div>
    <input type="submit" name="submit" value="Xác nhận">
</form>

</body>
</html>