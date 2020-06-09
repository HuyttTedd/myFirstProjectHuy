<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop Vàng Mã Quên Mật Khẩu</title>
    <link rel="stylesheet" href="forgotPass.css">
</head>
<body>
    <?php
        if(isset($_SESSION['info_customer']["phone_number"])) {
            header('location:http://localhost/baitapthunhat/home.php');
        }
        $error = $phone = "";
        if($_SERVER["REQUEST_METHOD"] === "POST") {
            $phone = $_POST["phone"];
            include("connect.php");
            $sql = "SELECT * from tbl_account where phone_number = '$phone'";
            $res = mysqli_query($conn, $sql);
            $row = mysqli_fetch_array($res);
            if(mysqli_num_rows($res) > 0) {
                $_SESSION["forgotPassword"]["phone"] = $row["phone_number"];
                $_SESSION["forgotPassword"]["email"] = $row["email"];
                header('location:http://localhost/baitapthunhat/forgotPassword/addEmail.php');
            } else {
                $error = "Số điện thoại bạn nhập không hợp lệ!";
            }
        }

        
    ?>
    <div class="container">

    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="POST">

        <div class="item">Nhập số điện thoại của bạn:</div>

        <div class="item">
        <input type="number" name="phone" value="<?php echo $phone; ?>">
        </div>
        
        <div class="item">
            <button type="submit">Xác nhận</button>
        </div>
        <div class="error"><?php echo $error; ?></div>
    </form>

    </div>

    <?php
    echo "<pre>";
    print_r($_SESSION);
    echo "</pre>";
    
    ?>
</body>
</html>