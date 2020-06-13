<?php
    $q = $_REQUEST["q"];
    echo '<div class="popup" id="require-login">
            <div class="popup-content">
                <p>Bạn hãy đăng nhập trước khi mua hàng!</p>               
                <button onclick="popUpSignIn()">Đăng nhập</button>
                <button onclick="popUpSignUp()">Đăng ký</button>
                <button onclick="requireLogin()">ĐỒNG Ý</button>
            </div>
        </div>';
?>