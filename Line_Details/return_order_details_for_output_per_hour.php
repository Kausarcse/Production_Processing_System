<?php
session_start();
require_once("../login/session.php");
include('../login/db_connection_class.php');
$obj = new DB_Connection_Class();
$obj->connection();

$input_date = $_POST['input_date'];

$splitted_input_date = explode("/",$input_date);

$input_date = $splitted_input_date[2].'-'.$splitted_input_date[0].'-'.$splitted_input_date[1];

function man_power($con,$input_date,$line_no)
{


    $sql_man_power = "SELECT * from line_man_power_details WHERE `date`='$input_date' and line_no='$line_no' ";
    $result_man_power = mysqli_query($con, $sql_man_power);
    if (mysqli_num_rows($result_man_power) > 0) {
        while ($row_line = mysqli_fetch_assoc($result_man_power)) {
            $default_man_power = $row_line['operator'] + $row_line['Helper'] + $row_line['iron_man'];
            return $default_man_power;

        }
    }
}
?>

<!-- <form class="form-horizontal"  style="margin-top:10px;" id="save_target_set_line_details" name="save_target_set_line_details" > -->
 
    <table class="table">
    <thead>
        <tr>
            <th scope="col">Line No</th>
            <th scope="col">Style</th>
            <th scope="col">Details</th>
            <th scope="col">Daily Cutting Quantity</th>
            <th scope="col">Sewing Completed Quantity</th>
            <th scope="col">WIP</th>
            <th scope="col">Quantity</th>
            <th scope="col">Man Power</th>
            <th scope="col">Hour</th>
        </tr>
    </thead>

<?php


$sql_order_details_id ="SELECT line_no,order_details_id,ship_date,color,po,
sewing_completed_quantity as total_daily_cutting_qty, daily_cutting_qty AS total_sewing_completed_quantity 
FROM production_details WHERE `input_date`='$input_date' Order By line_no + 0 ASC 
    ";
$result_order_details_id = mysqli_query($con,$sql_order_details_id);

// $total_daily_cutting_quantity = 0;
// $total_sewing_completed_quantity = 0;

$counter = 0;
$j=1;

