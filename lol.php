<?php
   session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
   
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
   <title>Document</title>
</head>
<body>
   <?php
   include("connect.php");
      if(isset($_POST["submit"])) {
         $f1 = $_FILES["file1"]["name"];
         $f2 = $_FILES["file2"]["name"];
         $sql = "INSERT INTO image_test (img1, img2) VALUES ('$f1', '$f2')";
         if ($conn->query($sql) === TRUE) {
            move_uploaded_file($_FILES['file1']['tmp_name'], "papershopproject.000webhostapp.com/img/ongCongongTao/$f1");
            move_uploaded_file($_FILES['file2']['tmp_name'], "papershopproject.000webhostapp.com/img/ongCongongTao/$f2");
            echo "File Uploaded Successfully";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
   }
   ?>


   <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="POST" enctype="multipart/form-data">
      Image 1:
      <input type="file" name="file1"> <br> <br>
      Image 2:
      <input type="file" name="file2"> <br> <br>
      <input type="submit" name="submit" value="upload">

   </form>
</body>
</html>