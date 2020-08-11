<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>Thêm sản phẩm</title>
    <style>
        input {
            margin-bottom: 1rem;
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

    include("connect2.php");
    $confirm = "";
    if($_SERVER["REQUEST_METHOD"] === "POST") {
        $flag = false;
        $errors = [];
        $name = $_POST["name"];
        $price = $_POST["price"];
        $quantity = $_POST["quantity"];
        $img = $_FILES["image1"]["name"];
        // print_r($_FILES["image1"]);
        //test
        $image_info = getimagesize($_FILES["image1"]["tmp_name"]);

        if($image_info[0] != $image_info[1]) {
            $flag = false;
            echo "Ảnh phải hình vuông!";
        } else {
            $flag = true;
        }
        
        //
        //$file_size = $_FILES['image1']['size'];
        $type = $_POST["type"];
        $desc = $_POST["description"];

        //$a = base64_encode($file);
        //if($file_size > 309715){
        //    $errors[1]='Kích cỡ file nên nhỏ hơn chút tầm 300KB!';
        // }
        if($name == "" || $price == "" || $quantity == "" || $type == "" || $desc == "")  {
            $flag = false;
            echo "Không phần nào được để trống!";
        }

        if($flag == true){
//             $sql = "INSERT INTO products (name_product, price, product_image, quantity, description, id_type_product)
// VALUES ('$name', '$price', '$img', '$quantity', '$desc', '$type')";

//         if ($conn->query($sql) === TRUE) {
//             echo "Thêm thành công";
    
//         } else {
//             echo "Có lỗi xảy ra, kiểm tra lại!";
            
//         }

    $img2 = $_FILES["image1"];
    $filename = $img2['tmp_name'];
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
   echo "<h4 bg-success>Thêm sản phẩm thành công!</h4>";
//    echo "<input type='text' id='image-link' value='".substr($url,8)."'/><button onclick='copyToClipboard()'>Copy link</button><br/><hr/><h5>Preview : </h5>";
//    echo "<img id='imgur-image' alt='imgur-image' src='$url'/>";
   $aaa = "https://".substr($url,8);
   
   $bbb = "";
   $sql =   "INSERT INTO products (name_product, price, product_image, quantity, description, id_type_product)
   VALUES ('$name', '$price', '$aaa', '$quantity', '$desc', '$type')";
    if(mysqli_query($conn, $sql)) {
        $bbb = "Thêm thành công";
    }
  }
  else{
   echo "<h4 class='bg-danger'>Có lỗi xảy ra!</h4>";
     
  } 
 }

    }


//         $sql = "INSERT INTO products (name_product, price, product_image, quantity, description, id_type_product)
// VALUES ('$name', '$price', '$file', '$quantity', '$desc', '$type')";

// if ($conn->query($sql) === TRUE) {
//     echo "Thêm thành công";
    
// } else {
//     echo "Error: " . $sql . "<br>" . $conn->error;
// }
    
?>
<div style="text-align: center;">
    <h1>Thêm sản phẩm</h1>
<form method="POST" enctype="multipart/form-data" action="addProduct.php">
        Tên sản phẩm muốn thêm: <br>
        <input type="text" name="name" value="<?php if(isset($_POST["name"])) echo $_POST["name"]; ?>"> <br>
        Giá sản phẩm: <br>
        <input type="number" name="price" value="<?php if(isset($_POST["name"])) echo $_POST["price"]; ?>"> <br>
        Ảnh sản phẩm: <br>
        <input type="file" name="image1" id="image"> <br>
        Số lượng có: <br>
        <input type="text" name="quantity" value="<?php if(isset($_POST["name"])) echo $_POST["quantity"]; ?>"> <br>
        Mã loại sản phẩm: <br>
        <?php
            include("connect2.php");
            $sql69 = "SELECT * from product_type";
            $ress = mysqli_query($conn, $sql69);

?>
<select name="type" id="" style="margin-bottom: 1rem;">


<?php
    while ($roww = mysqli_fetch_array($ress)) {
        ?>
    <option value="<?php echo $roww["type_id"] ?>"><?php echo $roww["type_name"] ?></option>
<?php
    }
?>


</select>
        Mô tả: <br>
        <textarea name="description" id="" cols="30" rows="10"></textarea> <br>
        <input type="submit" value="Xác nhận" id="insert" name="insert">

    </form>
<p style="color: red;"> <?php echo $bbb; ?></p>
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
    <?php
    //print_r($_SESSION);
?>
</body>
</html>