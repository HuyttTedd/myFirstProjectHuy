<?php
                // echo "<pre>";
                // print_r($resCategory);
                // echo "</pre>";

                include("connect.php");
                $sql = "SELECT type_id FROM product_type";
                $res= mysqli_query($conn, $sql);
                while($data = mysqli_fetch_assoc($res)) {
                    echo $data['type_id']."<br>";
                }
                
                // echo "<pre>";
                // print_r($data);
                // echo "</pre>";
            
               
            ?>