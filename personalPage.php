<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang cá nhân</title>
    <link rel="stylesheet" href="personalPage.css">
    <link href="fontawesome/css/fontawesome.css" rel="stylesheet">
    <link href="fontawesome/css/brands.css" rel="stylesheet">
    <link href="fontawesome/css/solid.css" rel="stylesheet">
</head>
<body>
<?php
  if(!isset($_SESSION["info_customer"]["phone_number"])) {
    header('location:http://localhost/baitapthunhat/home.php');
  }
?>

<?php
  include("header.php");
?>

<div class="container">
<button class="tablink" onclick="openPage('personal-info', this, '#b3b300')" id="defaultOpen">Thông tin cá nhân</button>
<button class="tablink" onclick="openPage('status-order', this, '#b3b300')">Tình trạng đơn hàng</button>

<?php
    function checkAddress($val) {
      $pattern = '#^.{6,30}$#';
            if(preg_match($pattern, $val)) {
                return true;
            } else {
                return false;
            }
    }
    $flag = "";
    if(isset($_POST["address"])) {
      include("connect.php");
      $add = $_POST["address"];
      if(checkAddress($add)) {
        $sqlAddr = "INSERT into tbl_account(address) values '$add'";
        if(mysqli_query($conn, $sqlAddr)) {
          $flag = "Sửa địa chỉ của bạn thành công!";
        } else {
          $flag = "Có lỗi gì đó thử lại sau!";
        }
      } else {
        $flag = "Địa chỉ không hợp lệ!";
      }
    mysqli_close($conn);
    }

?>


<div id="personal-info" class="tabcontent">
<div>Tên tài khoản:</div>
  <input type="text" value="<?php echo $_SESSION["info_customer"]["name"];?>" disabled>
  <div>Số điện thoại:</div>
  <input type="text" value="<?php echo $_SESSION["info_customer"]["phone_number"];?>" disabled>
  <form action="">
  <div style="color: red">Sửa địa chỉ:</div>
  <textarea name="address" id="" cols="40" rows="10" placeholder="Nhập địa chỉ của bạn"></textarea>
  <div><button type="submit" class="addr">Sửa địa chỉ</button></div>
  </form>
  <div class="notify" style="color: red"><?php echo $flag;?></div>
</div>

<div id="status-order" class="tabcontent">
  <h3>News</h3>
  <p>Some news this fine day!</p> 
</div>
</div>
<script>
function openPage(pageName,elmnt,color) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].style.backgroundColor = "";
  }
  document.getElementById(pageName).style.display = "block";
  elmnt.style.backgroundColor = color;
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
</body>
</html>
