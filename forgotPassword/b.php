<form method="post">
	<input type="textbox" id="txt" name="txt" value="sdadddddddddddddddddsadasdsdadas"/>
	<input type="button" name="submit" value="OKKKKKKKKK" onclick="getAudio()"/>
</form>

<p id="confirm"></p>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

function getAudio(){
        var txt=jQuery('#txt').val()
        jQuery.ajax({
            url:'a.php',
            type:'post',
            data:'txt='+txt,
            success:function(result){
                jQuery('#confirm').html(result);
            }
        });
    }
</script>
    
