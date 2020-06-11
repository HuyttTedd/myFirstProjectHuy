<?php
    session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop Vàng Mã Thêm Địa Chỉ Email</title>
    <link rel="stylesheet" href="addEmail.css">
</head>
<body>
    <?php
    //kiểm tra xem tài khoản có email chưa
        if(isset($_SESSION['info_customer']["phone_number"])) {
            header('location:http://localhost/baitapthunhat/home.php');
        }
        if(!empty($_SESSION["forgotPassword"]["email"])) {
            header('location:http://localhost/baitapthunhat/forgotPassword/sendEmail.php');
        }

        if(empty($_SESSION["forgotPassword"]["phone"])) {
            header('location:http://localhost/baitapthunhat/forgotPassword/forgotPass.php');
        }

    //kiểm tra email hợp lệ



        function checkEmail($val) {
            $pattern = '/^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/';
            if(preg_match($pattern, $val)) {
                return true;
            } else {
                return false;
            }
        }

        $error = $email = "";
        $phone = $_SESSION["forgotPassword"]["phone"];
        if ($_SERVER["REQUEST_METHOD"] === "POST") {
            $email = $_POST["email"];
            trim($email);
            if (checkEmail($email)) {
                $_SESSION["forgotPassword"]["email"] = $email;
                include("connect.php");
            
                $sql = $conn->prepare("UPDATE tbl_account set email = ? where phone_number = ?");
                $sql->bind_param("ss", $email, $phone);
            
                if ($sql->execute() == true) {
                    header('location:http://localhost/baitapthunhat/forgotPassword/sendEmail.php');
                } else {
                    $error = "Có lỗi xảy ra thử lại sau!";
                }
            } else {
                $error = "Email bạn nhập không hợp lệ!";
            }
        }
    ?>

    <div class="container">

    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="POST">
        <div class="item">Nhập email của bạn:</div>
        <div class="item">
        <input type="text" id="input-email" name="email" value="<?php echo $email; ?>">
        </div>
        
        <div class="item">
            <button type="submit" id="btn-submit-email">Xác nhận</button>
        </div>
        <div class="error"><?php echo $error; ?></div>
    </form>
    <!--Hiển thị popup-->
    <button id="display-popup">Xác nhận</button>
    </div>

    <!--POPUP-->
    <div class="popup" id="popup">
        <div class="popup-content">
            <p>Bạn có chắc muốn dùng địa chỉ Email này</p>
            <p id="email-in-popup" style="font-size: 1.2rem;"></p>
            <button id="accept-form">Đồng ý</button>
            <button id="cancel-form">Thay đổi</button>
        </div>
    </div>

    <script>
        var displayPopup = document.getElementById("display-popup");
        var popup = document.getElementById("popup");
        var acceptForm = document.getElementById("accept-form");
        var cancelForm = document.getElementById("cancel-form");

        displayPopup.addEventListener("click", function (e) {
            document.getElementById("popup").style.display = "block";
            var inputEmail = document.getElementById("input-email").value;
            document.getElementById("email-in-popup").innerHTML = "<b>"+inputEmail+"</b>";
          });
        acceptForm.onclick = function() {
            document.getElementById("btn-submit-email").click();
        }
        cancelForm.onclick = function() {
            document.getElementById("popup").style.display = "none";
            
        }

        window.onclick = function(event) {
            if (event.target == popup) {
                popup.style.display = "none";
            }
}
    </script>
    <?php
echo "<pre>";
print_r($_SESSION);
echo "</pre>";
    ?>
</body>
</html>