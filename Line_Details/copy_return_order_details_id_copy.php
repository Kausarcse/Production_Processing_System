<?php
session_start();
require_once("../login/session.php");
include('../login/db_connection_class.php');
$obj = new DB_Connection_Class();
$obj->connection();

$input_date = $_POST['input_date'];

$splitted_input_date = explode("/",$input_date);

$input_date = $splitted_input_date[2].'-'.$splitted_input_date[0].'-'.$splitted_input_date[1];


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
    # code...
    // echo $sql_order_details_id = "SELECT order_details_id,line_no,
    //  SUM(daily_cutting_qty) AS total_daily_cutting_qty,
    //  SUM(sewing_completed_quantity) AS total_sewing_completed_quantity 
    //  FROM production_details WHERE `input_date`='$input_date' GROUP BY line_no,order_details_id";

    $sql_order_details_id ="SELECT line_no,order_details_id,ship_date,color,po,
    (SELECT sum(A.sewing_completed_quantity) as sewing_completed_quantity 
    FROM production_details A, production_details B 
    WHERE A.order_details_id = B.order_details_id AND A.line_no = B.line_no
     AND A.ship_date = B.ship_date AND A.color = B.color ORDER BY A.line_no) 
     as total_daily_cutting_qty, (SELECT sum(B.daily_cutting_qty) 
     AS order_details_id FROM production_details A, production_details B 
     WHERE A.order_details_id = B.order_details_id AND A.line_no = B.line_no 
     AND A.ship_date = B.ship_date AND A.color = B.color ORDER BY A.line_no) AS 
     total_sewing_completed_quantity FROM production_details WHERE `input_date`='$input_date' 
    GROUP BY line_no,order_details_id";
 
    
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
    $line_no = $row['line_no'];
    $ship_date_from_cutting = $row['ship_date'];
    $order_details_id = $row['order_details_id'];
    $total_daily_cutting_qty = $row['total_daily_cutting_qty'];
    $total_sewing_completed_quantity = $row['total_sewing_completed_quantity'];

    $sql_for_style = "SELECT style_details_id,ship_date,color,po FROM order_details WHERE `style_details_id`='$order_details_id' limit 1";
    $result_for_style = mysqli_query($con,$sql_for_style);

     $row2 = mysqli_fetch_assoc($result_for_style);
     $ship_date = $row2['ship_date'];
     $style_details_id = $row2['style_details_id'];
     $po = $row2['po'];
     $color = $row2['color'];
  
   

     $style_id = 'style_'.$style_details_id;

     $sql_for_style_name = "SELECT style_name FROM style_name WHERE `style_id`='$style_id'";
     $result_for_style_name = mysqli_query($con,$sql_for_style_name);
     $row_style_name = mysqli_fetch_assoc($result_for_style_name);
     $style_name = $row_style_name['style_name'];

    //  $details = $row_style_name['style_name'].', '.$row2['ship_date'].', '.$row2['color'].', '.$row2['po'];
    //$row_style_name['style_name'].', '.$row2['ship_date'].', '.$row2['color'].', '.$row2['po']

    $details = $row2['po'].', '.$row2['ship_date'].', '.$row2['color'];
    $details_from_cutting = $row['po'].', '.$row['ship_date'].', '.$row['color'];

     $wip = $total_sewing_completed_quantity - $total_daily_cutting_qty;
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
                   $style_details_id = $row_from_own['style_details_id'];
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
                <td><input type="text" class="form-control" id="new_target_<?php echo $counter;?>" name="new_target_<?php echo $counter;?>" value="<?php echo $row_from_own['new_target'] ?>"></td>
        
        
        
                <?php
                   echo '</tr>';  
                    
                }

            }



        ?>
           <tr> <?php  $counter++;

               ?>
                <th scope="row"><?php echo $j?></th>
                <input type="hidden" id="line_<?php echo $counter;?>" name="line_<?php echo $counter;?>" value="<?php echo $j?>">
                <td>
                   <select  class="form-control for_auto_complete" id="style_<?php echo $counter;?>" name="style_<?php echo $counter;?>" onchange="set_ship_date_color_po(<?php echo $counter?>)">
                        <option select="selected" value="select">Select Style</option>
                        <?php
                                $sql = 'SELECT DISTINCT style_details_id FROM order_details';
                                $result= mysqli_query($con,$sql) or die(mysqli_error($con));
                                while( $row3 = mysqli_fetch_array( $result))
                                {
                                    $style_id = 'style_'.$row3['style_details_id'];

                                    $sql_for_style_name = "SELECT style_name FROM style_name WHERE `style_id`='$style_id'";
                                    $result_for_style_name = mysqli_query($con,$sql_for_style_name);
                                    $row_style_name = mysqli_fetch_assoc($result_for_style_name);


                                    echo '<option value="'.$row3['style_details_id'].'">'.$row_style_name['style_name'].'</option>';

                                }

                            ?>
                    </select>
                </td>


                <td>
                   <select  class="form-control for_auto_complete" id="details_<?php echo $counter;?>" name="details_<?php echo $counter;?>">
                        <option select="selected" value="select">Select Style</option>

                    </select>
                </td>

                <td><input type="text" class="form-control" id="total_daily_cutting_qty_<?php echo $counter;?>" name="total_daily_cutting_qty_<?php echo $counter;?>" disabled></td>
                <td><input type="text" class="form-control" id="total_daily_completed_quantity_<?php echo $counter;?>" name="total_daily_completed_quantity_<?php echo $counter;?>" disabled></td>
                <td><input type="text" class="form-control" id="wip_<?php echo $counter;?>" name="wip_<?php echo $counter;?>" disabled></td>


                <td><input type="text" class="form-control" id="new_target_<?php echo $counter;?>" name="new_target_<?php echo $counter;?>" required></td>
            </tr>

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
                     value="<?php echo $wip?>">
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



         if($count_new_line>1 && $k[$count_new_line]===$k[$count_new_line-1])
            {
                echo $k[$count_new_line];

            }
            else
            {

        ?>
    <tr>    <?php  $counter++;?>
        <th scope="row" ><?php echo $line_no."rrrr"?></th>
        <input type="hidden" id="line_<?php echo $counter;?>" name="line_<?php echo $counter;?>" value="<?php echo $line_no?>">

        <td>
            <select  class="form-control for_auto_complete" id="style_<?php echo $counter;?>" name="style_<?php echo $counter;?>" onchange="set_ship_date_color_po(<?php echo $counter?>)">
                <option select="selected" value="select">Select Details</option>
                <?php
                $sql = 'SELECT DISTINCT style_details_id FROM order_details';
                $result= mysqli_query($con,$sql) or die(mysqli_error($con));
                while( $row3 = mysqli_fetch_array( $result))
                {
                    $style_id = 'style_'.$row3['style_details_id'];

                     $sql_for_style_name = "SELECT style_name FROM style_name WHERE `style_id`='$style_id'";
                     
                    $result_for_style_name = mysqli_query($con,$sql_for_style_name);
                    $row_style_name = mysqli_fetch_assoc($result_for_style_name);


                    echo '<option value="'.$row3['style_details_id'].'">'.$row_style_name['style_name'].'</option>';

                }

                ?>
            </select>
        </td>

        <td>
            <select  class="form-control for_auto_complete" id="details_<?php echo $counter;?>" name="details_<?php echo $counter;?>">
                <option select="selected" value="select">Select Details</option>

            </select>
        </td>
        <td><input type="text" class="form-control" id="total_daily_cutting_qty_<?php echo $counter;?>" name="total_daily_cutting_qty_<?php echo $counter;?>" disabled></td>
        <td><input type="text" class="form-control" id="total_daily_completed_quantity_<?php echo $counter;?>" name="total_daily_completed_quantity_<?php echo $counter;?>" disabled></td>
        <td><input type="text" class="form-control" id="wip_<?php echo $counter;?>" name="wip_<?php echo $counter;?>" disabled></td>
        <td><input type="text" class="form-control" id="new_target_<?php echo $counter;?>" name="new_target_<?php echo $counter;?>" required></td>


    </tr>

<?php
    }
