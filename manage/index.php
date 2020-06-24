<?php
 session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập ADMIN Shop Vàng Mã</title>
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
            
            $sql = $conn->prepare("SELECT * from admin where admin_phone_number = ? and password = ?");
            $sql->bind_param('ss', $phone, $pass);
            if($sql->execute()){
                $res = $sql->get_result();
                if($res->num_rows == 1) {
                    $row = $res->fetch_array();
                    $_SESSION["admin_info"]["admin_name"] = $row["admin_name"]; 
                    $_SESSION["admin_info"]["admin_level"] = $row["level"];
                    $_SESSION["admin_info"]["admin_phone"] = $row["admin_phone_number"];
                    header('location:http://localhost/baitapthunhat/manage/admin.php');
                } else {
                    $err = "Tài khoản hoặc mật khẩu không chính xác!";
                }
            }

             
        }
    ?>

    <div class="container">
        <h1>ĐĂNG NHẬP</h1>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>"  method="POST">
            <div>Số điện thoại ADMIN:</div>
            <input type="text" name="phone" value="<?php if(isset($_POST["phone"])) { echo $_POST["phone"]; }  ?>">
            <div>Mật khẩu:</div>
            <input type="password" name="pass" value="<?php if(isset($_POST["pass"])) { echo $_POST["pass"]; }  ?>">
            <div style="color: #cc0000"><?php echo $err; ?></div>
            <button>Đăng nhập</button>
        </form>
    </div>

    <?php
       // print_r($_SESSION);
    ?>
</body>
</html>