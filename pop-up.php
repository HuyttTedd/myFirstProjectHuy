<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>POPUP</title>
    <link rel="stylesheet" href="pop-up.css">
</head>

<body>
<!--POPUP-->
    <div class="popup" id="popup">
        <p>Bạn có chắc muốn dùng địa chỉ Email này</p>
        <button>Đồng ý</button>
        <button>Thay đổi</button>
    </div>

    <button id="btn-popup">OK</button>

    <script>
        var popup = document.getElementById("btn-popup");
        popup.onclick = function() {
            document.getElementById("popup").style.display = "block";
        }

    </script>
</body>
</html>