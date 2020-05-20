<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm ADMIN</title>
    <script src="https://kit.fontawesome.com/63a257a1cd.js" crossorigin="anonymous"></script>
</head>
<body style="background: #b3b300">
    <div>
        <a style="text-decoration: none; color: red" href="admin.php">Trở về trang chủ</a>
    </div>
    <?php
        if(!isset($_SESSION["admin_info"]["admin_phone"])) {
            header('location:http://localhost/baitapthunhat/manage/index.php');
        }
    ?>
<?php
$flag = "";

    if(isset($_POST["submit"])) {
        include("connect2.php");
        include("pattern.php");
        $name = $_POST["name"];
        $phone = $_POST["phone"];
        $pass = $_POST["pass"];
        $level = $_POST["level"];
        $validName = $validPhone = $validPass = false;
        $sqlCheck = "SELECT * from admin where admin_phone_number = '$phone' or admin_name = '$name'";
        $res = mysqli_query($conn, $sqlCheck);
        if($res) {
            if(checkPhone($phone) && mysqli_num_rows($res) < 1) {
                $validPhone = true;
            } else {
                $flag = "BẠN NHẬP KHÔNG HỢP LỆ!";
            }
        }
        if(checkName($name) && mysqli_num_rows($res) < 1) {
            $validName = true;
        } else {
            $flag = "BẠN NHẬP KHÔNG HỢP LỆ!";
        }

        

        if(checkPass($pass)) {
            $validPass = true;
        } else {
            $flag = "BẠN NHẬP KHÔNG HỢP LỆ!";
        }

        if($validName == true && $validPhone == true && $validPass == true) {
            
            $sql = "INSERT into admin values (NULL, '$name', '$phone', '$pass', '$level')";
            if ($conn->query($sql) === TRUE) {
                $flag = "Thêm tài khoản thành công!";
                
            }
            
        }
    }
?>
    <form autocomplete="off" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post">
        <div>
            Tên ADMIN:
        </div>
        <input type="text" name="name">

        <div>
            Số điện thoại ADMIN:
        </div>
        <input type="text" name="phone">

        <div>
            Mật khẩu ADMIN:
        </div>
        <input type="text" name="pass">

        <div>
            Cấp độ ADMIN:
        </div>
        <input type="radio" name="level" value="1">Super Admin
        <input type="radio" name="level" value="0" checked>Admin
        <br>
        <input type="submit" value="submit" name="submit">
    </form>

    <div style="color: red"><?php echo $flag; ?></div>
    <p style="color: red">-Tên có độ dài từ 3-30 ký tự. <br>
    -Nhập đúng số điện thoại. <br>
    -Tên và số điện thoại phải chưa được sử dụng. <br>
    -Mật khẩu dài từ 6-30 ký tự bao gồm số và chữ cái.
    </p>
</body>
</html>