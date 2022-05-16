<?php
session_start();
require_once("../login/session.php");
include('../login/db_connection_class.php');
$obj = new DB_Connection_Class();
$obj->connection();

$order_details_id= $_POST['order_details_id'];
$input_date= $_POST['input_date'];
$line_no= $_POST['line_no'];



$sql_for_previous_cutting_details = "SELECT daily_cutting_qty, sewing_input_quantity FROM production_details 
WHERE order_details_id = '$order_details_id' AND `input_date` = '$input_date' AND `line_no` = '$line_no'";

$result_for_previous_cutting_details = mysqli_query($con,$sql_for_previous_cutting_details) or die(mysqli_error($con));

$row = mysqli_fetch_assoc($result_for_previous_cutting_details);

if(isset($row['daily_cutting_qty']))
{
    $daily_cutting_qty = $row['daily_cutting_qty'];
}
else{
    $daily_cutting_qty = "";
}

if(isset($row['sewing_input_quantity']))
{
    $sewing_input_quantity = $row['sewing_input_quantity'];
}
else{
    $sewing_input_quantity = "";
}



echo $daily_cutting_qty."?fs?".$sewing_input_quantity;



    
?>
