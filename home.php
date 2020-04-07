<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/home.css">
    <script src="https://kit.fontawesome.com/f1e0b185be.js" crossorigin="anonymous"></script>

</head>
<body>
    <!--Header-->
    <header>
        
        <span>LOGO</span>
        

        <input type="checkbox" id="check">
        <label for="check" class="checkbtn"><i class="fa fa-bars" aria-hidden="true"></i></label>
        

    <div class="header1">
        <!--Form-->
        <form action="" id="search">
            <input type="text" id="search" placeholder="Bạn muốn mua gì?">
        </form>

        <div class="navlink">
            <a href="">Trang chủ</a>
            <a href="">Chủ đề</a>
            <a href="">Ưu đãi</a>
            <a href="">Xem bói</a>
        </div>

        
    </div>

        <ul>
            <li><a href="" class="aaa">Đăng nhập</a></li>
            <li><a href="">Đăng ký</a></li> 
        </ul>
    
    </header>

        <!--body-->

    <div class="first-part">
        <!--Carousel-->
        <div class="carousel">
            <div class="leftArrow" onclick="plusSlides(-1)"><i class="fa fa-arrow-left"></i></div>
            <div class="rightArrow" onclick="plusSlides(1)"><i class="fa fa-arrow-right"></i></div>

            <div class="imageHolder">
                <img src="assets/cake.jpeg" alt="">
            </div>
            <div class="imageHolder">
                <img src="assets/panda5.jpg" alt="">
            </div>
            <div class="imageHolder">
                <img src="assets/panda4.jpg" alt="">
            </div>
            <div class="imageHolder">
                <img src="assets/panda.jpg" alt="">
            </div>          
        </div>
        
        <div id="dotsContainer">
            
        </div>
    </div>

    <div class="content">
        <div class="category">
            
            <div class="item">
                <a href=""><img src="http://placehold.it/130x55">
                <span><?php echo "";?></span></a>
            </div>
            <div class="item">
                <img src="http://placehold.it/130x55">
                <span><?php echo "Ông công, ông táo";?></span>
            </div>
            <div class="item">
                <img src="http://placehold.it/130x55">
                <span><?php echo "";?></span>
            </div>
    
        </div>
        <div class="arrange">
            <p>sap xep</p>
        </div>
        <div class="product">
            
            
            <div class="product-item">
                <a href="#">
                <img src="http://placehold.it/250x250">
                <!--Limit word < 45-->
                <p><?php echo "chim to ko lo chet doi chim to ko lo chet doi";?></p>
                <span>10000000</span>
                </a>
            </div>


        </div>
    </div>
  
    <!--Carousel
    <div class="carousel-wrap">
        <div class="owl-carousel">
          <div class="item"><img src="http://placehold.it/250x250"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
          <div class="item"><img src="http://placehold.it/150x150"></div>
        </div>
      </div>-->
    <!--JS-->
    <script src="js/a.js"></script>

    <div class="aaa">
        <input type="text" value="asdasdasdas">
    </div>
</body>
</html>