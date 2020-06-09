<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop Vàng Mã Gửi Email Xác Nhận</title>
    <link rel="stylesheet" href="sendEmail.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>


<body>
    <?php
if (isset($_SESSION['info_customer']["phone_number"])) {
    header('location:http://localhost/baitapthunhat/home.php');
}
if (empty($_SESSION["forgotPassword"]["email"])) {
    header('location:http://localhost/baitapthunhat/forgotPassword/addEmail.php');
}
if (empty($_SESSION["forgotPassword"]["phone"])) {
    header('location:http://localhost/baitapthunhat/forgotPassword/forgotPass.php');
}
if (!empty($_SESSION["forgotPassword"]["valid_code"])) {
    header('location:http://localhost/baitapthunhat/forgotPassword/resetPass.php');
}

$email = $_SESSION["forgotPassword"]["email"];
$error = "";

// Xử lý mã xác nhận
if(isset($_REQUEST["submit_code"])) {
    $code = $_REQUEST["code"];
    if($code == $_SESSION["forgotPassword"]["code"]) {
        $_SESSION["forgotPassword"]["valid_code"] = "Đã nhập!";
        header('location:http://localhost/baitapthunhat/forgotPassword/resetPass.php');
    } else {
        $error = "Bạn nhập sai mã!";
    }

}
?>


    <!--content-->
    <p>Bấm vào đây để gửi mã xác nhận tới email <b><?php echo $email; ?></b> đặt lại mật khẩu: </p>
<button onclick="countdown()" id="btn">
    <span id="send">Gửi mã</span>
    <span id="countdown"></span>
</button>

<!--Form gọi ajax để gửi email đến khách hàng-->
<form method="post" id="form-ajax">
	<input type="textbox" id="txt" name="txt" value="<?php echo $email; ?>"/>
	<input id="submit" type="button" name="submit" value="OKKKKKKKKK" onclick="getAudio()"/>
</form>

    <p id="confirm"></p>
    <!--Nhập mã xác nhận-->
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" id="verify" method="POST">
        <p>Nhập mã xác nhận được gửi đến Email để đặt lại mật khẩu của bạn:</p>
        <input type="text" name="code">
        <input type="submit" name="submit_code" value="Xác nhận">
        <p><?php echo $error; ?></p>
    </form>


    <script>

function getAudio(){
	var txt=jQuery('#txt').val()
	jQuery.ajax({
		url:'mail.php',
		type:'post',
		data:'txt='+txt,
		success:function(result){
			jQuery('#confirm').html(result);
		}
	});
}

var btn = document.getElementById("btn");
btn.addEventListener("click", function(){
    document.getElementById("submit").click();
    document.getElementById("verify").style.display = 'block';
}, false);




        function countdown() {
            var target_sec = new Date().getTime() + (1000*6);
            document.getElementById("btn").disabled = true;
            document.getElementById("countdown").style.display = 'inline';
            var x = setInterval(function () {
                var current_sec = new Date().getTime();
                var sec_left = (target_sec - current_sec)/1000;
                document.getElementById("countdown").innerHTML ="(" + Math.ceil(sec_left) + ")";
                if(sec_left < 0) {
                clearInterval(x);
                document.getElementById("countdown").innerHTML = '';
                document.getElementById("btn").disabled = false;
                document.getElementById("send").innerHTML = 'Gửi lại';
            }
            }, 1000);
        }
    </script>
<?php
echo "<pre>";
print_r($_SESSION);
echo "</pre>";
// session_destroy();
?>

</body>
</html>