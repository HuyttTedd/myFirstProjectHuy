var slideIndex, slides, dots, captionTeext;
function initGallery() {
    slideIndex = 0;
    slides = document.getElementsByClassName("imageHolder");
    slides[slideIndex].style.opacity = 1;

    dots = [];
    var dotsContainer = document.getElementById("dotsContainer");
    for(let i = 0; i < slides.length; i++) {
        var dot = document.createElement("span");
        dot.classList.add("dots");
        dot.setAttribute("onClick", "moveSlide("+i+")")
        dotsContainer.appendChild(dot);
        dots.push(dot);
    }
    dots[slideIndex].classList.add("active");
}
initGallery();

function plusSlides(m) {
    moveSlide(slideIndex+m);
}

function moveSlide(n) {
    var i, current, next;
    var moveSlideAnimClass = {
        forCurrent:"",
        forNext:""
    };
    if(n>slideIndex) {
        if(n >= slides.length) {n = 0;}
        moveSlideAnimClass.forCurrent = "moveLeftCurrentSlide";
        moveSlideAnimClass.forNext = "moveLeftNextSlide";
    } else if(n < slideIndex) {
        if(n < 0) {n = slides.length-1;}
        moveSlideAnimClass.forCurrent = "moveRightCurrentSlide";
        moveSlideAnimClass.forNext = "moveRightNextSlide";
    }
    if(n != slideIndex) {
        next = slides[n];
        current = slides[slideIndex];
        for(i = 0; i < slides.length; i++) {
            slides[i].className = "imageHolder";
            slides[i].style.opacity = 0;
            dots[i].classList.remove("active");
        }

        current.classList.add(moveSlideAnimClass.forCurrent);
        next.classList.add(moveSlideAnimClass.forNext);
        dots[n].classList.add("active");
        slideIndex=n;
    }
}

function setTime() {
    setInterval(function() {plusSlides(1); }, 7000);
}

setTime();

$('.owl-carousel').owlCarousel({
    loop: true,
    margin: 10,
    nav: true,
    navText: [
      "<i class='fa fa-caret-left'></i>",
      "<i class='fa fa-caret-right'></i>"
    ],
    autoplay: true,
    autoplayHoverPause: true,
    responsive: {
      0: {
        items: 1
      },
      600: {
        items: 3
      },
      1000: {
        items: 5
      }
    }
  })