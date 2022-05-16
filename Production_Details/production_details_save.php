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

$input_date= $_POST['input_date'];

$daily_cutting_qty= $_POST['daily_cutting_qty'];

$line_no = $_POST['line_no'];

$sewing_input_quantity = $_POST['sewing_input_quantity'];


mysqli_query($con,"BEGIN");
mysqli_query($con,"START TRANSACTION") or die(mysqli_error($con));


$select_sql_max_primary_key="SELECT MAX(max_prod_id) as max_prod_id 
FROM (select CONVERT(substring(product_details_id,6,LENGTH(product_details_id)),UNSIGNED) as max_prod_id from production_details) as temp_production_table"; //converted into string and find max

$result_for_max_primary_key = mysqli_query($con,$select_sql_max_primary_key) or die(mysqli_error($con));

$row_for_max_primary_key = mysqli_fetch_array($result_for_max_primary_key);

$row_id=$row_for_max_primary_key['max_prod_id']+1;

if($row_for_max_primary_key['max_prod_id']==0)
{

	$current_style_details_id='prod_1';

}
else
{

	$current_style_details_id ="prod_".($row_for_max_primary_key['max_prod_id']+1);

}

if($line_no == 'select')
{
	$line_no = 0;
}

//  $select_sql_for_duplicacy="SELECT * FROM `production_details`
// 	WHERE `order_details_id`='$order_details_id' AND `input_date`='$input_date' AND `line_no` = '$line_no' AND `daily_cutting_qty` = '$daily_cutting_qty' AND `sewing_input_quantity` = '$sewing_input_quantity'";
$select_sql_for_duplicacy="SELECT * FROM `production_details`
WHERE `order_details_id`='$order_details_id' AND `input_date`='$input_date' AND `line_no` = '$line_no'";

$result = mysqli_query($con,$select_sql_for_duplicacy) or die(mysqli_error($con));

if(mysqli_num_rows($result)>0)
{
	$update_sql_statement = "UPDATE `production_details`
	SET 
		`daily_cutting_qty`='$daily_cutting_qty',
		`sewing_input_quantity`='$sewing_input_quantity',
		`line_no` = '$line_no',
		`recording_person_id`='$user_id',
		`recording_person_name`='$user_name',
		`recording_time`= NOW()
	WHERE 
		`order_details_id`='$order_details_id' AND 
		`input_date`='$input_date' AND
		`line_no` = '$line_no'
		";
	mysqli_query($con,$update_sql_statement) or die(mysqli_error($con));

	$data_previously_saved="Yes";
}
else
{
	$sql_for_line = "SELECT * FROM `production_details`
			WHERE `order_details_id`='$order_details_id' and `input_date`='$input_date'";
		
		$result_for_line = mysqli_query($con,$sql_for_line) or die(mysqli_error($con));

		$line_row = mysqli_fetch_array($result_for_line);

		if(mysqli_num_rows($result_for_line)>0 && $line_row['line_no'] == 0)
		{
			$update_sql_statement = "UPDATE `production_details`
			SET 
				`daily_cutting_qty`='$daily_cutting_qty',
				`sewing_input_quantity`='$sewing_input_quantity',
				`line_no` = '$line_no',
				`recording_person_id`='$user_id',
				`recording_person_name`='$user_name',
				`recording_time`= NOW()
			WHERE 
				`order_details_id`='$order_details_id' AND 
				`input_date`='$input_date'
				";
			mysqli_query($con,$update_sql_statement) or die(mysqli_error($con));

			$data_previously_saved="Yes";
		}
		else
		{
			$insert_sql_statement = "INSERT INTO `production_details` (
				`order_details_id`,
				`input_date`,
				`daily_cutting_qty`,
				`line_no`,
				`sewing_input_quantity`,
				`product_details_id`,
				`recording_person_id`, 
				`recording_person_name`,
				`recording_time` )
			values (
				'$order_details_id',
				'$input_date',
				'$daily_cutting_qty',
				'$line_no',
				'$sewing_input_quantity',
				'$current_style_details_id',
				'$user_id',
				'$user_name',
				NOW())";
			mysqli_query($con,$insert_sql_statement) or die(mysqli_error($con));

			if(mysqli_affected_rows($con)<>1)
			{
				$data_insertion_hampering = "Yes";
			}
		}
}

if($data_previously_saved == "Yes")
{

	//mysqli_query($con,"ROLLBACK");
	//echo "Data is previously saved.";
	mysqli_query($con,"COMMIT");

	echo "Data Updated";

	

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
