<?php
 session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body {
            background: #b3b300;
        }
        .container {
            text-align: center;
            margin-top: 10rem;
            font-size: 1.3rem;
            color: white;
        }
        .container input {
            border-radius: 7px;
            height: 1rem;
            width: 13rem;
            border: none;
            outline: none;
            padding: .5rem;
            margin: .5rem 0;
        }

        button {
            outline: none;
            background: #ffff66;
            border: none;
            padding: .7rem;
            border-radius: 10px;
            cursor: pointer;
        }
        button:hover {
            background: #ffff00;
        }
    </style>
</head>

<body>
<?php
        if(isset($_SESSION["admin_info"]["admin_phone"])) {
            header('location:http://localhost/baitapthunhat/manage/admin.php');
        }
?>
    <?php
    //ĐĂNG NHẬP
    $err = "";
        if($_SERVER["REQUEST_METHOD"] == "POST") {
            include("connect2.php");
            $phone = $_POST["phone"];
            $pass = $_POST["pass"];
            $sql = "SELECT * from admin where admin_phone_number = '$phone' and password = '$pass'";
            $res = mysqli_query($conn, $sql);
            $row = mysqli_fetch_array($res);
            if(mysqli_num_rows($res) == 1) {
                $_SESSION["admin_info"]["admin_name"] = $row["admin_name"]; 
                $_SESSION["admin_info"]["admin_level"] = $row["level"];
                $_SESSION["admin_info"]["admin_phone"] = $row["admin_phone_number"];
                header('location:http://localhost/baitapthunhat/manage/admin.php');
            } else {
                $err = "Tài khoản hoặc mật khẩu không chính xác!";
            }
        }
    ?>

    <div class="container">
        <h1>ĐĂNG NHẬP</h1>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" autocomplete="off" method="POST">
            <div>Số điện thoại ADMIN:</div>
            <input type="text" name="phone">
            <div>Mật khẩu:</div>
            <input type="password" name="pass">
            <div style="color: red"><?php echo $err; ?></div>
            <button>Đăng nhập</button>
        </form>
    </div>
</body>
</html>