<style>
    
#unlog-in {
    position: fixed;
    top: 61%;
    max-width: 80px;
    transform: translate(0, -50%);
    right: 3%;
    z-index: 5;
    background-color: #e6e600; 
    text-align: center;   
    font-size: .8rem;
    border-radius: 10px;
    padding: 5px 3px;
    animation-name: myAnimation;
    animation-duration: 15s;
    animation-fill-mode: forwards;
}

@keyframes myAnimation{
  0%{
    opacity: 1;
    
  }
  70%{
    opacity: 0.8;
    
  }
  100%{
    display: none;
    opacity: 0;
    
  }
}
#unlog-in a {
    text-decoration: ;
    color: black;
    font-size: .9rem;
}

#unlog-in a:hover {
    color: white;
}
</style>


<div id="unlog-in">
        <p><a href="login.php">Đăng nhập</a> ngay để mua hàng! Chưa có tài khoản? <a href="sign-up.php">Đăng ký</a> ngay!</p>

</div>

<script>
    setTimeout(() => {
        document.getElementById("unlog-in").style.display = "none";
    }, 15000);
</script>