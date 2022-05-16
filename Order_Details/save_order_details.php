<?php
session_start();
require_once("../login/session.php");
include('../login/db_connection_class.php');
$obj = new DB_Connection_Class();
$obj->connection();



$data_previously_saved = "No";
$data_insertion_hampering = "No";

/*$user_name ="Iftekhar";
$user_id ="Iftekhar";
$password ="1234";*/

$user_id = $_SESSION['user_id'];
$password = $_SESSION['password'];
$user_name = $_SESSION['user_name'];


$style_details_id= $_POST['order_details_id'];
$po= $_POST['po'];
$color=$_POST['color'];

$order_qty= $_POST['order_quantity'];
$plan_cut_qty= $_POST['plan_cut_quantity'];

$pcd= $_POST['pcd'];

$ship_date=$_POST['ship_date'];
$splitted_ship_date=explode("/",$ship_date);

$ship_date=$splitted_ship_date[2]."-".$splitted_ship_date[0]."-".$splitted_ship_date[1];

 mysqli_query($con,"BEGIN");
 mysqli_query($con,"START TRANSACTION") or die(mysqli_error($con));

 $select_sql_for_duplicacy="select * from `order_details` where `style_details_id`='$style_details_id' and `po`='$po' and `color`='$color' and 
`ship_date`='$ship_date'";

 $result = mysqli_query($con,$select_sql_for_duplicacy) or die(mysqli_error($con));

 if(mysqli_num_rows($result) > 0)
{

	$data_previously_saved="Yes";

}
else if( mysqli_num_rows($result) < 1)
{
	$select_sql_max_primary_key="SELECT MAX(max_order_id) AS max_order_id FROM 
								(SELECT CONVERT(substring(order_details_id,7,LENGTH(order_details_id)),UNSIGNED) as max_order_id FROM order_details) as temp_order_table"; //converted into string and find max

    $result_for_max_primary_key = mysqli_query($con,$select_sql_max_primary_key) or die(mysqli_error($con));
    
    $row_for_max_primary_key = mysqli_fetch_array($result_for_max_primary_key);

    $row_id=$row_for_max_primary_key['max_order_id']+1;

    if($row_for_max_primary_key['max_order_id']==0)
    {

    	$current_order_details_id='order_1';

    }
    else
    {

    	$current_order_details_id ="order_".($row_for_max_primary_key['max_order_id']+1);

    }

	 $insert_sql_statement="insert into `order_details` (
		 `style_details_id`,
		 `po`,
		 `color`,
		 `order_qty`,
		 `plan_cut_qty`,
		 `pcd`,
		 `ship_date`,
		 `order_details_id`,
	 	 `recording_person_id`, 
		  `recording_person_name`,
		  `recording_time` )
	  values (
		  '$style_details_id',
		  '$po',
		  '$color',
		  '$order_qty',
		  '$plan_cut_qty',
      	  '$pcd',
		  '$ship_date',
		  '$current_order_details_id',
	  	   '$user_id',
		   '$user_name',
		   NOW())";

	mysqli_query($con,$insert_sql_statement) or die(mysqli_error($con));


	if(mysqli_affected_rows($con)<>1)
	{
		$data_insertion_hampering = "Yes";
	}
	else
	{
		
	}
}

if($data_previously_saved == "Yes")
{

	mysqli_query($con,"ROLLBACK");
	echo "Data is previously saved.";

}
else if($data_insertion_hampering == "No" )
{

	mysqli_query($con,"COMMIT");
	echo "Data is successfully saved.";

}
else
{

	mysqli_query($con,"ROLLBACK");
	echo "Data is not successfully saved.";

}






$obj->disconnection();

?>
