<?php
// Start the session
session_start();

?>
<p>Xin chào con cào cào!</p>
<?php
    echo "Xin chào " .$_SESSION["name"];

?>