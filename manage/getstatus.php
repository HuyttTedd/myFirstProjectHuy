
<?php
    session_start();
    include("connect2.php");
    //response
    $val = $_REQUEST["val"];

    if($val == 0) {
        
        $sqlFromBill = "SELECT * From bill where status = 0";
        $res2 = mysqli_query($conn, $sqlFromBill);
        if(mysqli_num_rows($res2) < 1) {
            echo "Không có đơn hàng nào!";
        }
?>

<?php

        while($rowFromBill = mysqli_fetch_array($res2)) {
            echo '<div class="list-item">';
            echo "<div><b style='color: red'>MÃ ĐƠN HÀNG</b>: $rowFromBill[bill_id]</div>";
            echo "<div><b>ID khách hàng</b>: $rowFromBill[customer_id]</div>";
            echo "<div><b>Tên khách hàng</b>: $rowFromBill[customer_name]</div>";
            echo "<div><b>Số điện thoại</b>: $rowFromBill[customer_phone]</div>";
            echo "<div><b>Địa chỉ</b>: $rowFromBill[customer_address]</div>";
            echo "<div><b>Lời nhắn</b>: $rowFromBill[customer_message]</div>";
            echo "<div style='color: red'><b>Tổng tiền</b>: ".number_format($rowFromBill['total'])." VNĐ</div>";
            echo "<hr><hr>";
            echo "<div style='color: red'>CHI TIẾT HÓA ĐƠN:</div>";
            
            $bill_id = $rowFromBill["bill_id"];
            $sqlFromBilldetailed = "SELECT * From billdetailed where bill_id = '$bill_id'";
            $res = mysqli_query($conn, $sqlFromBilldetailed);
            while($rowFromBilldetailed = mysqli_fetch_array($res)) {
                echo "<div style='color: red'><b>Mã sản phẩm</b>: $rowFromBilldetailed[product_id]</div>";
                echo "<div><b>Tên sản phẩm</b>: $rowFromBilldetailed[product_name]</div>";
                echo "<div style='color: red'><b>Đơn giá sản phẩm</b>: ".number_format($rowFromBilldetailed['product_price'])." VNĐ</div>";
                echo "<div><b>Số lượng sản phẩm</b>: $rowFromBilldetailed[product_quantity]</div>";
                echo "<hr>";
            }
?>
            <form action="<?php echo htmlspecialchars("manageBills.php");?>" method="POST">
                <input type="hidden" value="<?php echo $rowFromBill['bill_id'];?>" name="submitOrder">
                <input type="submit" id="submit" value="Xác nhận đơn hàng">
            </form>
            <form action="<?php echo htmlspecialchars("manageBills.php");?>" method="POST">
                <input type="hidden" value="<?php echo $rowFromBill['bill_id'];?>" name="cancelOrder">
                <input type="submit" id="submit" value="Hủy đơn hàng">
            </form>
            </div>
<?php  
        }
    }
   
?>


<!--Val ============ 1---------------------------------------------------------------------------------------------------------------->
<?php   
if($val == 1) {
        
        $sqlFromBill = "SELECT * From bill where status = 1";
        $res2 = mysqli_query($conn, $sqlFromBill);
        if(mysqli_num_rows($res2) < 1) {
            echo "Không có đơn hàng nào đang giao!";
        }
?>

<?php

        while($rowFromBill = mysqli_fetch_array($res2)) {
            echo '<div class="list-item">';
            echo "<div><b style='color: red'>MÃ ĐƠN HÀNG</b>: $rowFromBill[bill_id]</div>";
            echo "<div><b>ID khách hàng</b>: $rowFromBill[customer_id]</div>";
            echo "<div><b>Tên khách hàng</b>: $rowFromBill[customer_name]</div>";
            echo "<div><b>Số điện thoại</b>: $rowFromBill[customer_phone]</div>";
            echo "<div><b>Địa chỉ</b>: $rowFromBill[customer_address]</div>";
            echo "<div><b>Lời nhắn</b>: $rowFromBill[customer_message]</div>";
            echo "<div style='color: red'><b>Tổng tiền</b>: ".number_format($rowFromBill['total'])." VNĐ</div>";
            echo "<hr><hr>";
            echo "<div style='color: red'>CHI TIẾT HÓA ĐƠN:</div>";
            
            $bill_id = $rowFromBill["bill_id"];
            $sqlFromBilldetailed = "SELECT * From billdetailed where bill_id = '$bill_id'";
            $res = mysqli_query($conn, $sqlFromBilldetailed);
            while($rowFromBilldetailed = mysqli_fetch_array($res)) {
                echo "<div style='color: red'><b>Mã sản phẩm</b>: $rowFromBilldetailed[product_id]</div>";
                echo "<div><b>Tên sản phẩm</b>: $rowFromBilldetailed[product_name]</div>";
                echo "<div style='color: red'><b>Đơn giá sản phẩm</b>: ".number_format($rowFromBilldetailed['product_price'])." VNĐ</div>";
                echo "<div><b>Số lượng sản phẩm</b>: $rowFromBilldetailed[product_quantity]</div>";
                echo "<hr>";
            }
?>
            <form action="<?php echo htmlspecialchars("manageBills.php");?>" method="POST">
                <input type="hidden" value="<?php echo $rowFromBill['bill_id'];?>" name="completeOrder">
                <input type="submit" id="submit" value="Đã giao xong hàng">
            </form>
            <form action="<?php echo htmlspecialchars("manageBills.php");?>" method="POST">
                <input type="hidden" value="<?php echo $rowFromBill['bill_id'];?>" name="cancelOrder1">
                <input type="submit" id="submit" value="Không giao được đơn hàng">
            </form>
  
            </div>
<?php  
        }
    }
   
