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


$buyer_name= $_POST['buyer_name'];
$style_no= $_POST['style_no'];
$smv=$_POST['smv'];

$item_name= $_POST['item_name'];


 mysqli_query($con,"BEGIN");
 mysqli_query($con,"START TRANSACTION") or die(mysqli_error($con));

 $select_sql_for_duplicacy="select * from `style_details` where `buyer_no`='$buyer_name' and `style_no`='$style_no' and `smv`='$smv' and 
`item_name`='$item_name'";

$result = mysqli_query($con,$select_sql_for_duplicacy) or die(mysqli_error($con));

if(mysqli_num_rows($result)>0)
{

	$data_previously_saved="Yes";

}
else if( mysqli_num_rows($result) < 1)
{
	
	$select_sql_max_primary_key="select MAX(max_style_id) as max_style_id FROM (select CONVERT(substring(style_details_id,14,LENGTH(style_details_id)),UNSIGNED) as max_style_id from style_details) as temp_style_table"; //converted into string and find max

    $result_for_max_primary_key = mysqli_query($con,$select_sql_max_primary_key) or die(mysqli_error($con));
    
    $row_for_max_primary_key = mysqli_fetch_array($result_for_max_primary_key);

    $row_id=$row_for_max_primary_key['max_style_id']+1;

    if($row_for_max_primary_key['max_style_id']==0)
    {

    	$current_style_details_id='style_detail_1';

    }
    else
    {

    	$current_style_details_id ="style_detail_".($row_for_max_primary_key['max_style_id']+1);

    }

	 $insert_sql_statement="insert into `style_details` (
		`buyer_no`,
		`style_no`,
		`smv`,
		`item_name`,
		`style_details_id`,
	 	`recording_person_id`,
		`recording_person_name`,
		`recording_time` )
	  values (
			'$buyer_name',
			'$style_no',
			'$smv',
			'$item_name',
			'$current_style_details_id',
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
