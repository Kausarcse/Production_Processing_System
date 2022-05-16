<?php
session_start();
require_once("../login/session.php");
include('../login/db_connection_class.php');
$obj = new DB_Connection_Class();
$obj->connection();



$user_id = $_SESSION['user_id'];
$password = $_SESSION['password'];
$user_name = $_SESSION['user_name'];

$order_details_id= $_GET['order_details_id'];

echo 'not not not';
exit();
   $select_sql_for_duplicacy="select (select sum(allocated_qty) from plan_details where 
   `plan_details`.`order_details_id`='$order_details_id') as allocated_qty,
   order_details.id,order_details.order_qty , order_details.plan_cut_qty 
   from order_details
    where order_details.`id`='$order_details_id'";
$result = mysqli_query($con,$select_sql_for_duplicacy) or die(mysqli_error($con));

if(mysqli_num_rows($result)>0)
{

    while( $row = mysqli_fetch_array( $result))
    {       
        ?>
        	

                        <div class="form-group form-group-sm " id="form-group_for_pp_creation_date">
								<label class="control-label col-sm-3" for="smv" style="color:#00008B;">Order Quantity:<span style="color:red"> *</span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="order_quantity_d"
                                     name="order_quantity_d"  value="<?php
                                    echo  $row['order_qty'];?>" disabled>

								<input type="hidden" class="form-control" id="order_quantity"
                                     name="order_quantity"  value="<?php
                                    echo  $row['order_qty'];?>" >

								</div>
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
								</div> -->
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->

						<div class="form-group form-group-sm " id="form-item_name">
								<label class="control-label col-sm-3" for="plan_cut_quantity" style="color:#00008B;">Plan Cut Quantity:<span style="color:red"> *</span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="plan_cut_quantity_d" name="plan_cut_quantity_d" value="<?php
                                    echo  $row['plan_cut_qty'];
                                    ?>" disabled>

								<input type="hidden" class="form-control" id="plan_cut_quantity" name="plan_cut_quantity" value="<?php
                                    echo  $row['plan_cut_qty'];
                                    ?>" >
								</div>
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
								</div> -->
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->
					
						<div class="form-group form-group-sm " id="form-item_name">
								<label class="control-label col-sm-3" for="remaing_from_plan_cut" style="color:#00008B;">Remaining Plan Cut Quantity:<span style="color:red"> *</span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="remaing_from_plan_cut_d" name="remaing_from_plan_cut_d"
									value="<?php echo $row['allocated_qty'];?>"
									disabled
									>

									<input type="hidden" class="form-control" id="remaing_from_plan_cut" name="remaing_from_plan_cut"
									value="<?php echo $row['allocated_qty'];?>"
									
									>
								</div>
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
								</div> -->
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->
						

        <?php

       // echo $param=$order_qty."".$plan_cut_qty;

    }

}
else if( mysqli_num_rows($result) < 1)
{
}




$obj->disconnection();

?>
