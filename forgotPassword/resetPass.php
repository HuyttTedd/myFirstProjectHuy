<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt lại mật khẩu</title>
    <style>
        form .item {
            margin: 1rem;
        }
    </style>
</head>
<body>
<?php
//kiểm tra nếu nhập code mới truy cập đc
if (empty($_SESSION["forgotPassword"]["valid_code"])) {
    header('location:http://localhost/baitapthunhat/home.php');
}
//check pass
$error1 = $error2 = "";
function checkPass($val) {
    $pattern = '#^(?=.*\d)(?=.*([a-z]|[A-Z])).{6,25}$#';
    if(preg_match($pattern, $val)) {
        return true;
    } else {
        return false;
    }

}

//check hợp lệ
$phone = $_SESSION["forgotPassword"]["phone"];
    if(isset($_POST["submit"])) {
        $pass1 = $_POST["password1"];
        $pass2 = $_POST["password2"];
        if(!checkPass($pass1)) {
            $error1 = "Mật khẩu phải chứa ít nhất 1 số và 1 chữ cái!";
        } 
        if($pass1 != $pass2) {
            $error2 = "Mật khẩu không trùng khớp";
        }
        if(checkPass($pass1) && $pass1 == $pass2) {
            include("connect.php");
            
            $sql = $conn->prepare("UPDATE tbl_account set pass = ? where phone_number = ?");
            $sql->bind_param("ss", $pass1, $phone);
            
            if($sql->execute() == true) {
                session_destroy();
                mysqli_close($conn);
                header('location:http://localhost/baitapthunhat/forgotPassword/changedPass.php');
            } else {
                $error2 = "Có lỗi xảy ra";
            }
           
        }
    }
?>


    <form autocomplete="off" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
        <div class="item">
            <p>Nhập mật khẩu mới của bạn:</p>
            <input type="password" name="password1">
            <span><?php echo $error1; ?></span>
        </div>
        <div class="item">
            <p>Nhập lại mật khẩu:</p>
            <input type="password" name="password2">
            <span><?php echo $error2; ?></span>
        </div>
        <div class="item">
            <input type="submit" id="submit-form" name="submit" value="Xác nhận">
        </div>

    </form>

    
    </div>

    <!--POPUP-->

    <?php
        echo "<pre>";
        print_r($_SESSION);
        echo "</pre>";
    ?>

</body>
</html>