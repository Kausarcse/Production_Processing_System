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

$order_details_id= $_GET['order_details_id'];

// $splitted_date = explode(" ",$order_details);

// $ship_date = $splitted_date[0];
// $po = $splitted_date[1];
// $color = $splitted_date[2];
// $order_details_id = $splitted_date[3];


   	$select_sql_for_duplicacy = "SELECT order_details.order_details_id, order_details.order_qty , order_details.plan_cut_qty, 
								(SELECT sum(allocated_qty) AS allocated_qty FROM plan_details 
								WHERE `plan_details`.`order_details_id`='$order_details_id') AS allocated_qty
								FROM order_details WHERE order_details.`order_details_id`='$order_details_id'";

// exit();

$result = mysqli_query($con,$select_sql_for_duplicacy) or die(mysqli_error($con));

if(mysqli_num_rows($result)>0)
{   
	$row = mysqli_fetch_array($result)
    ?>
        	
		<div class="form-group form-group-sm " id="form-group_for_pp_creation_date">
			<label class="control-label col-sm-3" for="smv" style="color:#00008B;">Order Quantity:<span style="color:red"> *</span></label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="order_quantity" name="order_quantity"  value="<?php echo  $row['order_qty'];?>" readonly>
			</div>
		</div> 

		<div class="form-group form-group-sm " id="form-item_name">
			<label class="control-label col-sm-3" for="plan_cut_quantity" style="color:#00008B;">Plan Cut Quantity:<span style="color:red"> *</span></label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="plan_cut_quantity_d" name="plan_cut_quantity_d"  value="<?php echo  $row['plan_cut_qty'];?>" readonly>
			</div>
		</div> 
					
		<div class="form-group form-group-sm " id="form-item_name">
				<label class="control-label col-sm-3" for="remaing_from_plan_cut" style="color:#00008B;">Remaining Allocated Quantity:<span style="color:red"> *</span></label>
				<div class="col-sm-6">
				<input type="text" class="form-control" id="remaing_from_plan_cut_d" name="remaing_from_plan_cut_d"  value="<?php echo $row['plan_cut_qty']-$row['allocated_qty'];?>" readonly>
				</div>
		</div> 
						

    <?php

}




$obj->disconnection();

?>

