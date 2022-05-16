<?php
session_start();
require_once("../login/session.php");
include('../login/db_connection_class.php');
$obj = new DB_Connection_Class();
$obj->connection();



$user_id = $_SESSION['user_id'];
$password = $_SESSION['password'];
$user_name = $_SESSION['user_name'];


$input_date=$_GET['cutting_input_date'];
$splitted_input_date=explode("/",$input_date);
$cutting_input_date=$splitted_input_date[2]."-".$splitted_input_date[0]."-".$splitted_input_date[1];

$style_details_id= $_GET['style_details_id'];
$style_details_date= $_GET['style_details_date'];



    $select_sql_for_duplicacy="select * from production_details where 
   `production_details`.`input_date`='$cutting_input_date' and
    `production_details`.`order_details_id`='$style_details_id' and
    `production_details`.`ship_date`='$style_details_date'

    ";
$result = mysqli_query($con,$select_sql_for_duplicacy) or die(mysqli_error());

if(mysqli_num_rows($result)>0)
{

    while( $row = mysqli_fetch_array( $result))
    {       
        ?>
        	

			<input type="text" class="form-control" id="received" name="received"
            value="<?php echo $row['daily_cutting_qty'];?>" disabled>
			<input type="hidden" class="form-control" id="received_from_cutting"  name="received_from_cutting"
             value="<?php echo $row['daily_cutting_qty'];?>">

        <?php

       // echo $param=$order_qty."".$plan_cut_qty;

    }

}
else
{?>
    <input type="text" class="form-control" id="received_from_cutting" name="received_from_cutting"
            placeholder="Still No Value Added in Production" disabled>
 <?php

}




$obj->disconnection();

?>














