    <link rel="stylesheet" href="header.css">
    <!--Header-->
    <header>
        
        <span>LOGO</span>
        

        <input type="checkbox" id="check">
        <label for="check" class="checkbtn"><i class="fa fa-bars" aria-hidden="true"></i></label>
        

    <div class="header1">
        <!--Form-->
        <form action="" id="search">
            <input type="text" id="search" placeholder="Bạn muốn mua gì?">
            <button>Tìm kiếm</button>
        </form>

        <div class="navlink">
            <a href="">Trang chủ</a>
            <a href="">Chủ đề</a>
            <a href="">Ưu đãi</a>
            <a href="">Xem bói</a>
        </div>

        
    </div>

       <?php
            if(isset($_SESSION["phone_number"])) {
                echo '<ul>
                <li><a href="" class="customer">'.$_SESSION["name"].'</a></li>
                
                    </ul>';
            } else {
                echo '<ul>
                <li><a href="" class="aaa">Đăng nhập</a></li>
                <li><a href="">Đăng ký</a></li> 
                    </ul>';
            }
       ?>
    
    </header>

