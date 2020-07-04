<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="info.css">
    <script src="https://kit.fontawesome.com/63a257a1cd.js" crossorigin="anonymous"></script>
</head>
<body>
<?php
if (!isset($_SESSION["total"]) || empty($_SESSION["id_product"])) {
    header('location:http://localhost/baitapthunhat/pay.php');
}
include "header.php";
?>
    <?php

// $display = [
//     'address' => '',
//     'message' => '',
// ];

// $name = "";
// if(isset($_SESSION["name"])) {
//     $name = $_SESSION["name"];
// }

function checkPhone($val)
{
    $pattern = '/^(03|05|07|08|09)[0-9]{8}$/';
    if (preg_match($pattern, $val)) {
        return true;
    } else {
        return false;
    }
}


function checkName($val)
{
    $pattern = '#^.{1,40}$#';
    if (preg_match($pattern, $val)) {
        return true;
    } else {
        return false;
    }
}

function checkAddress($val)
{
    $pattern = '#^.{6,30}$#';
    if (preg_match($pattern, $val)) {
        return true;
    } else {
        return false;
    }
}

$phoneErr = $addressErr = $nameErr = "";
$phoneValid = $addValid = $nameValid = false;
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $phone = $_POST["phone"];
    $name = $_POST["name"];
    $addr = $_POST["address"];
    $message = $_POST["message"];
    // foreach ($_POST as $key => $value) {
    //     if (isset($_POST[$key])) {
    //         $display[$key] = htmlspecialchars($value);
    //     }
    // }

    if (checkPhone($phone)) {
        //header('location:http://localhost/baitapthunhat/bill.php');
        $phoneValid = true;
    } else {
        $phoneErr = "Số điện thoại không hợp lệ!";
    }

    if (checkAddress($addr)) {

        $addValid = true;
    } else {
        $addressErr = "Địa chỉ không hợp lệ!";
    }

    if (checkName($name)) {

        $nameValid = true;
    } else {
        $nameErr = "Tên không hợp lệ!";
    }

    if ($addValid == true && $phoneValid == true && $nameValid == true) {
        
        
        $_SESSION["create_bill"]["phone_number"] = $phone;
        $_SESSION["create_bill"]["name"] = $name;
        $_SESSION["create_bill"]["address"] = $addr;
        $_SESSION["create_bill"]["message"] = $message;
        $_SESSION["create_bill"]["confirm"] = 1;
        $_SESSION["info_customer"]["sent"] = true;
        header('location:http://localhost/baitapthunhat/profile.php');
    }

}

?>

    <div class="container-info">

        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
        <div class="item">
            <div>Tên người nhận:</div>
            <input type="text" name="name" autocomplete="off" value="<?php
if (isset($_POST["name"])) {
    echo $name;
} else {
    echo $_SESSION["info_customer"]["name"];
}
?>">
            <span class="err"><?php echo $nameErr; ?></span>
        </div>

        <div class="item">
            <div>Số điện thoại:</div>
            <input type="text" name="phone" autocomplete="off" value="<?php
if (isset($_POST["phone"])) {
    echo $_POST["phone"];
} else {
    echo $_SESSION["info_customer"]["phone_number"];
}
?>">
            <span class="err"><?php echo $phoneErr; ?></span>
        </div>

        <div class="item">
            <div>Địa chỉ giao hàng:</div>
            <textarea type="text" rows="4" cols="50" name="address"><?php if(isset($_POST["address"])) echo $_POST["address"] ?></textarea>
            <span class="err"><?php echo $addressErr; ?></span>
        </div>

        <div class="item">
            <div>Lời nhắn: </div>
            <textarea name="message" rows="4" cols="50" placeholder="Ghi chú trên hóa đơn, người gửi,...">

            </textarea>
        </div>

        <div class="item">
            <p>Chi tiết sản phẩm: </p>
        </div>

        <?php
include "connect.php";
$pay = array_column($_SESSION["id_product"], 'id_product');
foreach ($pay as $key => $value) {
    $sql = "SELECT * FROM products where id_product = $value";
    $res = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_array($res)) {
        ?>
            <div class="detailed-item">
                <img src="<?php echo $row["product_image"] ?>" alt="">
                <div class="price-and-quantity">
                    <p><?php echo $row["name_product"] ?></p>
                    <p>Đơn giá: <?php echo number_format($row["price"]); ?> X <?php echo $_SESSION["display_quantity"][$row["id_product"]]["quantity"]; ?></p>
            </div>
        </div>
        <?php
}
}
// echo "<pre>";
//     print_r($_SESSION);
// echo "</pre>";
//session_destroy();


?>
        <div class="item">
            <div>Tổng tiền: <?php echo number_format($_SESSION["total"]); ?> VNĐ</div>

        </div>

        <input type="submit" value="MUA HÀNG" id="submit-bill">
        </form>
    </div>

    <?php
    include("footer.php");
   
?>
</body>
</html>