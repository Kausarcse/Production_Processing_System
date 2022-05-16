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


$style_details_id= $_POST['style_details_id'];

$order_details_id= $_POST['order_details_id'];

$line_no= $_POST['line_no'];

$allocated_qty= $_POST['line_allocated_qty'];

$plan_input_date=$_POST['plan_input_date'];
$splitted_plan_input_date=explode("/",$plan_input_date);
$plan_input_date=$splitted_plan_input_date[2]."-".$splitted_plan_input_date[0]."-".$splitted_plan_input_date[1];

$plan_output_start_date= $_POST['plan_output_start_date'];
$splitted_plan_output_start_date=explode("/",$plan_output_start_date);
$plan_output_start_date=$splitted_plan_output_start_date[2]."-".$splitted_plan_output_start_date[0]."-".$splitted_plan_output_start_date[1];

$plan_output_end_date= $_POST['plan_output_end_date'];
$splitted_plan_output_end_date=explode("/",$plan_output_end_date);
$plan_output_end_date=$splitted_plan_output_end_date[2]."-".$splitted_plan_output_end_date[0]."-".$splitted_plan_output_end_date[1];

$total_leave= $_POST['total_leave'];
$top_target= $_POST['top_target'];


 mysqli_query($con,"BEGIN");
 mysqli_query($con,"START TRANSACTION") or die(mysqli_error($con));

 $select_sql_for_duplicacy="select * from `plan_details` where `order_details_id`='$order_details_id' and
 `line_no`='$line_no' and `plan_input_date`='$plan_input_date' and `plan_output_start_date`='$plan_output_start_date' and `plan_output_end_date`='$plan_output_end_date'";

$result = mysqli_query($con,$select_sql_for_duplicacy) or die(mysqli_error($con));

if(mysqli_num_rows($result)>0)
{

	$data_previously_saved="Yes";

}
else if( mysqli_num_rows($result) < 1)
{
	$select_sql_max_primary_key="SELECT MAX(max_plan_id) AS max_plan_id 
								FROM (select CONVERT(substring(plan_details_id,6,LENGTH(plan_details_id)),UNSIGNED) AS max_plan_id FROM plan_details) AS temp_plan_table"; 

    $result_for_max_primary_key = mysqli_query($con,$select_sql_max_primary_key) or die(mysqli_error($con));
    
    $row_for_max_primary_key = mysqli_fetch_array($result_for_max_primary_key);

    $row_id=$row_for_max_primary_key['max_plan_id']+1;

    if($row_for_max_primary_key['max_plan_id']==0)
    {

    	$current_plan_details_id='plan_1';

    }
    else
    {

    	$current_plan_details_id ="plan_".($row_for_max_primary_key['max_plan_id']+1);

    }

	 $insert_sql_statement="INSERT INTO `plan_details` (
		 order_details_id,
		 plan_details_id,
		 line_no,
		`allocated_qty`,
		`plan_input_date`,
		`plan_output_start_date`,
    	`plan_output_end_date`,
		`total_leave`,
		`top_target`,
    	`recording_person_id`, 
		`recording_person_name`,
		`recording_time` )
	  values (
		'$order_details_id',
		'$current_plan_details_id',
		'$line_no',
		'$allocated_qty',
		'$plan_input_date',
		'$plan_output_start_date',
    	'$plan_output_end_date',
		'$total_leave',
		'$top_target',
	  	'$user_id','$user_name',NOW())";

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
