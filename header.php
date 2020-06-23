<link href='https://fonts.googleapis.com/css?family=Cookie' rel='stylesheet'>
    <link rel="stylesheet" href="header.css">
    <!--Header-->
    <header>
        
        <div class="logo">VàngMã</div>
        

        <input type="checkbox" id="check">
        <label for="check" class="checkbtn"><i class="fa fa-bars" aria-hidden="true"></i></label>
        

    <div class="header1">
        <!--Form-->
        <form action="home.php" autocomplete="off" id="search" method="GET">
            <input type="search" name="searchProduct" id="search" placeholder="Bạn muốn mua gì?">
            <button>Tìm kiếm</button>            
        </form>
    
        <div class="navlink">
            <a href="home.php">Trang chủ</a>
        </div>

        
    </div>

       <?php
            if(isset($_SESSION['info_customer']["phone_number"])) {
                echo '<ul>
                <li><a href="personalPage.php" class="customer">'.$_SESSION['info_customer']["name"].'</a></li>
                <li><a href="logout.php" class="customer">Đăng xuất</a></li>
                
                    </ul>';
            } else {
                echo '<ul>
                <li><a href="login.php" class="aaa">Đăng nhập</a></li>
                <li><a href="signup.php">Đăng ký</a></li> 
                    </ul>';
            }
       ?>
    
    </header>

