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
// Start the session

function generateRandomString($length = 11) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}




    // echo "<pre>";
    // print_r($_SESSION);
    // echo "</pre>";
?>
    <?php
    
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "myshop";

    $conn = new mysqli($servername, $username, $password, $dbname);
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        } else {
            
        }
    //$conn->close();
?>
<?php
    $sql = "SELECT * FROM products WHERE id_product = 25";
    //
  
    $res = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_array($res)) {
        
        echo '<a href="#"><img src="data:image/jpeg;base64,'.base64_encode($row['product_image']). ' " />   </a>';
    }

    
   
?>

<?php  
  
// Get the image and convert into string 
$img = file_get_contents( 
'cake.jpeg'); 
  
// Encode the image string data into base64 
$data = base64_encode($img); 
  echo "<br>".$data;
// Display the output 
echo '<img src="data:image/jpeg;base64,'.base64_encode($img).'" />' ;
//echo '<img src="data:image/jpeg;base64,'.base64_encode($row['product_image'] ).'" />';
?> 
</body>
</html>



