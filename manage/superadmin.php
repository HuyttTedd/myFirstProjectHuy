<?php
 session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        table, th, td {
        border: 1px solid black;
        padding: 0px;
}
th, td {
    padding: 1rem;
}
        table {
        border-spacing: 0px;
}
    </style>
</head>
<body>
<?php
        if(!isset($_SESSION["admin_info"]["admin_phone"])) {
            header('location:http://localhost/baitapthunhat/manage/index.php');
        }
?>
    <div>
        <a href="addAdmin.php">Thêm ADMIN</a>
    </div>
    <div>
        <a href="admin.php">Trang chủ</a>
    </div>
    <table>
        <tr>
            <td>Tên admin</td>
            <td>Số điện thoại</td>
            <td>Level</td>
            <td colspan="2"></td>  
        </tr>

        <?php
            include("connect2.php");
            $phone = $_SESSION["admin_info"]["admin_phone"];
            $sqlSelect = "SELECT * from admin where admin_phone_number != '$phone'";
            $res = mysqli_query($conn, $sqlSelect);
            while($row = mysqli_fetch_array($res)) {
        ?>
        <tr>
            <td><?php echo $row["admin_name"] ?></td>
            <td><?php echo $row["admin_phone_number"]; ?></td>
            <td>
                <?php 
                    if($row["level"] == 1) {
                        echo "SUPER ADMIN";
                    } else if($row["level"] == 0) {
                        echo "ADMIN";
                    }
                ?>
            </td>
            <td>
                <a href="deleteAdmin.php?phone=<?php echo $row["admin_phone_number"]; ?>">Xóa</a>
            </td> 
            <td>
                <a href="updateAdmin.php?phone=<?php echo $row["admin_phone_number"]; ?>">Sửa</a>
            </td>       
        </tr>

        <?php
            }
        ?>

        
    </table>
</body>
</html> 