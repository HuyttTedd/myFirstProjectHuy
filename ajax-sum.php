<?php
session_start();
?>

<?php
    $id = $_REQUEST["id"];
    $quantity = $_REQUEST["quantity"];
    $total = 0;

    include("connect.php");
    
        
    
        $sql = "SELECT * FROM products where id_product = $id";
        $res = mysqli_query($conn, $sql);
        $row = mysqli_fetch_array($res);           
                $_SESSION["count_money"][$row['id_product']] = [$row["price"] => $quantity];
                $_SESSION["display_quantity"][$row['id_product']] = $quantity;
                foreach($_SESSION["count_money"] as $key => $value) {
                    foreach($value as $key2 => $value2) {
                        $total += (int)$key2 * (int)$value2;
                    }
                }
            $_SESSION["total"] = $total;
                echo number_format($total)." VNĐ" ;

?>