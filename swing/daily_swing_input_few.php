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

$input_date=$_GET['input_date'];

$splitted_ship_date=explode("/",$input_date);

$input_date=$splitted_ship_date[2]."-".$splitted_ship_date[0]."-".$splitted_ship_date[1];


   $select_sql_for_duplicacy="select * from production_details where 
   `production_details`.`order_details_id`='$order_details_id' and
    `production_details`.`input_date`='$input_date' ";
$result = mysqli_query($con,$select_sql_for_duplicacy) or die(mysqli_error());

if(mysqli_num_rows($result)>0)
{

    while( $row = mysqli_fetch_array( $result))
    {       
        ?>
        	

			<input type="text" class="form-control" id="from_cutting" value="<?php echo $row['daily_cutting_qty'];?>" disabled>
			<input type="hidden" class="form-control" id="received_from_cutting"  name="received_from_cutting"
             value="<?php echo $row['daily_cutting_qty'];?>">

        <?php

       // echo $param=$order_qty."".$plan_cut_qty;

    }

}
else if( mysqli_num_rows($result) < 1)
{
    ?>
        <input type="hidden" class="form-control" id="received_from_cutting" name="received_from_cutting"
          placeholder="Yet No value Added from Production" value="0" >

    <input type="text" class="form-control" id="from_cutting"  placeholder="Yet No value Added from Production" disabled>
<?php
}




$obj->disconnection();

?>














