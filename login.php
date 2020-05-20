<?php
// Start the session
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="login.css">
    <script src="https://kit.fontawesome.com/f1e0b185be.js" crossorigin="anonymous"></script>

</head>
<body>
    <?php
        //sql
        // $servername = "localhost";
        // $username = "root";
        // $password = "";
        // $dbname = "myshop";
        // $conn = new mysqli($servername, $username, $password, $dbname);
        // if (!$conn) {
        //     die("Connection failed: " . mysqli_connect_error());
        // }
        //print
        $display = [
            "phone" => "",
            "pass" => ""
        ];
        //request
        $phoneErr = $passErr = "";
        include('connect.php');
        if($_SERVER["REQUEST_METHOD"] === "POST") {
            //
            $phone = $_POST["phone"];
            $pass = $_POST["pass"];
            //print
            foreach($_POST as $key => $value) {
                if(isset($_POST[$key])) {
                    $display[$key] = htmlspecialchars($value);
                }
            }
            // $servername = "localhost";
            // $username = "root";
            // $password = "";
            // $dbname = "myshop";
            // $conn = new mysqli($servername, $username, $password, $dbname);
            // if (!$conn) {
            //     die("Connection failed: " . mysqli_connect_error());
            // }

            $sql = "SELECT * FROM tbl_account WHERE phone_number = '$phone' AND pass = '$pass'";
            $res = mysqli_query($conn, $sql);
            $data = mysqli_fetch_array($res);
            if(mysqli_num_rows($res) > 0) {
                $_SESSION['info_customer']["phone_number"] = $data["phone_number"];
                $_SESSION['info_customer']["name"] = $data["name"];
                $_SESSION['info_customer']["id_customer"] = $data["id"];
                $_SESSION['info_customer']["level"] = $data["level"];

                header('location:http://localhost/baitapthunhat/home.php');

            } else {
                $passErr = "Tài khoản hoặc mật khẩu không đúng!";
            }
        }   
    ?>

    <div class="container">
        <div class="logo">LOGO</div>
        <p class="login">Đăng nhập</p>
            
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="POST"> 
        <div class="info">
            <i class="fas fa-phone-square-alt"></i>
            <input type="number" placeholder="Số điện thoại" name="phone" value="<?php echo $display["phone"];?>">
        </div>
        <span class="error"><?php echo $phoneErr; ?></span>
        <div class="info">
            <i class="fas fa-unlock-alt"></i>
            <input type="password" placeholder="Password" name="pass" value="<?php echo $display["pass"];?>">
        </div>
        <span class="error"><?php echo $passErr; ?></span>
            <input type="submit" name="" id="btn1" value="Đăng nhập ngay!">
        </form>
        <p class="choice"><span class="choice1">Chưa có tài khoản?</span></p>
        

        <button class="btn2"><a href="sign-up.php">Đăng ký ngay!</a></button>
        <div class="forgot"><a href="#">Quên mật khẩu?</a></div>
    </div>
    <?php
        include("footer.php");
    ?>
</body>
</html>