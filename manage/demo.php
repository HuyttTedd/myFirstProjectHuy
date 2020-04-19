<form action="">
    <input type="file" name="image" id="image">
    <input type="submit" id="insert">
</form>
<script>
        $(document).ready(function(){  
      $('#insert').click(function(){  
           var image_name = $('#image').val();  
           if(image_name == '')  
           {  
                alert("Please Select Image");  
                return false;  
           }  
           else  
           {  
                var extension = $('#image').val().split('.').pop().toLowerCase();  
                if(jQuery.inArray(extension, ['gif','png','jpg','jpeg']) == -1)  
                {  
                     alert('Invalid Image File');  
                     $('#image').val('');  
                     return false;  
                }  
           }      
           var img = new Image();
           img.src = $('#image').val();
        
            if(img.width != img.height) {
                alert("chim to");
                return false;
                }
      });  
 });  
    </script>