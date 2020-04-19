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
    include("connect2.php");
    $confirm = "";
    if($_SERVER["REQUEST_METHOD"] === "POST") {
        $errors = [];
        $name = $_POST["name"];
        $price = $_POST["price"];
        $quantity = $_POST["quantity"];
        $file = addslashes(file_get_contents($_FILES["image1"]["tmp_name"]));
        $file_size = $_FILES['image1']['size'];
        $type = $_POST["type"];
        $desc = $_POST["description"];
        if($file_size > 309715){
            $errors[]='Kích cỡ file nên nhỏ hơn chút tầm 300KB nha!';
         }
        if(empty($errors)==true){
            $sql = "INSERT INTO products (name_product, price, product_image, quantity, description, id_type_product)
VALUES ('$name', '$price', '$file', '$quantity', '$desc', '$type')";

        if ($conn->query($sql) === TRUE) {
            echo "Thêm thành công";
    
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
        else{
            echo "Có lỗi gì đó!";
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
           var img = new Image();
           img.src = $('#image').val();
        
            if(img.width != img.height) {
                alert("chim to");
                return false;
                }
            
      });  
 });  
    </script>
</body>
</html>