function onlyPositiveNum(str, val) {
    var i = document.getElementById(str);
    if(isNaN(i.value)) {
        i.value = "";
    } else if(i.value == 0) {
        i.value = "";
    }

    //AJAX3
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("sum-price").innerHTML = this.responseText;
        }
    };
    xmlhttp.open("GET", "ajax-sum.php?id=" + str + "&quantity=" + val, true);
    xmlhttp.send();
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