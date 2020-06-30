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
        if(!isset($_SESSION["admin_info"]["admin_phone"])) {
            header('location:http://localhost/baitapthunhat/manage/index.php');
        }
?>

<?php
    //Chưa xử lý: 0
    //Đang giao: 1
    //Đã xử lý: 2
    //Đã hủy: 3
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //Đang giao: 1
    
    if(isset($_POST["submitOrder"])) {
        $submitOrder = $_POST["submitOrder"];
        include("connect2.php");
        $sqlSubmit = "UPDATE bill SET status=1 where bill_id='$submitOrder' and status = 0";
        mysqli_query($conn, $sqlSubmit);
        mysqli_close($conn);
    }

    //Đã xử lý: 2
    if(isset($_POST["completeOrder"])) {
        $completeOrder = $_POST["completeOrder"];
        include("connect2.php");
        $sqlComplete = "UPDATE bill SET status=2 where bill_id='$completeOrder' and status = 1";
        mysqli_query($conn, $sqlComplete);
        mysqli_close($conn);
    }
    //Đã hủy: 3
    if(isset($_POST["cancelOrder"])) {
        $cancelOrder = $_POST["cancelOrder"];
        include("connect2.php");
        $sqlCancel = "UPDATE bill SET status=3 where bill_id='$cancelOrder' and status = 0";
        mysqli_query($conn, $sqlCancel);
        mysqli_close($conn);
    }

    if(isset($_POST["cancelOrder1"])) {
        $cancelOrder1 = $_POST["cancelOrder"];
        include("connect2.php");
        $sqlCancel1 = "UPDATE bill SET status=3 where bill_id='$cancelOrder1' and status = 1";
        mysqli_query($conn, $sqlCancel1);
        mysqli_close($conn);
    }





?>
    <h1 class="title">Quản lý đơn hàng!</h1>
    <div>
        <a style="text-decoration: none; color: red" href="admin.php">Trang chủ</a>
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

    // echo "<pre>";
    //     print_r($_SESSION);
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