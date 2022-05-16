<?php

class DB_Connection_Class{

	 function connection()
	 {
		   global $con;
		  /*$con = mysqli_connect("localhost","root","","znz_qc");*/
		  $con = mysqli_connect("localhost","root","","processing");
		  //$con = mysqli_connect("localhost","root","O@s@t708s\$H\$a461","processing");
		
		  if (!$con)
		  {			
				die('Could not connect: ' . mysqli_error());	
		  }
		  
/*		  mysql_select_db("inventory_final_development", $con);
*/	  
	 }
 
 
   function disconnection()
   {
		global $con;
		mysqli_close($con);
   }

	function wip($con,$order_details_id,$ship_date,$po,$color)
	{
		$wip ="SELECT * FROM `wip_view` where
		order_details_id='$order_details_id'
		and
		ship_date='$ship_date'
		and
		po='$po'
		and
		color='$color'";

		$wip_view = mysqli_query($con,$wip);
		while($row_wip = mysqli_fetch_assoc($wip_view))
		{
			return  $wip_data = $row_wip['WIP'];
		}
	}
}
?>
