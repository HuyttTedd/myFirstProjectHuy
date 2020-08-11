<?php
 session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sửa sản phẩm</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
<?php
        if(!isset($_SESSION["admin_info"]["admin_phone"])) {
            header('location:http://localhost/baitapthunhat/manage/index.php');
        }
        include("headerAdmin.php");
?>


    <?php
    $flag = "";
    $product_id = "";
        if(isset($_REQUEST["product_id"])) {
            $product_id = $_REQUEST["product_id"];
        }    

        if($_SERVER["REQUEST_METHOD"] === "POST") {
            $id = $_POST["id"];
            $name = $_POST["name"];
            $price = $_POST["price"];
            $img = $_FILES["img"];
            $quantity = $_POST["quantity"];
            $descript = $_POST["descript"];
            
            if($id == "") {
                $flag = "ID để trống";
            } else {
                include("connect2.php");
                $sql = "SELECT * from products where id_product = '$id'";
                $res = mysqli_query($conn, $sql);
                if(mysqli_num_rows($res) < 1) {
                    $flag = "ID sản phẩm không tồn tại!";
                } else {
                    $row = mysqli_fetch_array($res);
                    if(empty($quantity)) {
                        $quantity = $row["quantity"];
                    }
                     if(empty($descript)) {
                        $descript = $row["description"];
                    }
                    if (empty($name)) {
                        $name = $row["name_product"];
                    } 
                     if(empty($price)) {
                        $price = $row["price"];
                    }
                     if(empty($img)) {
                        $img = $row["product_image"];
                    } else {
                        $img = $_FILES["img"];
                        $image_info = getimagesize($img["tmp_name"]);
                        if($image_info[0] != $image_info[1]) {
                            $flag = false;
                            die("Ảnh phải hình vuông");
                        } else {
                            
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
  curl_close ($curl);
  $pms = json_decode($out,true);
  $url=$pms['data']['link'];
  if($url!=''){
   echo "<h4 bg-success>Sửa sản phẩm thành công!</h4>";
//    echo "<input type='text' id='image-link' value='".substr($url,8)."'/><button onclick='copyToClipboard()'>Copy link</button><br/><hr/><h5>Preview : </h5>";
//    echo "<img id='imgur-image' alt='imgur-image' src='$url'/>";
   $aaa = "https://".substr($url,8);
   
   $bbb = "";
   $sql =   "UPDATE products SET name_product='$name',
   price='$price', product_image='$url', quantity='$quantity', description='$descript' WHERE id_product='$id'";
    if(mysqli_query($conn, $sql)) {
        $bbb = "Sửa thành công";
    }
  }
  else{
   echo "<h4 class='bg-danger'>Có lỗi</h4>";
    
  } 
                        }
                    }
                     
                }

        }
    }
    ?>
<div style="margin-left: 100px;">
    <h1>Sửa sản phẩm <span style="color: red"><?php echo $product_id;?></span></h1>
    <h2><?php echo $flag; ?></h2>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="POST" enctype="multipart/form-data">
        
        <input type="hidden" name="id" value="<?php echo $product_id;?>">
        <div>Sửa tên sản phẩm:</div>
        <input type="text" name="name">
        <div>Sửa giá sản phẩm:</div>
        <input type="text" name="price">
        <div>Sửa ảnh sản phẩm:</div>
        <input type="file" name="img" id="image">
        <div>Sửa số lượng sản phẩm:</div>
        <input type="number" name="quantity">
        <div>Sửa mô tả sản phẩm:</div>
        <textarea name="descript" id="" cols="100" rows="10"></textarea>
        <div style="color: red">Chú ý: Mục nào không sửa thì để trống!</div>
        <input type="submit" value="Xác nhận" id="insert">
        
    </form>
</div>
<script>
        $(document).ready(function(){  
      $('#insert').click(function(){  
           var image_name = $('#image').val();  
           if(image_name == '')  
           {  
                alert("Bạn chưa chọn ảnh!");  
                return false;  
           }  
           else  
           {  
                var extension = $('#image').val().split('.').pop().toLowerCase();  
                if(jQuery.inArray(extension, ['gif','png','jpg','jpeg']) == -1)  
                {  
                     alert('File ảnh không hợp lệ!');  
                     $('#image').val('');  
                     return false;  
                }  
           }      
           

        });
    
      });  
   
    </script>
</body>
</html>