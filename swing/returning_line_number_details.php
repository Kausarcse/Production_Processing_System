<?php
session_start();
require_once("../login/session.php");
include('../login/db_connection_class.php');
$obj = new DB_Connection_Class();
$obj->connection();



$user_id = $_SESSION['user_id'];
$password = $_SESSION['password'];
$user_name = $_SESSION['user_name'];

$order_details_id= $_POST['order_details_id'];

$select_sql_for_duplicacy = "SELECT order_details.order_details_id, order_details.order_qty , order_details.plan_cut_qty, 
						(SELECT sum(allocated_qty) AS allocated_qty FROM plan_details 
						WHERE `plan_details`.`order_details_id`='$order_details_id') AS allocated_qty
						FROM order_details WHERE order_details.`order_details_id`='$order_details_id'";

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
     ?>
	             	
                    <label class="control-label col-sm-3" for="line_no" style="margin-right:0px; color:#00008B;">Line No:<span style="color:red"> *</span></label>
						<div class="col-sm-6">
						<select  class="form-control for_auto_complete" id="line_no" name="line_no" onchange="returning_value_for_layout_date_time(this.value)">
							<option select="selected" value="select">Select Unit Wise Line No</option>
							<?php 
									$sql = "SELECT DISTINCT line_info.* FROM line_info
									INNER JOIN production_details ON production_details.line_no = line_info.id
									WHERE production_details.order_details_id = '$order_details_id'
									ORDER BY line_info.id ASC";
									$result= mysqli_query($con,$sql) or die(mysqli_error($con));
									while( $row = mysqli_fetch_array( $result))
									{
										echo '<option value="'.$row['id'].'">Unit:'.$row['unit'].', Line: '.$row['line'].', '.$row['description'].'</option>';

									}

								?>
							</select>
						</div>

<script>
	   $('body').ready(function(){
		$('.for_auto_complete').chosen();
		
		 });
</script>
<?php



$obj->disconnection();


?>
