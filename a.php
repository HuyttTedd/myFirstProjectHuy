<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        //Pattern 
        function checkPhone($val) {
            $pattern = '#^[0-9]{10}$#';
            if(preg_match($pattern, $val)) {
                return true;
            } else {
                return false;
            }

        }

        function checkPass($val) {
            $pattern = '#^(?=.*\d)(?=.*([a-z]|[A-Z])).{6,25}$#';
            if(preg_match($pattern, $val)) {
                return true;
            } else {
                return false;
            }

        }


    ?>

    <?php
        $display = [
            'name' => "",
            'pass' => ""
        ];
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "user";
        $err = $errPass = "";
        $conn = new mysqli($servername, $username, $password, $dbname);
        
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }
        
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            foreach ($_POST as $key => $value) {
                if(isset($_POST[$key])) {
                    $display[$key] = htmlspecialchars($value);
                }
            }
            $valid = $valid2 = true;
            $name = $_POST["name"];
            $sql = "SELECT * FROM tbluser WHERE name = '$name'";
            $res = mysqli_query($conn, $sql);

            if(empty($_POST["name"])) {
                $err = "Bạn chưa nhập ";
                $valid = false;
            }   else {
                if (mysqli_num_rows($res) > 0)
                     {
                    $err = "da ton tai";
                    $valid = false;
                     }
                else {
                    $err = "ok";
                }
            }

            if(checkPass($_POST["pass"]) == false) {
                $errPass = "Password từ 6-25 ký tự, phải chứa ít nhất 1 số và ít nhất 1 chữ cái";
                $valid = false;
            } 

            if($valid) {
                header('location:http://localhost/mywebshop/c.php');
            }


            
            // elseif(!empty($_POST["name"])) {
            //     if (mysqli_num_rows($res) > 0)
            //         {
            //         $err = "da ton tai";
            //         }
            //     else {
            //         header("Location: http://localhost/mywebshop/c.php");
            //     }
            // }

            
        }
    ?>

    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="POST" >
        Name:  <input type="text" id="validName" name="name" value="<?php echo $display["name"];?>"> <br>
        <span id="err" ><?php echo $err; ?></span> <br>
        Pass:  <input type="text" id="password" name="pass" value="<?php echo $display["pass"];?>" onkeyup=""><br>
        <span id="errPass" ><?php echo $errPass; ?></span>
        <div><input type="submit" value="submit"></div>
        
    </form>
    
    <script>

        function validPass(val) {
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function() {
                    if(this.readyState == 4 && this.status == 200) {
                        document.getElementById("errPass").innerHTML = this.responseText;
                    }
                };
                xmlhttp.open("GET", "b.php?q=" + val, true);
                xmlhttp.send();

            }


      
        
        // function testInput(val) {
        //     if(val.length == 0) {
        //         document.getElementById("err") = "";
        //         return;
        //     } else {
        //         var xmlhttp = new XMLHttpRequest();
        //         xmlhttp.onreadystatechange = function() {
        //             if(this.readyState == 4 && this.status == 200) {
        //                 document.getElementById("err").innerHTML = this.responseText;
        //             }
        //         };
        //         xmlhttp.open("GET", "c.php?q=" + val, true);
        //         xmlhttp.send();

        //     }
        
        // }
        

    </script>


</body>
</html>