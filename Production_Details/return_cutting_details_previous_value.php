<?php
session_start();
require_once("../login/session.php");
include('../login/db_connection_class.php');
$obj = new DB_Connection_Class();
$obj->connection();

$order_details_id= $_POST['order_details_id'];
// $ship_date= $_POST['ship_date'];
//  $po= $_POST['po'];
//   $color= $_POST['color'];




$sql_for_previous_cutting_details = "SELECT * FROM production_details WHERE order_details_id = '$order_details_id'";


$result_for_previous_cutting_details = mysqli_query($con,$sql_for_previous_cutting_details) or die(mysqli_error($con));

$row = mysqli_fetch_assoc($result_for_previous_cutting_details);

if(isset($row))
{
    $daily_cutting_qty = $row['daily_cutting_qty'];
    $sewing_input_quantity = $row['sewing_input_quantity'];
    $line_id = $row['line_no'];
    $daily_cutting_qty = $row['daily_cutting_qty'];
    $sewing_input_quantity = $row['sewing_input_quantity'];
    $line_id = $row['line_no'];



    $sql_for_line_details = "SELECT * FROM line_info WHERE id = '$line_id'";
    $result_for_line_details = mysqli_query($con,$sql_for_line_details) or die(mysqli_error($con));
    $row_line_details = mysqli_fetch_assoc($result_for_line_details);

    if(isset($row_line_details))
    {
        $unit = $row_line_details['unit'];
        $line = $row_line_details['line'];
        $description = $row_line_details['description'];

    }


    

}











if(mysqli_num_rows($result_for_previous_cutting_details) > 0)

{
    ?> 

                 <input type="hidden" name="order_details_id_value" id="order_details_id_value" value="<?php echo $order_details_id ?>">
                

        <div class="form-group form-group-sm " id="form-item_name">
        <label class="control-label col-sm-3" for="daily_cutting_qty" style="color:#00008B;">Daily Cutting Quantity:<span style="color:red"> </span></label>

        <div class="col-sm-6">
            <input type="text" class="form-control" id="daily_cutting_qty" name="daily_cutting_qty" value="<?php echo $daily_cutting_qty?>" required>
        </div>
        <!-- <div class="col-sm-3 row nopadding">
            <input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
        </div> -->
        <i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('item_quantity')"></i>
        </div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->

        <div class="form-group form-group-sm" id="form-group_for_line_no">
            <label class="control-label col-sm-3" for="line_no" style="margin-right:0px; color:#00008B;">Line No:<span style="color:red"> </span></label>
            <div class="col-sm-6">
                <select  class="form-control for_auto_complete" id="line_no" name="line_no" onchange="return_information_for_line(this.value)">

                    <!-- <option select="selected" value="select"><?php echo 'Unit:'.$unit.', Line: '.$line_id.', '.$description ?></option> -->
                            <?php 
                                    $sql = "SELECT * FROM line_info";
                                    $result= mysqli_query($con,$sql) or die(mysqli_error($con));
                                    while( $row = mysqli_fetch_array( $result))
                                    {
                                        echo '<option value="'.$row['id'].'">Unit:'.$row['unit'].', Line: '.$row['line'].', '.$row['description'].'</option>';

                                    }

                                ?>
                </select>
            </div>
        </div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_line_no"> -->






        <div class="form-group form-group-sm " id="form-sewing_input_quantity">
        <label class="control-label col-sm-3" for="sewing_input_quantity" style="color:#00008B;">Sewing Input Quantity:<span style="color:red"> </span></label>

        <div class="col-sm-6">
            <input type="text" class="form-control" id="sewing_input_quantity" name="sewing_input_quantity" value="<?php echo $sewing_input_quantity?>" required>
        </div>
        <!-- <div class="col-sm-3 row nopadding">
            <input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
        </div> -->
        <i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('item_quantity')"></i>
        </div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->
    
    
    <?php

}

else{ ?>

         <div class="form-group form-group-sm " id="form-item_name">
            <label class="control-label col-sm-3" for="daily_cutting_qty" style="color:#00008B;">Daily Cutting Quantity:<span style="color:red"> </span></label>
            
            <div class="col-sm-6">
                <input type="text" class="form-control" id="daily_cutting_qty" name="daily_cutting_qty" placeholder="Enter Cutting Quantity" required>
            </div>
            <!-- <div class="col-sm-3 row nopadding">
                <input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
            </div> -->
            <i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('item_quantity')"></i>
    </div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->

    <div class="form-group form-group-sm" id="form-group_for_line_no">
        <label class="control-label col-sm-3" for="line_no" style="margin-right:0px; color:#00008B;">Line No:<span style="color:red"> </span></label>
        <div class="col-sm-6">
            <select  class="form-control for_auto_complete" id="line_no" name="line_no">
                        <option select="selected" value="select">Select Unit Wise Line No</option>
                        <?php 
                                $sql = "SELECT * FROM line_info";
                                $result= mysqli_query($con,$sql) or die(mysqli_error($con));
                                while( $row = mysqli_fetch_array( $result))
                                {
                                    echo '<option value="'.$row['id'].'">Unit:'.$row['unit'].', Line: '.$row['line'].', '.$row['description'].'</option>';

                                }

                            ?>
            </select>
        </div>
    </div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_line_no"> -->




    <div class="form-group form-group-sm " id="form-sewing_input_quantity">
            <label class="control-label col-sm-3" for="sewing_input_quantity" style="color:#00008B;">Sewing Input Quantity:<span style="color:red"> </span></label>
            
            <div class="col-sm-6">
                <input type="text" class="form-control" id="sewing_input_quantity" name="sewing_input_quantity" placeholder="Enter Sewing Input Quantity" required>
            </div>
            <!-- <div class="col-sm-3 row nopadding">
                <input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
            </div> -->
            <i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('item_quantity')"></i>
    </div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->


<?php

}


?>


