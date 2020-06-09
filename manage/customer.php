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
<body>
<?php
        if(!isset($_SESSION["admin_info"]["admin_phone"])) {
            header('location:http://localhost/baitapthunhat/manage/index.php');
        }
?>

<?php
    include("connect2.php");
    $sql = "SELECT * from tbl_account";
    $res = mysqli_query($conn, $sql);
    $row = mysqli_fetch_array($res);

    while($row = mysqli_fetch_array($res)) {
?>
    

<?php
    }
?>
</body>
</html> 