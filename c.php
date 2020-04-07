<?php
// Start the session
session_start();
include("connect.php");
$dataPhone = $_SESSION["phone"];
$sql = "SELECT * from tblshop where phone = '$dataPhone'";
$data = mysqli_query($conn, $sql);
$res = mysqli_fetch_assoc($data);

?>
<p>Xin chào con cào cào!</p>
<?php
    echo "Xin chào " .$res["name"];

?>