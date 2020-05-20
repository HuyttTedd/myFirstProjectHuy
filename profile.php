<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="profile.css">
    <link href="fontawesome/css/fontawesome.css" rel="stylesheet">
    <link href="fontawesome/css/brands.css" rel="stylesheet">
    <link href="fontawesome/css/solid.css" rel="stylesheet">
</head>
<body>
    <?php
    //RANDOM
    function generateRandomString($length = 11) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }
    $randomStr = generateRandomString();
    $_SESSION["bill_id"] = $randomStr;
    //DATABASE
        
        include("connect.php");
        if(!isset($_SESSION["info_customer"]["id_customer"])) {
            $_SESSION["info_customer"]["id_customer"] = "NONE";
        }
        if(empty($_SESSION["info_customer"]["message"])) {
            $_SESSION["info_customer"]["message"] = "NONE";
       }
        $id = $_SESSION["info_customer"]["id_customer"];
        $name_customer = $_SESSION["info_customer"]["name"];
        $phone = $_SESSION["info_customer"]["phone_number"];
        $addr = $_SESSION["info_customer"]["address"];
        $mess = $_SESSION["info_customer"]["message"];
        $total = $_SESSION["total"];
        $valid1 = $valid2 = false;
        $sql1 = "INSERT INTO bill(bill_id, customer_id, customer_name, customer_phone, customer_address, customer_message, total)  
        VALUES ('$randomStr', '$id', '$name_customer', '$phone', '$addr', '$mess', '$total')";
        

            if ($conn->query($sql1) === TRUE) {
                $valid1 = true;
            } else {
                echo "Error: " . $sql1 . "<br>" . $conn->error;
                $valid1 = false;

            }
        foreach($_SESSION["display_quantity"] as $key => $value) { 
                $quan = $value["quantity"];
                $namee = $value["product_name"];
                $pricee = $value["price"];     
                $sql2 = "INSERT INTO billdetailed(product_id, product_name, product_quantity, product_price, bill_id, total)  
                VALUES ('$key', '$namee', '$quan', '$pricee', '$randomStr', '$total')";
                
                if ($conn->query($sql2) === TRUE) {
                    $valid2 = true;
                } else {
                    echo "Error: " . $sql2 . "<br>" . $conn->error;
                    $valid2 = false;
                }
            
        }

        if ($valid1 == true && $valid2 == true) {
            header('location:http://localhost/baitapthunhat/profile2.php');
        } else {
            echo "You have some ERORRS";
        }
        //$sql2 = "INSERT into billdetailed(product_id, product_name, product_price, product_quantity, bill_id) 
        //values ()";
        
        
    ?>

    

</body>
</html>