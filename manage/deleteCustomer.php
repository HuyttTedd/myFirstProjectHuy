<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Khóa tài khoản khách hàng Shop Vàng Mã</title>
</head>
<style>
    body {
        background-color: #ffffcc;
    }
    h1 {
        text-align: center;
        color: red;
    }

    .container {
        background-color: #cccc00;
        text-align: center;
        max-width: 400px;
        margin: 0 auto;
        padding: 1rem;
        border-radius: 10px;
    }

    .item {
        margin: 1rem auto;
    }

    #phone {
        padding: 8px;
        border-radius: 5px;
        outline: none;
        border: none;
        text-align: left !important;
    }

    button {
        background-color: wheat;
        padding: 0.8rem 1.3rem;
        border: none;
        outline: none;
        cursor: pointer;
        border-radius: 8px;
    }
    
    button:hover {
        background-color: #999900;
        color: white;
    }

    p {
        color: red;
    }

    /* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/* Firefox */
input[type=number] {
  -moz-appearance: textfield;
}
</style>
<body>
<?php
    if(!isset($_SESSION["admin_info"]["admin_phone"])) {
        header('location:http://localhost/baitapthunhat/manage/index.php');
    }
?>

<?php
include("headerAdmin.php");
    $flag = "";
    if (isset($_POST["phone"])) {
        $phone = $_POST["phone"];
        include("connect2.php");
        $sql1 = "SELECT *from tbl_account where phone_number = '$phone'";
        $res1 = mysqli_query($conn, $sql1);

        if (mysqli_num_rows($res1) > 0) {
            $sql = "UPDATE tbl_account set status=4 where phone_number = '$phone'";
            $res = mysqli_query($conn, $sql);
            if($res) {
                $flag = "Khóa tài khoản thành công!";
            } else {
                $flag = "Có lỗi xảy ra, thử lại sau!";
            }
        } else {
            $flag = "Số điện thoại bạn nhập không tồn tại!";
        }
    }
?>


<h1>Khóa tài khoản khách hàng!</h1>
<div class="container">
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="POST" autocomplete="off" onSubmit="return confirm('Bạn có chắc muốn Khóa tài khoản?') ">
        <div class="item">Số điện thoại khách hàng muốn khóa: </div>
        <input type="number" name="phone" class="item" id="phone" 
        value="<?php
            if(isset($_POST["phone"])) {
                echo $_POST["phone"];
            }
        ?>"
        >
        <div>
            <button type="submit" class="item">Khóa tài khoản</button>
            <p><?php echo $flag; ?></p>
        </div>
    </form>
</div>
</body>
</html>