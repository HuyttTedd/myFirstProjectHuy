<?php
        //Pattern 
        function checkPhone($val) {
            $pattern = '#^(03|05|07|08|09)[0-9]{8}$#';
            if(preg_match($pattern, $val)) {
                return true;
            } else {
                return false;
            }
        }

        function checkName($val) {
            $pattern = '#^.{3,30}$#';
            if(preg_match($pattern, $val)) {
                return true;
            } else {
                return false;
            }
        }

        function checkEmail($val) {
            $pattern = '#^[a-zA-Z][a-zA-Z0-9_\.]{2, 32}@[a-zA-Z0-9]{2,10}(\.[a-zA-Z]{2,5}){1,3}$#';
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