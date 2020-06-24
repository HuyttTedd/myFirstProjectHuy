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

    <style>
        .item {
            margin-top: 1.3rem;
            
        }

        body {
            text-align: center;
        }
    </style>
</head>
<body style="background: #b3b300">
    <div>
        <a style="text-decoration: none; color: #cc0000; " href="admin.php">Trở về trang chủ</a>
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
        $checkPhone = $conn->prepare("SELECT * from admin where admin_phone_number = ?");
        $checkPhone->bind_param('s', $phone);
        $checkPhone->execute();
        $res = $checkPhone->get_result();

        $checkName = $conn->prepare("SELECT * from admin where admin_name = ?");
        $checkName->bind_param('s', $name);
        $checkName->execute();
        $res2 = $checkName->get_result();
        
            if(checkPhone($phone) && $res->num_rows < 1) {
                $validPhone = true;
            } else {
                $flag = "Số điện thoại không hợp lệ hoặc bị trùng!";
            }
        
        if(checkName($name) && $res2->num_rows < 1) {
            $validName = true;
        } else {
            $flag = "Tên không hợp lệ hoặc bị trùng!";
        }


        if(checkPass($pass)) {
            $validPass = true;
        } else {
            $flag = "Bạn hãy chọn mật khẩu khác!";
        }
////////////////////////////////////////////////////////////////////////////////
        if($validName == true && $validPhone == true && $validPass == true) {
            
            $sql = $conn->prepare("INSERT into admin values (NULL, ?, ?, ?, ?)");
            $sql->bind_param('ssss', $name, $phone, $pass, $level);
            
            if ($sql->execute()) {
                $flag = "Thêm tài khoản thành công!";
                
            }
            
        }
    }
?>
    <form autocomplete="off" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post">
        <div class="item">
            Tên ADMIN:
        </div>
        <input type="text" name="name" value="<?php if(isset($_POST["name"])) { echo $_POST["name"]; }  ?>">

        <div class="item">
            Số điện thoại ADMIN:
        </div>
        <input type="text" name="phone" value="<?php if(isset($_POST["name"])) { echo $_POST["phone"]; }  ?>">
        
        <div class="item">
            Mật khẩu ADMIN:
        </div>
        <input type="text" name="pass">
        <br>
        <div class="item">
            Cấp độ ADMIN:
        </div>
        <input type="radio" name="level" value="1">Super Admin
        <input type="radio" name="level" value="0" checked>Admin
        <br><br>
        <input type="submit" value="Xác nhận thêm" name="submit">
    </form>

    <div style="color: #cc0000"><?php echo $flag; ?></div>
    <p style="color: #cc0000">-Tên có độ dài từ 3-30 ký tự. <br>
    -Nhập đúng số điện thoại. <br>
    -Tên và số điện thoại phải chưa được sử dụng. <br>
    -Mật khẩu dài từ 6-30 ký tự bao gồm số và chữ cái.
    </p>
</body>
</html>