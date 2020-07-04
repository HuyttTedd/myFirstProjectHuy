<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ảnh nổi bật trang chủ</title>

    <style>
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

.item {
    margin: 2rem 2rem;
}
th, td {
    padding: 1rem;
    border: 1px solid black;
}

body {
    text-align: center;
}
    </style>
</head>
<body>
<?php
        if(!isset($_SESSION["admin_info"]["admin_phone"])) {
            header('location:http://localhost/baitapthunhat/manage/index.php');
        }
        include("headerAdmin.php");
?>
    <?php
    include "connect2.php";
        if ($_SERVER["REQUEST_METHOD"] === "POST") {
            $img = $_FILES["image"];
            $position = $_POST["position"];
            $sql2 = "SELECT * from image_hightlight where position = '$position'";
            $res = mysqli_query($conn, $sql2);
            
            if ($position != "" && mysqli_num_rows($res) == 0) {
                $filename = $img['tmp_name'];
                $client_id='67fd839d20ce847';		// Replace this with your client_id, if you want images to be uploaded under your imgur account
                $handle = fopen($filename, 'r');
                $data = fread($handle, filesize($filename));
                $pvars = array('image' => base64_encode($data));
                $timeout = 30;
                $curl = curl_init();
                curl_setopt($curl, CURLOPT_URL, 'https://api.imgur.com/3/image.json');
                curl_setopt($curl, CURLOPT_TIMEOUT, $timeout);
                curl_setopt($curl, CURLOPT_HTTPHEADER, array('Authorization: Client-ID ' . $client_id));
                curl_setopt($curl, CURLOPT_POST, 1);
                curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
                curl_setopt($curl, CURLOPT_POSTFIELDS, $pvars);
        
                $out = curl_exec($curl);
                curl_close($curl);
                $pms = json_decode($out, true);
                $url=$pms['data']['link'];
                if ($url!='') {
                    echo "<h4 bg-success>Thêm ảnh thành công!</h4>";
                    //    echo "<input type='text' id='image-link' value='".substr($url,8)."'/><button onclick='copyToClipboard()'>Copy link</button><br/><hr/><h5>Preview : </h5>";
                    //    echo "<img id='imgur-image' alt='imgur-image' src='$url'/>";

                    $sql =   "INSERT INTO image_hightlight(link_image_hl, position) values('$url', '$position')";
                    if (mysqli_query($conn, $sql)) {
                        $bbb = "Thêm thành công";
                    }
                } else {
                    echo "<h4 class='bg-danger'>Có lỗi xảy ra</h4>";
                }
            } else {
                echo "Vị trí ảnh đã tồn tại hoặc có lỗi xảy ra!";
            }
        }

    ?>
    <table>
        <tr>
            <th>Ảnh</th>
            <th>Vị trí</th>
        </tr>
    
    <?php
    include "connect2.php";
    $sql = "SELECT * from image_hightlight order by position asc";
    $res = mysqli_query($conn, $sql);
    while($row = mysqli_fetch_array($res)) {
?>
    <tr>
        <td><img src="<?php echo $row["link_image_hl"] ?>" alt="" width="250px" height="150px"></td>
        <td><?php echo $row["position"] ?></td>
        <td><a href="update_position_img_hl.php?ma=<?php echo $row["id_image_hl"] ?>">Sửa vị trí</a></td>
    </tr>
<?php
    }
    ?>
    </table>
    <h1>Thêm ảnh nổi bật</h1>
    <form action="add_img_hl.php" method="POST" enctype="multipart/form-data">
        <div class="item">
            Chọn ảnh:
            <input type="file" name="image">
        </div>
        <div class="item">
            Vị trí của ảnh: 
            <input type="number" name="position">
        </div>
        <div class="item">
        <input type="submit" name="Thêm ảnh">
        </div>
        
    </form>
</body>
</html>