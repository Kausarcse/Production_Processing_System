<?php
session_start();
require_once("../login/session.php");
include('../login/db_connection_class.php');
$obj = new DB_Connection_Class();
$obj->connection();

$data_previously_saved = "No";
$data_insertion_hampering = "No";

$user_id = $_SESSION['user_id'];
$password = $_SESSION['password'];
$user_name = $_SESSION['user_name'];



$order_details_id= $_POST['order_details_id'];

$line_no = $_POST['line_no'];

$layout_start_time= $_POST['layout_start_time'];

$splitted_start_time=explode("/",$layout_start_time);
$layout_start_time = $splitted_start_time[0]."-".$splitted_start_time[1]."-".$splitted_start_time[2].":00";

$layout_end_time= $_POST['layout_end_time'];

if($layout_end_time != '')
{
	$splitted_end_time=explode("/",$layout_end_time);

	$layout_end_time = $splitted_end_time[0]."-".$splitted_end_time[1]."-".$splitted_end_time[2].":00";
	
}

else
{
	$layout_end_time = '0000-00-00 00:00:00';
}


$total_time = $_POST['total_layout_time'];


$first_output_date=$_POST['first_output_date'];

if($first_output_date != '')
{
	$splitted_first_output_date = explode("/",$first_output_date);
	$first_output_date = $splitted_first_output_date[0]."-".$splitted_first_output_date[1]."-".$splitted_first_output_date[2];	
}
else
{
	$first_output_date = '0000-00-00';
}

mysqli_query($con,"BEGIN");
mysqli_query($con,"START TRANSACTION") or die(mysqli_error($con));

$select_sql_for_duplicacy="SELECT * FROM swing_production_planning 
WHERE order_details_id = '$order_details_id' AND line_no = '$line_no'";

$result = mysqli_query($con,$select_sql_for_duplicacy) or die(mysqli_error($con));

if(mysqli_num_rows($result)>0)
{

	$data_previously_saved="Yes";

	 $update_sql_statement = "UPDATE swing_production_planning SET 
								layout_start_time = '$layout_start_time', layout_end_time = '$layout_end_time',
								total_time = '$total_time', first_output_date = '$first_output_date',
								recording_person_id = '$user_id', recording_person_name = '$user_name', recording_time = NOW()
							WHERE order_details_id = '$order_details_id' AND line_no = '$line_no'";

	mysqli_query($con,$update_sql_statement) or die(mysqli_error($con));

}
else if( mysqli_num_rows($result) < 1)
{

	$select_sql_max_primary_key="SELECT MAX(max_swing_id) as max_swing_id 
	FROM (SELECT CONVERT(substring(swing_id,7,LENGTH(swing_id)),UNSIGNED) as max_swing_id FROM swing_production_planning) as temp_swing_table"; //converted into string and find max

    $result_for_max_primary_key = mysqli_query($con,$select_sql_max_primary_key) or die(mysqli_error($con));
    
    $row_for_max_primary_key = mysqli_fetch_array($result_for_max_primary_key);

    $row_id=$row_for_max_primary_key['max_swing_id']+1;

    if($row_for_max_primary_key['max_swing_id']==0)
    {

    	$current_swing_id='swing_1';

    }
    else
    {

    	$current_swing_id ="swing_".($row_for_max_primary_key['max_swing_id']+1);

    }

	$insert_sql_statement = "INSERT INTO swing_production_planning (
									order_details_id, 
									line_no, 
									swing_id,
									layout_start_time, 
									layout_end_time, 
									total_time, 
									first_output_date, 
									recording_person_id,
									recording_person_name,
									recording_time)
							 VALUES (
								 	'$order_details_id',
									'$line_no',
									'$current_swing_id',
									'$layout_start_time',
									'$layout_end_time',
									'$total_time',
									'$first_output_date',
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

	mysqli_query($con,"COMMIT");
	echo "Data is Successfully updated.";

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
