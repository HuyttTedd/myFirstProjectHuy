<?php
    session_start();
?>
<?php
        if(!isset($_SESSION["admin_info"]["admin_phone"])) {
            header('location:http://localhost/baitapthunhat/manage/index.php');
        }
        include("headerAdmin.php");
?>

<?php
    if(isset($_REQUEST["ma"])) {
        $ma = $_REQUEST["ma"];
        echo "Sửa vị trí ảnh có mã = $ma";
?>
    <form action="update_position_img_hl.php" method="POST">
        <input type="hidden" value="<?php echo $ma ?>" name="ma">
        Vị trí mới: <input type="number" name="position">
        <input type="submit" name="Xác nhận">
    </form>
<?php
    }
    include "connect2.php";
    if(isset($_POST["position"])) {
        $a = $_POST["position"];
        $ma = $_POST["ma"];
        $sql = "SELECT * from image_hightlight where position = '$a'";
        $res=mysqli_query($conn, $sql);
        if(mysqli_num_rows($res) < 1) {
            $sql = "UPDATE image_hightlight set position = '$a' where id_image_hl = '$ma'";
            if(mysqli_query($conn, $sql)) {
                echo "Sửa vị trí thành công!";
            } else {
                echo  "Có lỗi xảy ra!";
            }
        } else {
            echo "Vị trí đã tồn tại!";
        }
    }
?>