$na_count=0;
$count_new_line=0;
$k=[];
while($row = mysqli_fetch_assoc($result_order_details_id))
{
    $na_count++;

    $po = $row['po'];
    $ship_date_from_cutting = $row['ship_date'];
    $ship_date = $row['ship_date'];
    $order_details_id = $row['order_details_id'];
    $color = $row['color'];
    $wip=$obj->wip($con,$order_details_id,$ship_date,$po,$color);
    $cutting_swing ="SELECT sum(daily_cutting_qty) as total_daily_cutting_qty,count(line_no) as count_line,
 sum(sewing_completed_quantity) as total_sewing_completed_quantity
FROM production_details WHERE `po`='$po'
and ship_date='$ship_date_from_cutting'
and color='$color'
and order_details_id='$order_details_id' 
    ";

    $total_cutting_swing = mysqli_query($con,$cutting_swing);
    while($row_c_s = mysqli_fetch_assoc($total_cutting_swing))
    {
        $total_daily_cutting_qty = $row_c_s['total_daily_cutting_qty'];
        $total_sewing_completed_quantity = $row_c_s['total_sewing_completed_quantity'];
        $count_line=$row_c_s['count_line'];
    }

    $line_no = $row['line_no'];
    $ship_date = $row['ship_date'];
    $style_details_id = $row['order_details_id'];
    $style_id = 'style_'.$style_details_id;
    $sql_for_style_name = "SELECT style_name FROM style_name WHERE `style_id`='$style_id'";
    $result_for_style_name = mysqli_query($con,$sql_for_style_name);
    $row_style_name = mysqli_fetch_assoc($result_for_style_name);
    $style_name = $row['order_details_id'];
    //  $details = $row_style_name['style_name'].', '.$row2['ship_date'].', '.$row2['color'].', '.$row2['po'];
    //$row_style_name['style_name'].', '.$row2['ship_date'].', '.$row2['color'].', '.$row2['po']

    $details = $row['po'].', '.$row['ship_date'].', '.$row['color'];

    $count_new_line++;
    //for getting row from this database that we have saved before
    $k[$count_new_line]=$line_no;

    while($j <$line_no) {
         $sql_from_own = "SELECT  * FROM line_wise_output_per_hour where input_date='$input_date' and line_no='$j'";
         $result_from_own= mysqli_query($con,$sql_from_own) or die(mysqli_error($con));
        if(mysqli_num_rows($result_from_own)>0)
            {
                while( $row_from_own = mysqli_fetch_array( $result_from_own))
                {
                   $style_details_id = $row_from_own['order_details_id'];
                    $style_id =  'style_'.$style_details_id;
                    $sql_for_style_name = "SELECT style_name FROM style_name WHERE `style_id`='$style_id'";
                    $result_for_style_name = mysqli_query($con,$sql_for_style_name);
                    $row_style_name = mysqli_fetch_assoc($result_for_style_name);
                    echo '<tr>';  
                   $counter++;
                    ?>
                    <th scope="row"><?php echo $j?></th>
                    <input type="hidden" id="line_<?php echo $counter;?>" name="line_<?php echo $counter;?>" value="<?php echo $j?>">
                    <td>
                    <select  class="form-control for_auto_complete" id="style_<?php echo $counter;?>" name="style_<?php echo $counter;?>">
                    <option select="selected" value="<?php echo $style_details_id;?>"><?php echo $row_style_name['style_name'];?></option>
                       
                     </select>
        
                 </td>
        
               <td>
                <select  class="form-control for_auto_complete" id="details_<?php echo $counter;?>" name="details_<?php echo $counter;?>">
                    <option select="selected" value="<?php echo $row_from_own['po'].', '.$row_from_own['ship_date'].', '.$row_from_own['color'];?>"><?php echo $row_from_own['po'].', '.$row_from_own['ship_date'].', '.$row_from_own['color'];?></option>
                    
                </select>
                </td>
                <td><input type="text" class="form-control" id="total_daily_cutting_qty_<?php echo $counter;?>" name="total_daily_cutting_qty_<?php echo $counter;?>" disabled></td>
                <td><input type="text" class="form-control" id="total_daily_completed_quantity_<?php echo $counter;?>" name="total_daily_completed_quantity_<?php echo $counter;?>" disabled></td>
                <td><input type="text" class="form-control" id="wip_<?php echo $counter;?>" name="wip_<?php echo $counter;?>" disabled></td>
                <td><input type="text" class="form-control" id="quantity_<?php echo $counter;?>" name="quantity_<?php echo $counter;?>" value="<?php echo $row_from_own['quantity']?>" disabled></td>
                <td><input type="text" class="form-control" id="man_power_<?php echo $counter;?>" name="man_power_<?php echo $counter;?>" value="<?php echo man_power($con,$input_date,$j)?>" >
                </td>
                    <td>

                   <select  class="form-control for_auto_complete" id="hour_<?php echo $counter;?>" name="hour_<?php echo $counter;?>" onchange="change_man_power(this.value,<?php echo $counter?>)">
                        <option select="selected" value="<?php echo $row_from_own['hour_no']?>"><?php echo $row_from_own['hour_no']?></option>
                           <?php     

                                for($hour=1; $hour<=24; $hour++)
                                {
                                    echo '<option value="'.$hour.'">'.$hour.'</option>';
                                } 

                            ?>
                    </select>
            
               </td>
        
        
        
                <?php
                   echo '</tr>';  
                    
                }

            }

        $j++;

     }

            ?>

        <tr>
             <?php  $counter++;?>
                <th scope="row" ><?php echo $line_no;?></th>
            <?php
            $sql_from_own = "SELECT  * FROM line_wise_output_per_hour where input_date='$input_date' 
                AND line_no='$line_no' 
                AND `order_details_id`='$style_name'
                AND `po`='$po'
                and `color`='$color'
                and `ship_date`='$ship_date'
                and `total_daily_cutting_qty`>'0'";

            $hour_no="";
            $quantity="";
            $result_from_own = mysqli_query($con, $sql_from_own) or die(mysqli_error($con));
            if (mysqli_num_rows($result_from_own) > 0) {
                while ($row_from_own = mysqli_fetch_array($result_from_own)) {
                    $hour_no=$row_from_own['hour_no'];
                    $quantity=$row_from_own['quantity'];
                }
            }
            ?>



            <input type="hidden" id="line_<?php echo $counter;?>" name="line_<?php echo $counter;?>" value="<?php echo $line_no?>">
                
                <td><input type="text" class="form-control" id="style_<?php echo $counter;?>" name="style_<?php echo $counter;?>" value="<?php echo $style_name?>" readonly ></td>
            
                <td><input type="text" class="form-control" id="details_<?php echo $counter;?>" name="details_<?php echo $counter;?>" value="<?php echo $details?>" readonly ></td>
    
                <td><input type="text" class="form-control" id="total_daily_cutting_qty_<?php echo $counter;?>" name="total_daily_cutting_qty_<?php echo $counter;?>" value="<?php echo $total_daily_cutting_qty?>" readonly ></td>
                <td><input type="text" class="form-control" id="total_daily_completed_quantity_<?php echo $counter;?>" name="total_daily_completed_quantity_<?php echo $counter;?>" value="<?php echo $total_sewing_completed_quantity?>" readonly ></td>
                <td><input type="text" class="form-control" id="wip_<?php echo $counter;?>" name="wip_<?php echo $counter;?>" value="<?php echo $wip?>" readonly ></td>
                <td><input type="text" class="form-control" id="quantity_<?php echo $counter;?>" name="quantity_<?php echo $counter;?>" value="<?php echo $quantity;?>" required></td>
            <td><input type="text" class="form-control" id="man_power_<?php echo $counter;?>" name="man_power_<?php echo $counter;?>" value="<?php echo man_power($con,$input_date,$j)?>" >
            </td>
                            <td>
                    <?php
                    if($hour_no!='')
                    {
                    ?>


            <input type="text" class="form-control" id="hour_<?php echo $counter;?>" name="hour_<?php echo $counter;?>"
                       value="<?php echo $hour_no?>" >


        <?php
                    }
                    else
                    {
                        ?>
                        <select  class="form-control for_auto_complete" id="hour_<?php echo $counter;?>" name="hour_<?php echo $counter;?>" onchange="change_man_power(this.value,<?php echo $counter?>)">
                            <option select="selected" value="select">Select Hours</option>
                            <?php

                            for($hour=1; $hour<=24; $hour++)
                            {
                                echo '<option select=selected value="'.$hour.'">'.$hour.'</option>';
                            }

                            ?>
                        </select>

                     <?php
                    }
                    ?>

            
               </td>

            </tr>
            <?php
                $sql_from_own = "SELECT  * FROM line_wise_output_per_hour where input_date='$input_date' AND line_no='$line_no' AND total_daily_cutting_qty='0'";
                $result_from_own= mysqli_query($con,$sql_from_own) or die(mysqli_error($con));
                if(mysqli_num_rows($result_from_own)>0)
                {
                    $find_same_line=$line_no;
                    while( $row_from_own = mysqli_fetch_array( $result_from_own))
                    {
                        $style_details_id = $row_from_own['order_details_id'];
                        $style_id =  "style_".$style_details_id;
                        $sql_for_style_name = "SELECT style_name FROM style_name WHERE `style_id`='$style_id'";
                        $result_for_style_name = mysqli_query($con,$sql_for_style_name);
                        $row_style_name = mysqli_fetch_assoc($result_for_style_name);

                        echo '<tr>';
                        $counter++;
                        ?>
                        <th scope="row"><?php echo $line_no?></th>
                        <input type="hidden" id="line_<?php echo $counter;?>" name="line_<?php echo $counter;?>" value="<?php echo $line_no?>">
                        <td>
                            <select  class="form-control for_auto_complete" id="style_<?php echo $counter;?>" name="style_<?php echo $counter;?>">
                            <select  class="form-control for_auto_complete" id="style_<?php echo $counter;?>" name="style_<?php echo $counter;?>">
                                <option select="selected" value="<?php echo $row_from_own['style_details_id'];?>"><?php echo $row_style_name['style_name'];?></option>

                            </select>

                        </td>

                        <td>
                            <select  class="form-control for_auto_complete" id="details_<?php echo $counter;?>" name="details_<?php echo $counter;?>">
                                <option select="selected" value="<?php echo $row_from_own['po'].', '.$row_from_own['ship_date'].', '.$row_from_own['color'];?>"><?php echo $row_from_own['po'].', '.$row_from_own['ship_date'].', '.$row_from_own['color'];?></option>

                            </select>
                        </td>
                        <td><input type="text" class="form-control" id="total_daily_cutting_qty_<?php echo $counter;?>" name="total_daily_cutting_qty_<?php echo $counter;?>" disabled></td>
                        <td><input type="text" class="form-control" id="total_daily_completed_quantity_<?php echo $counter;?>" name="total_daily_completed_quantity_<?php echo $counter;?>" disabled></td>
                        <td><input type="text" class="form-control" id="wip_<?php echo $counter;?>" name="wip_<?php echo $counter;?>" disabled></td>
                        <td><input type="text" class="form-control" id="quantity_<?php echo $counter;?>" name="quantity_<?php echo $counter;?>" value="<?php echo $row_from_own['quantity']?>" disabled></td>
                        <td><input type="text" class="form-control" id="man_power_<?php echo $counter;?>" name="man_power_<?php echo $counter;?>" value="<?php echo man_power($con,$input_date,$line_no)?>"></td>
                        <td>

                        <select  class="form-control for_auto_complete" id="hour_<?php echo $counter;?>" name="hour_<?php echo $counter;?>" value="<?php echo $row_from_own['hour']?>" >
                                <option select="selected" value="<?php echo $row_from_own['hour_no']?>"><?php echo $row_from_own['hour_no']?></option>
                                <?php     

                                        for($hour=1; $hour<=24; $hour++)
                                        {
                                            echo '<option value="'.$hour.'">'.$hour.'</option>';
                                        } 

                                    ?>
                        </select>
                    
                        </td>



                        <?php
                        echo '</tr>';

                    }


                }

$j=$line_no+1;
}


// }

?>
  
    </tbody>
    </table>

    <input type="hidden" id="counter" name="counter" value="<?php echo $counter?>">
         
    <div class="form-group form-group-sm">
    <div class="col-sm-offset-5 col-sm-6">
        <button type="button" class="btn btn-success" onClick="return_order_details_for_output_per_hour_saving_in_database()">Submit</button>
        <button type="reset" class="btn btn-danger">Reset</button>
    </div>
    </div>
       

<!-- </form> -->
<div>
</div>
<?php



?>