?>
<!--Val ============ 2---------------------------------------------------------------------------------------------------------------->
<?php   
if($val == 2) {
        
        $sqlFromBill = "SELECT * From bill where status = 2";
        $res2 = mysqli_query($conn, $sqlFromBill);
        if(mysqli_num_rows($res2) < 1) {
            echo "Không có đơn hàng nào đã xử lý!";
        }
?>

<?php

        while($rowFromBill = mysqli_fetch_array($res2)) {
            echo '<div class="list-item">';
            echo "<div><b style='color: red'>MÃ ĐƠN HÀNG</b>: $rowFromBill[bill_id]</div>";
            echo "<div><b>ID khách hàng</b>: $rowFromBill[customer_id]</div>";
            echo "<div><b>Tên khách hàng</b>: $rowFromBill[customer_name]</div>";
            echo "<div><b>Số điện thoại</b>: $rowFromBill[customer_phone]</div>";
            echo "<div><b>Địa chỉ</b>: $rowFromBill[customer_address]</div>";
            echo "<div><b>Lời nhắn</b>: $rowFromBill[customer_message]</div>";
            echo "<div style='color: red'><b>Tổng tiền</b>: ".number_format($rowFromBill['total'])." VNĐ</div>";
            echo "<hr><hr>";
            echo "<div style='color: red'>CHI TIẾT HÓA ĐƠN:</div>";
            
            $bill_id = $rowFromBill["bill_id"];
            $sqlFromBilldetailed = "SELECT * From billdetailed where bill_id = '$bill_id'";
            $res = mysqli_query($conn, $sqlFromBilldetailed);
            while($rowFromBilldetailed = mysqli_fetch_array($res)) {
                echo "<div style='color: red'><b>Mã sản phẩm</b>: $rowFromBilldetailed[product_id]</div>";
                echo "<div><b>Tên sản phẩm</b>: $rowFromBilldetailed[product_name]</div>";
                echo "<div style='color: red'><b>Đơn giá sản phẩm</b>: ".number_format($rowFromBilldetailed['product_price'])." VNĐ</div>";
                echo "<div><b>Số lượng sản phẩm</b>: $rowFromBilldetailed[product_quantity]</div>";
                echo "<hr>";
            }
?>
            </div>
<?php  
        }
    }
   
?>


<!--Val ============ 3---------------------------------------------------------------------------------------------------------------->
<?php   
if($val == 3) {
        
        $sqlFromBill = "SELECT * From bill where status = 3";
        $res2 = mysqli_query($conn, $sqlFromBill);
        if(mysqli_num_rows($res2) < 1) {
            echo "Không có đơn hàng nào đã hủy!";
        }
?>

<?php

        while($rowFromBill = mysqli_fetch_array($res2)) {
            echo '<div class="list-item">';
            echo "<div><b style='color: red'>MÃ ĐƠN HÀNG</b>: $rowFromBill[bill_id]</div>";
            echo "<div><b>ID khách hàng</b>: $rowFromBill[customer_id]</div>";
            echo "<div><b>Tên khách hàng</b>: $rowFromBill[customer_name]</div>";
            echo "<div><b>Số điện thoại</b>: $rowFromBill[customer_phone]</div>";
            echo "<div><b>Địa chỉ</b>: $rowFromBill[customer_address]</div>";
            echo "<div><b>Lời nhắn</b>: $rowFromBill[customer_message]</div>";
            echo "<div style='color: red'><b>Tổng tiền</b>: ".number_format($rowFromBill['total'])." VNĐ</div>";
            echo "<hr><hr>";
            echo "<div style='color: red'>CHI TIẾT HÓA ĐƠN:</div>";
            
            $bill_id = $rowFromBill["bill_id"];
            $sqlFromBilldetailed = "SELECT * From billdetailed where bill_id = '$bill_id'";
            $res = mysqli_query($conn, $sqlFromBilldetailed);
            while($rowFromBilldetailed = mysqli_fetch_array($res)) {
                echo "<div style='color: red'><b>Mã sản phẩm</b>: $rowFromBilldetailed[product_id]</div>";
                echo "<div><b>Tên sản phẩm</b>: $rowFromBilldetailed[product_name]</div>";
                echo "<div style='color: red'><b>Đơn giá sản phẩm</b>: ".number_format($rowFromBilldetailed['product_price'])." VNĐ</div>";
                echo "<div><b>Số lượng sản phẩm</b>: $rowFromBilldetailed[product_quantity]</div>";
                echo "<hr>";
            }
?>
  
            </div>
<?php  
        }
    }
   
?>


<?php
//////////////////////////////////////close
mysqli_close($conn);
?>