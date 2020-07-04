<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="manageBills.css">
    <title>Quản lý đơn hàng(ADMIN)</title>
</head>
<body>
<?php
if (!isset($_SESSION["admin_info"]["admin_phone"])) {
    header('location:http://localhost/baitapthunhat/manage/index.php');
}
$err = "";
?>

<?php
//Chưa xử lý: 0
//Đang giao: 1
//Đã xử lý: 2
//Đã hủy: 3
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Đang giao: 1
//jjjjjjjjjj
//include "connect2.php";
// if(isset($_SESSION["statistic"])) {
//     foreach($_SESSION["statistic"] as $key => $value) {
//     $sqlProd = "SELECT quantity from products where id_product = '$key'";
//     $res = mysqli_query($conn, $sqlProd);
//     $row = mysqli_fetch_array($res);
//     $_SESSION["satatistic"][$key]["origin"] = $row["quantity"];
//     }
// }
//$sqlProd = "SELECT quantity from products where "

if (isset($_POST["submitOrder"])) {
    $submitOrder = $_POST["submitOrder"];
    include "connect2.php";
    $sqlTestStatus = "SELECT status from bill where bill_id='$submitOrder'";
    $resTest = mysqli_query($conn, $sqlTestStatus);
    $rowTest = mysqli_fetch_array($resTest);
    if ($rowTest["status"] == 0) {
        $sqlSubmit = "UPDATE bill SET status=1 where bill_id='$submitOrder' and status = 0";
        foreach ($_SESSION["statistic"][$submitOrder] as $key => $value) {
            $resetQuan = $value["rest"];
            $sqlResetQuantity = "UPDATE products set quantity = '$resetQuan' where id_product = '$key'";
            mysqli_query($conn, $sqlResetQuantity);
        }

        //$sqlUpdateQuantity = "UPDATE products set quantity = "
        mysqli_query($conn, $sqlSubmit);
        mysqli_close($conn);
    } else {
        $err = "Có lỗi xảy ra hoặc đơn hàng này đã được Admin khác xử lý!";
    }
}

//Đã xử lý: 2
if (isset($_POST["completeOrder"])) {

    $completeOrder = $_POST["completeOrder"];
    include "connect2.php";
    $sqlTestStatus = "SELECT status from bill where bill_id='$completeOrder'";
    $resTest = mysqli_query($conn, $sqlTestStatus);
    $rowTest = mysqli_fetch_array($resTest);
    if ($rowTest["status"] == 1) {
        $sqlComplete = "UPDATE bill SET status=2 where bill_id='$completeOrder' and status = 1";
        foreach($_SESSION["statistic2"][$completeOrder] as $key => $value) {
            $new_quan = 0;
            $sqlSoldOut = "SELECT sold_out from products where id_product = '$key'";
            $res = mysqli_query($conn, $sqlSoldOut);
            $row = mysqli_fetch_array($res);
            $new_quan = intval($row["sold_out"]) + intval($value["buy"]);
            $sqlSoldOut2 = "UPDATE products set sold_out='$new_quan' where id_product='$key'";
            mysqli_query($conn, $sqlSoldOut2);
        }
        //$sqlSoldOut = "SELECT sold_out from products where "
        //$sqlSoldOut = 
        mysqli_query($conn, $sqlComplete);
        mysqli_close($conn);
    } else {
        $err = "Có lỗi xảy ra hoặc đơn hàng này đã được Admin khác xử lý!";
    }
}
//Đã hủy: 3
if (isset($_POST["cancelOrder"])) {
    $cancelOrder = $_POST["cancelOrder"];
    include "connect2.php";
    $sqlTestStatus = "SELECT status from bill where bill_id='$cancelOrder'";
    $resTest = mysqli_query($conn, $sqlTestStatus);
    $rowTest = mysqli_fetch_array($resTest);
    if ($rowTest["status"] == 0) {
        $sqlCancel = "UPDATE bill SET status=3 where bill_id='$cancelOrder' and status = 0";
        mysqli_query($conn, $sqlCancel);
        mysqli_close($conn);
    } else {
        $err = "Có lỗi xảy ra hoặc đơn hàng này đã được Admin khác xử lý!";
    }
}

if (isset($_POST["cancelOrder1"])) {
    $cancelOrder1 = $_POST["cancelOrder1"];
    include "connect2.php";

    $sqlTestStatus = "SELECT status from bill where bill_id='$cancelOrder1'";
    $resTest = mysqli_query($conn, $sqlTestStatus);
    $rowTest = mysqli_fetch_array($resTest);
    if ($rowTest["status"] == 1) {
        $sqlCancel1 = "UPDATE bill SET status=3 where bill_id='$cancelOrder1' and status = 1";
        mysqli_query($conn, $sqlCancel1);

        foreach ($_SESSION["statistic2"][$cancelOrder1] as $key => $value) {
            $originalQuan = $value["origin"];
            $sqlOriginQuantity = "UPDATE products set quantity = '$originalQuan' where id_product = '$key'";
            mysqli_query($conn, $sqlOriginQuantity);
        }
        mysqli_close($conn);
    }else {
        $err = "Có lỗi xảy ra hoặc đơn hàng này đã được Admin khác xử lý!";
    }
}

include("headerAdmin.php");
?>
    <h1 class="title">Quản lý đơn hàng!</h1>
    <div style="color: red;">
        <?php
echo $err;
?>
    </div>
    <div class="select-status">
    <div class="status">
        <button onclick="status(0)">Đơn hàng chưa xử lý</button>
    </div>
    <div class="status">
        <button onclick="status(1)">Đơn hàng đang giao</button>
    </div>
    <div class="status">
        <button onclick="status(2)">Đơn hàng đã xử lý</button>
    </div>
    <div class="status">
        <button onclick="status(3)">Đơn hàng đã hủy</button>
    </div>
    </div>

    <div id="list">

    </div>

<?php
// include("connect2.php");

// $sql = 'SELECT * FROM bill';
// $res = mysqli_query($conn, $sql);
// while($row = mysqli_fetch_array($res)) {
?>

<?php
//}
//session_destroy();
// echo "<pre>";
// print_r($_SESSION);
// echo "</pre>";
?>

<script>
    function status(val) {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if(this.readyState == 4 && this.status == 200) {
                document.getElementById("list").innerHTML = this.responseText;
            }
        }

        xmlhttp.open("GET", "getstatus.php?val="+val, true);
        xmlhttp.send();
    }
</script>

</body>
</html>