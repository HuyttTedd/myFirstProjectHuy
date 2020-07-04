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
        include("headerAdmin.php");
?>

<?php
    $flag = "";
    $phone_update = "";
    if(isset($_REQUEST["phone"])) {
        $phone_update = $_REQUEST["phone"];
    }
    if($_SERVER["REQUEST_METHOD"] === "POST") {
        $phone = $_POST["phone"];
        $name = $_POST["name"];
        $pass = $_POST["pass"];
        if(isset($_POST["level"])) {
            $level = $_POST["level"];
        } else {
            $level = "";
        }

        include("connect2.php");
        $sql_select = "SELECT * from admin where admin_phone_number = '$phone'";
        $res = mysqli_query($conn, $sql_select);
        $row = mysqli_fetch_array($res);
        
        if($name == "") {
            $name = $row["admin_name"];
        } else {
            $name = $name;
        }
        if($pass == "") {
            $pass = $row["password"];
        }

        if($level == "") {
            $level = $row["level"];
        }

        $sql_update = "UPDATE admin SET admin_name='$name',password='$pass',level='$level' WHERE admin_phone_number = '$phone'";
        if(mysqli_query($conn, $sql_update)) {
            $flag = "Sửa thông tin thành công!";
        } else {
            $flag = "Có lỗi xảy ra, thử lại sau!";
        }
    }

?>
    <form style="text-align: center;" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="POST" autocomplete="off">
        <div>
            Số điện thoại ADMIN cần sửa thông tin:
        </div>
        <input type="text" name="phone" value="<?php echo $phone_update;?>">
        <h3>Nhập thông tin cần sửa:</h3>
        <div>
            Tên admin mới:
        </div>
        <input type="text" name="name">
        <div>
            Mật khẩu mới:
        </div>
        <input type="text" name="pass">
        <div>
            Sửa level:
        </div>
        <input type="radio" name="level" value="0">Admin
        <input type="radio" name="level" value="1">SuperAdmin
        <div style="color: red">Mục nào không muốn sửa thì để trống!</div>
        <div></div>
        <input type="submit" value="Xác nhận" name="submit">
        <h3><?php echo $flag; ?></h3>
    </form>
</body>
</html>