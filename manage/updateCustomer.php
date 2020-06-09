<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
    body {
        background-color: #ffffcc;
    }
    h1 {
        text-align: center;
        color: red;
    }
</style>
<body>
    <?php
            if(!isset($_SESSION["admin_info"]["admin_phone"])) {
                header('location:http://localhost/baitapthunhat/manage/index.php');
            }
    ?>

    <h1>Sửa thông tin khách hàng!</h1>
    

</body>
</html>