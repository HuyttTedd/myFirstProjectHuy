function onlyPositiveNum(str, val) {
    var i = document.getElementById(str);
    var patt = /\./;
    if(isNaN(i.value)) {
        i.value = 1;
    
        var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("sum-price").innerHTML = this.responseText;
        }
    };
    xmlhttp.open("GET", "ajax-sum.php?id=" + str + "&quantity=1", true);
    xmlhttp.send();
    }
    //////////////////////////////////////////////////
    else if(patt.test(i.value) == true) {
        var x = Math.ceil(i.value);
        i.value = x;
        var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("sum-price").innerHTML = this.responseText;
        }
    };
    xmlhttp.open("GET", "ajax-sum.php?id=" + str + "&quantity=" + x, true);
    xmlhttp.send();
    }
//////////////////////////////////////////////////////
     else if(i.value == "") {
        i.value = 1;
        var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("sum-price").innerHTML = this.responseText;
        }
    };
    xmlhttp.open("GET", "ajax-sum.php?id=" + str + "&quantity=1", true);
    xmlhttp.send();
    }
    else if(i.value > 999) {
        i.value = 999;
        var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("sum-price").innerHTML = this.responseText;
        }
    };
    xmlhttp.open("GET", "ajax-sum.php?id=" + str + "&quantity=999", true);
    xmlhttp.send();
    }
    else if(i.value < 1) {
        i.value = 1;
        var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("sum-price").innerHTML = this.responseText;
        }
    };
    xmlhttp.open("GET", "ajax-sum.php?id=" + str + "&quantity=1", true);
    xmlhttp.send();
    }    
    else {
        var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("sum-price").innerHTML = this.responseText;
        }
    };
    xmlhttp.open("GET", "ajax-sum.php?id=" + str + "&quantity=" + val, true);
    xmlhttp.send();
    }

    //AJAX3
    
    //END AJAX
}
function minus(str) {
    let i = document.getElementById(str);
    if(i.value == 1) {
        i.value = 1;
    } else if (Number(i.value) > 1) {
        i.value = Number(i.value) - 1;             
    }


    //AJAX1
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("sum-price").innerHTML = this.responseText;
        }
    };
    xmlhttp.open("GET", "ajax-sum.php?id=" + str + "&quantity=" + i.value, true);
    xmlhttp.send();
    //END AJAX
}

function plus(str) {
    let i = document.getElementById(str);
    
        i.value = Number(i.value) + 1;             
    //AJAX2
        var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("sum-price").innerHTML = this.responseText;
        }
    };
    xmlhttp.open("GET", "ajax-sum.php?id=" + str + "&quantity=" + i.value, true);
    xmlhttp.send();
    //END AJAX
}


// function selfInput(str, val) {
//     let i = document.getElementById(str);
//     //AJAX1
//     var xmlhttp = new XMLHttpRequest();
//     xmlhttp.onreadystatechange = function() {
//         if (this.readyState == 4 && this.status == 200) {
//             document.getElementById("sum-price").innerHTML = this.responseText;
//         }
//     };
//     xmlhttp.open("GET", "ajax-sum.php?id=" + str + "&quantity=" + i.value, true);
//     xmlhttp.send();
//     //END AJAX
// }