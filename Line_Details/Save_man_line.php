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


for ($i=1; $i <=20 ; $i++) { 
    $line_number=$i;
     $operator= $_POST['operator'.$i];
     $helper= $_POST['helper'.$i];
     $iron_man=$_POST['iron_man'.$i];
      
    $date=gmdate("Y-m-d");
    


 mysqli_query($con,"BEGIN");
 mysqli_query($con,"START TRANSACTION") or die(mysqli_error());

  $select_sql_for_duplicacy="select * from `line_man_power_details` where 
 `line_no`='$line_number' and `date`='$date'";


$result = mysqli_query($con,$select_sql_for_duplicacy) or die(mysqli_error());

if(mysqli_num_rows($result)>0)
{

	$data_previously_saved="Yes";

}
else if( mysqli_num_rows($result) < 1)
{	


	 $insert_sql_statement="insert into `line_man_power_details`
	(`date`,`line_no`,`operator`,`Helper`,`iron_man`,
	 `recording_person_id`, `recording_person_name`,`recording_time` )
	  values ('$date','$line_number','$operator','$helper','$iron_man',
     
	  '$user_id','$user_name',NOW())";

	mysqli_query($con,$insert_sql_statement) or die(mysqli_error());


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



}


$obj->disconnection();

?>
