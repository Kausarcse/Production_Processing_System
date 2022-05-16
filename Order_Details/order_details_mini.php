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

    $select_sql_for_duplicacy="SELECT buyer.buyer_name,style_details.* FROM `style_details` 
									INNER JOIN buyer ON style_details.buyer_no=buyer.buyer_id 
									WHERE style_details.style_details_id = '$order_details_id'";

$result = mysqli_query($con,$select_sql_for_duplicacy) or die(mysqli_error($con));

if(mysqli_num_rows($result)>0)
{
    while( $row = mysqli_fetch_array( $result))
    {
        ?>

            <div class="form-group form-group-sm" id="form-group_for_customer_name">
							<label class="control-label col-sm-3" for="buyer_name" style="margin-right:0px; color:#00008B;">Buyer Name:<span style="color:red"> </span></label>
							<div class="col-sm-6">
                            <input type="text" class="form-control" id="smv" name="smv" placeholder="Enter SMV" value="<?php  echo  $row['buyer_name'];?>" readonly>

							</div>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_customer_name"> -->



						<div class="form-group form-group-sm " id="form-group_for_pp_creation_date">
								<label class="control-label col-sm-3" for="smv" style="color:#00008B;">SMV:<span style="color:red"> </span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="smv" name="smv" value="<?php echo  $row['smv'];?>" readonly>
								</div>
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
								</div> -->
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->

                        <div class="form-group form-group-sm " id="form-item_name">
								<label class="control-label col-sm-3" for="item_name" style="color:#00008B;">Item Name:<span style="color:red"> </span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="item_name" name="item_name" value="<?php echo  $row['item_name'];?>" readonly>
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
