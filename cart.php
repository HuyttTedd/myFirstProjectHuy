<?php
session_start();
?>

<?php
    $id = $_REQUEST["id"];
    if(isset($_SESSION["id_product"])) {
        $arr_id = array_column($_SESSION["id_product"], 'id_product');
        //$_SESSION["id_product"][$count] = $id;
        if(!in_array($id, $arr_id)) {
    
            $count = count($_SESSION["id_product"]);
            // $item_array = [
            //     'id_product' => $id
            // ];
            $_SESSION["id_product"][$count] = ['id_product' => $id];
        } else {
            echo '<div class="popup" id="popup">
            <div class="popup-content">
                <p>Sản phẩm này đã có trong giỏ hàng!</p>               
                <button id="accept-form" onclick="(function(){ exitPopup();exitPopup2(); })();">Đồng ý</button>
            </div>
        </div>
        ';
        }

    } else {    
        // $item_array = [
        //     'id_product' => $id
        // ];
        $_SESSION["id_product"][0] = ['id_product' => $id];
    }

    echo count($_SESSION["id_product"]);


?>
