<?php
session_start();
require_once("../login/session.php");
include('../login/db_connection_class.php');
$obj = new DB_Connection_Class();
$obj->connection();

$input_date = $_POST['input_date'];

$splitted_input_date = explode("/",$input_date);

$input_date = $splitted_input_date[2].'-'.$splitted_input_date[0].'-'.$splitted_input_date[1];





//$order_details_id='1'; $ship_date='2021-01-11'; $po='1'; $color='color_3';
//echo $obj->wip($con,$order_details_id,$ship_date,$po,$color);


?>



<!-- <form class="form-horizontal"  style="margin-top:10px;" id="save_target_set_line_details" name="save_target_set_line_details" > -->
 
    <table class="table">
    <thead>
        <tr>
            <th scope="col">Line No</th>
            <th scope="col">Style</th>
            <th scope="col">Details</th>
            <th scope="col">Total Cutting Quantity</th>
            <th scope="col">Total Input for Swing</th>
            <th scope="col">WIP</th>
            <th scope="col">Hourly Target</th>
        </tr>
    </thead>

<?php

      $sql_order_details_id ="SELECT line_no,order_details_id,ship_date,color,po,
sewing_completed_quantity as total_daily_cutting_qty, daily_cutting_qty AS total_sewing_completed_quantity 
FROM production_details WHERE `input_date`='$input_date' Order By line_no + 0 ASC 
    ";

$result_order_details_id = mysqli_query($con,$sql_order_details_id);


$counter = 0;
$j=1;

$na_count=0;
$count_new_line=0;
$k=[];
$count__entry=0;
while($row = mysqli_fetch_assoc($result_order_details_id))
{$count__entry++;

    $na_count++;

    $po = $row['po'];
    $ship_date_from_cutting = $row['ship_date'];
    $order_details_id = $row['order_details_id'];
    $color = $row['color'];
    $ship_date=$row['ship_date'];
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

    if(isset($row_style_name['style_name']))
    {
        $style_name = $row_style_name['style_name'];
    }
    else{
        $style_name = "";
    }

   
    $details = $row['po'].', '.$row['ship_date'].', '.$row['color'];
    $details_from_cutting = $row['po'].', '.$row['ship_date'].', '.$row['color'];

    $count_new_line++;
    //for getting row from this database that we have saved before
     $k[$count_new_line]=$line_no;


    while($j <$line_no) {


         $sql_from_own = "SELECT  * FROM daily_target_set_line_details where input_date='$input_date' and line_no='$j'";

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
                <td><input type="text" class="form-control" id="wip_<?php echo $counter;?>" name="wip_<?php echo $counter;?>" disabled value="<?php echo $wip;?>"></td>
                <td><input type="text" class="form-control" id="new_target_<?php echo $counter;?>" name="new_target_<?php echo $counter;?>" value="<?php echo $row_from_own['new_target'] ?>"></td>
        

                <?php
                   echo '</tr>';  
                    
                }

            }

        ?>

            <?php
        $j++;

     }

            ?>

        <tr>
             <?php  $counter++;
             ?>
                <th scope="row" ><?php echo $line_no?></th>
                <input type="hidden" id="line_<?php echo $counter;?>" name="line_<?php echo $counter;?>" value="<?php echo $line_no?>">
                
                <td>
                <input type="hidden" class="form-control" 
                id="style_<?php echo $counter;?>" name="style_<?php echo $counter;?>"
                 value="<?php echo $style_name?>"  >    
                <input type="text" class="form-control" 
            
                 value="<?php echo $style_name?>" readonly ></td>
            
                <td>
                <input type="hidden" class="form-control" 
                    id="details_<?php echo $counter;?>" name="details_<?php echo $counter;?>"
                     value="<?php echo $details_from_cutting?>"  >

                    <input type="text" class="form-control" 
                     value="<?php echo $details_from_cutting?>" readonly >
                </td>
    
                <td><input type="text" class="form-control" id="total_daily_cutting_qty_<?php echo $counter;?>" name="total_daily_cutting_qty_<?php echo $counter;?>" value="<?php echo $total_daily_cutting_qty?>" readonly ></td>
                <td><input type="text" class="form-control" id="total_daily_completed_quantity_<?php echo $counter;?>" name="total_daily_completed_quantity_<?php echo $counter;?>" value="<?php echo $total_sewing_completed_quantity?>" readonly ></td>
                <td>
                    <input type="hidden" class="form-control" 
                    id="wip_<?php echo $counter;?>" name="wip_<?php echo $counter;?>"
                     value="<?php echo $wip;
                     ?>">
                     <input type="text" class="form-control" 
                  
                     value="<?php echo $wip?>" readonly >
                    </td>
                <?php

                 $sql_from_own = "SELECT  * FROM daily_target_set_line_details 
                where input_date='$input_date' 
                AND line_no='$line_no' 
                AND `style_details_id`=(select row_id from style_name where
                  style_name='$style_name')
                AND `po`='$po'
                and `color`='$color'
                and `ship_date`='$ship_date_from_cutting'
                and `total_daily_cutting_qty`>'0'";
                $target="";

                
                $result_from_own = mysqli_query($con, $sql_from_own) or die(mysqli_error($con));
                if (mysqli_num_rows($result_from_own) > 0) {
                    while ($row_from_own = mysqli_fetch_array($result_from_own)) {
                        $target=$row_from_own['new_target'];

                    }
                }
                ?>

                <td><input type="text" class="form-control" id="new_target_<?php echo $counter;?>" name="new_target_<?php echo $counter;?>"  value="<?php echo $target;?>"  required></td>

            </tr>
            <?php
                $sql_from_own = "SELECT  * FROM daily_target_set_line_details where input_date='$input_date' AND line_no='$line_no' AND total_daily_cutting_qty='0'";
                $result_from_own= mysqli_query($con,$sql_from_own) or die(mysqli_error($con));
                if(mysqli_num_rows($result_from_own)>0)
                {
                    $find_same_line=$line_no;
                    while( $row_from_own = mysqli_fetch_array( $result_from_own))
                    {
                        $style_details_id = $row_from_own['style_details_id'];
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
                        <td><input type="text" class="form-control" id="new_target_<?php echo $counter;?>" name="new_target_<?php echo $counter;?>" value="<?php echo $row_from_own['new_target']?>" required></td>



                        <?php
                        echo '</tr>';

                    }


                }


$j=$line_no+1;
}
?>
    </tbody>
    </table>

    <input type="hidden" id="counter" name="counter" value="<?php echo $counter?>">
         
    <div class="form-group form-group-sm">
    <div class="col-sm-offset-5 col-sm-6">
        <button type="button" class="btn btn-success" onClick="save_target_set_line()">Submit</button>
        <button type="reset" class="btn btn-danger">Reset</button>
    </div>
    </div>
       

<!-- </form> -->
<div>
</div>
<?php



?>