?>



<?php
$j=$line_no+1;
}

if($j<20)
{
    $find_same_line=0;
    for ($i=$j; $i <=20; $i++) {
        
         $sql_from_own = "SELECT  * FROM daily_target_set_line_details where input_date='$input_date' AND line_no='$i'";
        $result_from_own= mysqli_query($con,$sql_from_own) or die(mysqli_error($con));
        if(mysqli_num_rows($result_from_own)>0)
            {
                $find_same_line=$i;
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
                    <th scope="row"><?php echo $i?></th>
                    <input type="hidden" id="line_<?php echo $counter;?>" name="line_<?php echo $counter;?>" value="<?php echo $i?>">
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
            

        


      ?>
        <tr>    <?php  $counter++;?>
                <th scope="row"><?php echo $i?></th>
                <input type="hidden" id="line_<?php echo $counter;?>" name="line_<?php echo $counter;?>" value="<?php echo $i?>">
            
                <td>
                   <select  class="form-control for_auto_complete" id="style_<?php echo $counter;?>" name="style_<?php echo $counter;?>" onchange="set_ship_date_color_po(<?php echo $counter?>)">
                        <option select="selected" value="select">Select Details</option>
                           <?php 
                                $sql = 'SELECT DISTINCT style_details_id FROM order_details';
                                $result= mysqli_query($con,$sql) or die(mysqli_error($con));
                                while( $row3 = mysqli_fetch_array( $result))
                                {
                                    $style_id = 'style_'.$row3['style_details_id'];

                                    $sql_for_style_name = "SELECT style_name FROM style_name WHERE `style_id`='$style_id'";
                                    $result_for_style_name = mysqli_query($con,$sql_for_style_name);
                                    $row_style_name = mysqli_fetch_assoc($result_for_style_name);
                                    

                                    echo '<option value="'.$row3['style_details_id'].'">'.$row_style_name['style_name'].'</option>';

                                }

                            ?>
                    </select>
                </td>
               
                <td>
                   <select  class="form-control for_auto_complete" id="details_<?php echo $counter;?>" name="details_<?php echo $counter;?>">
                        <option select="selected" value="select">Select Details</option>
                        
                    </select>
                </td>
                <td><input type="text" class="form-control" id="total_daily_cutting_qty_<?php echo $counter;?>" name="total_daily_cutting_qty_<?php echo $counter;?>" disabled></td>
                <td><input type="text" class="form-control" id="total_daily_completed_quantity_<?php echo $counter;?>" name="total_daily_completed_quantity_<?php echo $counter;?>" disabled></td>
                <td><input type="text" class="form-control" id="wip_<?php echo $counter;?>" name="wip_<?php echo $counter;?>" disabled></td>
                <td><input type="text" class="form-control" id="new_target_<?php echo $counter;?>" name="new_target_<?php echo $counter;?>" required></td>
                

            </tr>

      <?php
      }
      }

// }

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
    <h1><?php echo $counter?></h1>
</div>
<?php



?>


