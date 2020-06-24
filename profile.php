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
    if($_SESSION["create_bill"]["confirm"] != 1) {
        header('location:http://localhost/baitapthunhat/pay.php');
    }
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
        // if(!isset($_SESSION["info_customer"]["id_customer"])) {
        //     $_SESSION["info_customer"]["id_customer"] = "NONE";
        // }
        if(empty($_SESSION["create_bill"]["message"])) {
            $_SESSION["create_bill"]["message"] = "NONE";
       }
        $id = $_SESSION["info_customer"]["id"];
        $name_customer = $_SESSION["create_bill"]["name"];
        $phone = $_SESSION["create_bill"]["phone_number"];
        $addr = $_SESSION["create_bill"]["address"];
        $mess = $_SESSION["create_bill"]["message"];
        $total = $_SESSION["total"];
        $valid1 = $valid2 = false;
        $sql1 = $conn->prepare("INSERT INTO bill(bill_id, customer_id, customer_name, customer_phone, customer_address, customer_message, total)  
        VALUES (?, ?, ?, ?, ?, ?, ?)");

        $sql1->bind_param('sssssss', $randomStr, $id, $name_customer, $phone, $addr, $mess, $total);

            if ($sql1->execute()) {
                $valid1 = true;
            } else {
                echo "Có lỗi xảy ra!";
                $valid1 = false;

            }
        foreach($_SESSION["display_quantity"] as $key => $value) { 
                $quan = $value["quantity"];
                $namee = $value["product_name"];
                $pricee = $value["price"];     
                $sql2 = $conn->prepare("INSERT INTO billdetailed(product_id, product_name, product_quantity, product_price, bill_id, total)  
                VALUES (?, ?, ?, ?, ?, ?)");
                $sql2->bind_param('ssssss', $key, $namee, $quan, $pricee, $randomStr, $total);
                if ($sql2->execute()) {
                    $valid2 = true;
                } else {
                    echo "Error: " . $sql2 . "<br>" . $conn->error;
                    $valid2 = false;
                }
            
        }

        if ($valid1 == true && $valid2 == true) {
            $_SESSION["create_bill"]["confirm"] = 2;
            header('location:http://localhost/baitapthunhat/profile2.php');
        } else {
            echo "Có lỗi xảy ra!";
        }
        //$sql2 = "INSERT into billdetailed(product_id, product_name, product_price, product_quantity, bill_id) 
        //values ()";
        
        
    ?>

    

</body>
</html>