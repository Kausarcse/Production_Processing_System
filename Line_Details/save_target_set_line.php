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

$counter = $_POST['counter'];

$input_date = $_POST['input_date'];

$splitted_input_date=explode("/",$input_date);

$input_date=$splitted_input_date[2]."-".$splitted_input_date[0]."-".$splitted_input_date[1];

for ($i=1; $i <= $counter; $i++) {
    $data_insertion_hampering == "No";
    $data_previously_saved="No";
    if(empty($_POST['new_target_'.$i]) || $_POST['style_'.$i]=="select" || $_POST['details_'.$i]=="select")
    {
        continue;
    }

	 $line_number = $_POST['line_'.$i];
	 $style_name = $_POST['style_'.$i];

	 
	 $style_id="SELECT row_id from `style_name` where 
	 `style_name`='$style_name'";
	 $resultstyle_id= mysqli_query($con,$style_id) or die(mysqli_error($con));
	 if(mysqli_num_rows($resultstyle_id)>0)
		{
			while( $row_style_id = mysqli_fetch_array( $resultstyle_id))
			{
				$style_id = $row_style_id['row_id'];

			}
		} 
	 else{
		 $style_id=$style_name;
	 }


	 $details = $_POST['details_'.$i];

	 $splitted_details = explode(", ",$details);
	 $po = $splitted_details[0];
	 $ship_date = $splitted_details[1];
	 $color = $splitted_details[2];

    $total_daily_cutting_qty =isset($_POST['total_daily_cutting_qty_'.$i])?$_POST['total_daily_cutting_qty_'.$i]:"";
	$total_daily_completed_quantity =isset($_POST['total_daily_completed_quantity_'.$i])?$_POST['total_daily_completed_quantity_'.$i]:"";

	$wip =isset($_POST['wip_'.$i])?$_POST['wip_'.$i]:"";

	 $new_target = $_POST['new_target_'.$i];

	//var_dump($_POST);


    $date=gmdate("Y-m-d");
    

	mysqli_query($con,"BEGIN");
   mysqli_query($con,"START TRANSACTION") or die(mysqli_error($con));

  echo $select_sql_for_duplicacy="SELECT * from `daily_target_set_line_details` where 
 `line_no`='$line_number' and `style_details_id`='$style_id' AND `po` = '$po' AND `color` = '$color' AND `ship_date`='$ship_date' AND `input_date`='$input_date' ";

$result = mysqli_query($con,$select_sql_for_duplicacy) or die(mysqli_error($con));

if(mysqli_num_rows($result)>0)
{

	$data_previously_saved="Yes";
    $line_number = "";
    $style_id = "";
    $details ="";

}
else if( mysqli_num_rows($result) < 1)
{	

	 echo $insert_sql_statement="INSERT into `daily_target_set_line_details`
	(`line_no`,`style_details_id`,`po`,`color`,`ship_date`,`total_daily_cutting_qty`,`total_daily_completed_quantity`,`wip`,`new_target`,
	`input_date`,
	 `recording_person_id`, `recording_person_name`,`recording_time` )
	  values ('$line_number','$style_id','$po','$color','$ship_date','$total_daily_cutting_qty','$total_daily_completed_quantity','$wip','$new_target',
     '$input_date',
	  '$user_id','$user_name',NOW())";

	mysqli_query($con,$insert_sql_statement) or die(mysqli_error($con));


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



}


$obj->disconnection();

?>