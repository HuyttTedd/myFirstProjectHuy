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
<?php
    include("connect2.php");
    $confirm = "";
    if($_SERVER["REQUEST_METHOD"] === "POST") {
        $name = $_POST["name"];
        $sql = "INSERT INTO product_type (type_name)
VALUES ('$name')";

if ($conn->query($sql) === TRUE) {
    echo "Thêm thành công";
    
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
    }
?>


    <h1>Thêm loại sản phẩm</h1>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="POST">
        Tên loại sản phẩm muốn thêm: <br>
        <input type="text" name="name">
        <input type="submit" value="submit">
    </form>


    <p><?php echo $confirm; ?></p>
</body>
</html>