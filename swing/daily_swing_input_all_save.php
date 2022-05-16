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

$input_date=$_POST['input_date'];
$splitted_input_date=explode("/",$input_date);
$input_date=$splitted_input_date[2]."-".$splitted_input_date[0]."-".$splitted_input_date[1];

$received_cutting_qty=$_POST['received_from_cutting'];

$order_details_id=$_POST['style_details_id'];
$line_no= $_POST['line_no'];


$style_details_date=$_POST['style_details_date'];


$received_from_cutting=$_POST['received_from_cutting'];

$input_date=$_POST['input_date'];
$splitted_input_date=explode("/",$input_date);
$input_date=$splitted_input_date[2]."-".$splitted_input_date[0]."-".$splitted_input_date[1];

$cutting_completed_day=$_POST['cutting_input_date'];
$splitted_input_date=explode("/",$cutting_completed_day);
$cutting_completed_day=$splitted_input_date[2]."-".$splitted_input_date[0]."-".$splitted_input_date[1];

mysqli_query($con,"BEGIN");
mysqli_query($con,"START TRANSACTION") or die(mysqli_error());

 $select_sql_for_duplicacy="select * from `daily_input_for_swing` where
  `order_details_id`='$order_details_id' and `input_date`='$input_date'
   and `line_no`='$line_no' ";

$result = mysqli_query($con,$select_sql_for_duplicacy) or die(mysqli_error());

if(mysqli_num_rows($result)>0)
{

	$data_previously_saved="Yes";

}
else if( mysqli_num_rows($result) < 1)
{
	
echo	 $insert_sql_statement="insert into `daily_input_for_swing`
	(`order_details_id`,`input_date`,`received_cutting_qty`,`line_no`,
	`ship_date`,`cutting_completed_day`,
	 `recording_person_id`, `recording_person_name`,`recording_time` )
	  values ('$order_details_id','$input_date','$received_cutting_qty','$line_no',
	  '$style_details_date','$cutting_completed_day',
	  '$user_id','$user_name',NOW())";

	mysqli_query($con,$insert_sql_statement) or die(mysqli_error());



	if(mysqli_affected_rows($con)<>1)
	{
		$data_insertion_hampering = "Yes";
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
