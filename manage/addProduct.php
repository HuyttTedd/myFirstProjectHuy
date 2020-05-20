<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>Document</title>
</head>
<body>
<?php
        if(!isset($_SESSION["admin_info"]["admin_phone"])) {
            header('location:http://localhost/baitapthunhat/manage/index.php');
        }
?>

    <div>
        <a style="text-decoration: none; color: red; font-size: 2rem; background: #ffff80" href="admin.php">Trở về trang chủ</a>
    </div>

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
            echo "Có lỗi xảy ra!";
        }
        if($flag == true){
            $sql = "INSERT INTO products (name_product, price, product_image, quantity, description, id_type_product)
VALUES ('$name', '$price', '$img', '$quantity', '$desc', '$type')";

        if ($conn->query($sql) === TRUE) {
            echo "Thêm thành công";
    
        } else {
            echo "Có lỗi xảy ra, kiểm tra lại!";
            echo $sql;
        }
    }


//         $sql = "INSERT INTO products (name_product, price, product_image, quantity, description, id_type_product)
// VALUES ('$name', '$price', '$file', '$quantity', '$desc', '$type')";

// if ($conn->query($sql) === TRUE) {
//     echo "Thêm thành công";
    
// } else {
//     echo "Error: " . $sql . "<br>" . $conn->error;
// }
    }
?>
    <h1>Thêm sản phẩm</h1>
<form method="POST" enctype="multipart/form-data">
        Tên sản phẩm muốn thêm: <br>
        <input type="text" name="name"> <br>
        Giá sản phẩm: <br>
        <input type="number" name="price"> <br>
        Ảnh sản phẩm: <br>
        <input type="file" name="image1" id="image"> <br>
        Số lượng có: <br>
        <input type="text" name="quantity"> <br>
        Mã loại sản phẩm: <br>
        <input type="text" name="type"> <br>
        Mô tả: <br>
        <textarea name="description" id="" cols="30" rows="10"></textarea> <br>
        <input type="submit" value="submit" id="insert" name="insert">
    </form>


    <script>
        $(document).ready(function(){  
      $('#insert').click(function(){  
           var image_name = $('#image').val();  
           if(image_name == '')  
           {  
                alert("Please Select Image");  
                return false;  
           }  
           else  
           {  
                var extension = $('#image').val().split('.').pop().toLowerCase();  
                if(jQuery.inArray(extension, ['gif','png','jpg','jpeg']) == -1)  
                {  
                     alert('Invalid Image File');  
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