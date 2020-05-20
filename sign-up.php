<?php
// Start the session
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký</title>
    <link rel="stylesheet" href="signup.css">
    <script src="https://kit.fontawesome.com/f1e0b185be.js" crossorigin="anonymous"></script>
</head>
<body>
<?php
        //Pattern 
        include("pattern.php");
        // function checkPhone($val) {
        //     $pattern = '#^(03|05|07|08|09)[0-9]{8}$#';
        //     if(preg_match($pattern, $val)) {
        //         return true;
        //     } else {
        //         return false;
        //     }
        // }

        // function checkName($val) {
        //     $pattern = '#^.{1,30}$#';
        //     if(preg_match($pattern, $val)) {
        //         return true;
        //     } else {
        //         return false;
        //     }
        // }

        // function checkEmail($val) {
        //     $pattern = '#^[a-zA-Z][a-zA-Z0-9_\.]{2, 32}@[a-zA-Z0-9]{2,10}(\.[a-zA-Z]{2,5}){1,3}$#';
        //     if(preg_match($pattern, $val)) {
        //         return true;
        //     } else {
        //         return false;
        //     }
        // }

        // function checkPass($val) {
        //     $pattern = '#^(?=.*\d)(?=.*([a-z]|[A-Z])).{6,25}$#';
        //     if(preg_match($pattern, $val)) {
        //         return true;
        //     } else {
        //         return false;
        //     }

        // }
    ?>


<?php
        $nameErr = $phoneErr = $passErr = $passErr2 = "";
        // $servername = "localhost";
        // $username = "root";
        // $password = "";
        // $dbname = "myshop";
        $display = [
            'name' => '',
            'phone'=>'',
            'pass' =>'',
            'pass2' =>''       
        ];
        // $conn = new mysqli($servername, $username, $password, $dbname);
        // if (!$conn) {
        //     die("Connection failed: " . mysqli_connect_error());
        // }
        include('connect.php');
        
        if($_SERVER["REQUEST_METHOD"] == "POST") {
            //print input

            foreach($_POST as $key => $value) {
                if(isset($_POST[$key])) {
                    $display[$key] = htmlspecialchars($value);
                }
            }
            //post
            $name = $_POST["name"];
            $phone = $_POST["phone"];
            $pass = $_POST["pass"];
            $pass2 = $_POST["pass2"];
            //flag
            $validName = $validPhone = $validPass = $validPass2 = true;
            // test
            $sqlTest = "SELECT * FROM tbl_account WHERE phone_number = '$phone'";
            $res = mysqli_query($conn, $sqlTest);
            //check
            if(checkName($name)) {
                $nameErr = "";
                $validName = true;
            } else {
                $nameErr = "Tên có độ dài tối đa 30 ký tự!";
                $validName = false;
            }

            if(checkPhone($phone)) {
                if(mysqli_num_rows($res) > 0) {
                    $phoneErr = "Số điện thoại đã tồn tại";
                    $validPhone = false;
                } else {
                    $phoneErr = "";
                    $validPhone = true;
                }

            } else {
                $phoneErr = "Số điện thoại không hợp lệ!";
                $validPhone = false;
            }


            if(checkPass($pass)) {
                $passErr = "";
                $validPass = true;
            } else {
                $passErr = "Mật khẩu có độ dài từ 6-25 ký tự, gồm ít nhất 1 số và 1 chữ cái!";
                $validPass = false;
            }

            if($pass === $pass2) {
                $passErr2 = "";
                $validPass2 = true;
            } else {
                $passErr2 = "Mật khẩu nhập lại không đúng!";
                $validPass2 = false;
            }


            if($validName == true && $validPhone == true && $validPass == true && $validPass2 == true) {
                //Insert
                $sqlIns = "INSERT INTO tbl_account (level, name, phone_number, pass) VALUES (0, '$name', '$phone', '$pass')";
                $ress = mysqli_query($conn, $sqlIns);
                if ($ress === true) {
                    
                    header('location:http://localhost/baitapthunhat/welcome.php');
                } else {
                    echo "Error: " ."<br>" . $conn->error;
                }
                
                
            }


        }

    ?>
    <div class="container">
        <div class="logo">LOGO</div>
        <p class="login">Đăng ký tài khoản</p>


        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="POST"> 
    <!--Tên -->
        <div class="info">
            <i class="fas fa-user"></i>
            <input type="text" placeholder="Họ và tên" name="name" value="<?php echo $display["name"]?>">
        </div>
        <span class="error"><?php echo $nameErr; ?></span>
    <!--Điện thoại -->   
        <div class="info">
            <i class="fas fa-phone-square-alt"></i>
            <input type="number" placeholder="Số điện thoại" name="phone" value="<?php echo $display["phone"]?>">
        </div>
        <span class="error"><?php echo $phoneErr; ?></span>
  
    
    <!--Mật khẩu -->
        <div class="info">
            <i class="fas fa-unlock-alt"></i>
            <input type="password" placeholder="Mật khẩu" name="pass" value="<?php echo $display["pass"]?>">
        </div>
        <span class="error"><?php echo $passErr; ?></span>
    <!--Mật khẩu nhập lại -->
        <div class="info">
            <i class="fas fa-unlock-alt"></i>
            <input type="password" placeholder="Nhập lại mật khẩu" name="pass2" value="<?php echo $display["pass2"]?>">
        </div>
        <span class="error"><?php echo $passErr2; ?></span>

        <input type="submit" name="" id="btn1" value="Đăng ký ngay!">
        </form>
        <p class="choice"><span class="choice1">Đã có tài khoản?</span></p>

        <button class="btn2"><a href="login.php">Đăng nhập ngay!</a></button>

    </div>
</body>
</html>

