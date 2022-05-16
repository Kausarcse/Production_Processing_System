<?php
session_start();
require_once("../login/session.php");
include('../login/db_connection_class.php');
$obj = new DB_Connection_Class();
$obj->connection();

$style_details = $_POST['style_details'];



 $sql_for_po_ship_date_color = "SELECT DISTINCT po,color,ship_date FROM order_details where `style_details_id` = '$style_details'";

$result_for_po_ship_date_color = mysqli_query($con,$sql_for_po_ship_date_color);

while($row=mysqli_fetch_assoc($result_for_po_ship_date_color))
{
    echo '<option value="'.$row['po'].', '.$row['ship_date'].', '.$row['color'].'">'.$row['po'].', '.$row['ship_date'].', '.$row['color'].'</option>';

}


?>


