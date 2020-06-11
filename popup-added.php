<?php
session_start();
?>

<?php
    $id = $_REQUEST["id"];
    if(isset($_SESSION["id_product"])) {
        $arr_id = array_column($_SESSION["id_product"], 'id_product');
        //$_SESSION["id_product"][$count] = $id;
        if(in_array($id, $arr_id)) {
    
            echo '<div class="popup" id="popup">
            <div class="popup-content">
                <p>Bạn có chắc muốn dùng địa chỉ Email này</p>
                <p id="email-in-popup" style="font-size: 1.2rem;"></p>
                <button id="accept-form">Đồng ý</button>
                <button id="cancel-form">Thay đổi</button>
            </div>
        </div>';
        }

    } else {    
        // $item_array = [
        //     'id_product' => $id
        // ];
        $_SESSION["id_product"][0] = ['id_product' => $id];
    }



?>