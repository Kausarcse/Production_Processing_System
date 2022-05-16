<?php
session_start();
require_once("../login/session.php");
include('../login/db_connection_class.php');
$obj = new DB_Connection_Class();
$obj->connection();



$user_id = $_SESSION['user_id'];
$password = $_SESSION['password'];
$user_name = $_SESSION['user_name'];

$style_details_id= $_GET['style_details_id'];
 
 
        ?>
    
							<label class="control-label col-sm-3" for="order_details_id" style="margin-right:0px; color:#00008B;">Order Details:</label>
							<div class="col-sm-6">
								<select  class="form-control for_auto_complete" id="order_details_id" name="order_details_id" onchange="get_line_details(this.value)">
											<option select="select" value="select">Select Style Details</option>
											<?php 
												  $select_sql_for_duplicacy="SELECT order_details.order_details_id, order_details.ship_date, order_details.po, 
												  color.color_id, color.color_name FROM order_details
												  INNER JOIN color ON order_details.color = color.color_id
												  WHERE order_details.style_details_id = '$style_details_id'";
                                              $result = mysqli_query($con,$select_sql_for_duplicacy) or die(mysqli_error($con));
                                              
												 while( $row = mysqli_fetch_array( $result))
												 {

													 echo '<option value="'.$row['order_details_id'].'">Ship date : '.$row['ship_date'].' PO : '.$row['po'].' Color : '.$row['color_name'].'</option>';

												 }

											 ?>
								</select>
							</div>
	               

        
                       

        <?php

       // echo $param=$order_qty."".$plan_cut_qty;

    
?>
<script>
	   $('body').ready(function(){
		$('.for_auto_complete').chosen();
		
		 });
</script>
<?php



$obj->disconnection();


?>
