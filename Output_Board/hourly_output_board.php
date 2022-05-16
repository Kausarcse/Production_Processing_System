<?php
session_start();
require_once("../login/session.php");
include('../login/db_connection_class.php');
$obj = new DB_Connection_Class();
$obj->connection();
/*
$user_id = $_SESSION['user_id'];
$password = $_SESSION['password'];

$sql="select * from hrm_info.user_login where user_id='$user_id' and `password`='$password'";

$result=mysqli_query($con,$sql) or die(mysql_error());
if(mysql_num_rows($result)<1)
{

	header('Location:logout.php');

}
*/
?>
<script type='text/javascript' src='swing/swing_production_info_form_validation.js'></script>

<style>

.form-group		/* This is for reducing Gap among Form's Fields */
{

	margin-bottom: 5px;

}
.row.no-gutter {
  margin-left: 0;
  margin-right: 0;
}

</style>


    <!-- Custom fonts for this template -->
    <link href="./vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./vendor/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="./vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <!-- Page level plugins -->
    <script src="./vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="./vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="./vendor/js/demo/datatables-demo.js"></script>

<script>

function Remove_Value_Of_This_Element(element_name)
{

	 document.getElementById(element_name).value='';
	 var alternate_field_of_date = "alternate_"+element_name;

	 if(typeof(alternate_field_of_date) != 'undefined' && alternate_field_of_date != null) // This is for deleting Alternative Field of Date if exists
	 {
		document.getElementById(alternate_field_of_date).value='';
	 }

}

function Reset_Radio_Button(radio_element)
{

		var radio_btn = document.getElementsByName(radio_element);
		for(var i=0;i<radio_btn.length;i++) 
		{
				radio_btn[i].checked = false;
		}


}

function Reset_Checkbox(checkbox_element)
{
		for(var i=0;i<checkbox_element.length;i++)
		{

				checkbox_element[i].checked = false;

		}
}

function mouseover()
{
  document.getElementById("span_id").style.display="block";
}

function mouseout()
{
  document.getElementById("span_id").style.display="none";
}


 function sending_data_of_swing_production_info_form_for_saving_in_database()
 {


       var validate = Swing_Production_Info_Form_Validation();
       var url_encoded_form_data = $("#swing_production_info_form").serialize(); //This will read all control elements value of the form	
       if(validate != false)
	   {
		  	 $.ajax({
			 		url: 'swing/swing_production_info_saving.php',
			 		dataType: 'text',
			 		type: 'post',
			 		contentType: 'application/x-www-form-urlencoded',
			 		data: url_encoded_form_data,
			 		success: function( data, textStatus, jQxhr )
			 		{
			 				alert(data);
							 console.log(data)
			 				//$("#database_table").load("swing_production_info.php #database_table")
			 				 // if(data== "Data is successfully saved.")
				     //          {  
					    //             var url_encoded_form_data = $("#process_program_info_form").serialize();

					    //             $.ajax({
					    //             url: 'process_program/returning_row_id_for_process_program_info.php',
					    //             dataType: 'text',
					    //             type: 'post',
					    //             contentType: 'application/x-www-form-urlencoded',
					    //             data: url_encoded_form_data,
					    //             success: function( data, textStatus, jQxhr )
					    //             { 


					    //               /*alert(data);*/
					    //               $('#element').load('process_program/process_program_info_preview.php?pp_num_id='+data);
					    //               $('#div_table').hide();

					                    
					    //             },
					    //             error: function( jqXhr, textStatus, errorThrown )
					    //             {
					       
					    //                 alert(errorThrown);
					    //             }
					    //          }); // End of $.ajax({
				     //          }
			 		},
			 		error: function( jqXhr, textStatus, errorThrown )
			 		{
			 				//console.log( errorThrown );
			 				alert(errorThrown);
			 		}
			 }); // End of $.ajax({

       }//End of if(validate != false)

 }//End of function sending_data_of_process_program_info_form_for_saving_in_database()


 function sending_data_for_delete(row_id)
 {
      
       var url_encoded_form_data = 'row_id='+row_id;
       
		  	 $.ajax({
			 		url: 'swing/deleting_swing_production_info.php',
			 		dataType: 'text',
			 		type: 'post',
			 		contentType: 'application/x-www-form-urlencoded',
			 		data: url_encoded_form_data,
			 		success: function( data, textStatus, jQxhr )
			 		{
			 				alert(data);

			 		},
			 		error: function( jqXhr, textStatus, errorThrown )
			 		{
			 				//console.log( errorThrown );
			 				alert(errorThrown);
			 		}
			 }); // End of $.ajax({



 }//End of function sending_data_for_delete()


 /***************************************************** FOR AUTO COMPLETE********************************************************************/

$('.for_auto_complete').chosen();


/***************************************************** FOR AUTO COMPLETE********************************************************************/


//days comparison
function date_comparison()
{
	var start_date = document.getElementById('swing_start_date').value;
	var end_date = document.getElementById('swing_end_date').value;
	var leave;
	if (document.getElementById('leave').value) 
	{
		var leave = document.getElementById('leave').value;
	}
	else
	{
		var leave = 0;
	}
	
	// alert(start_date);
	// alert(end_date);

	var date1 = new Date(start_date);
	var date2 = new Date(end_date);

	const diffInMs = Math.abs(date2.getTime() - date1.getTime());
	//alert(diffInMs);
  	const diffTime = (diffInMs / (1000 * 60 * 60 * 24)) - leave;
  	//alert(diffTime);

	document.getElementById('total_days').value = 	diffTime;
}

function calculation_cumulative_quantity()
{
	
}


function calculation_total_leave()
{
	var start_date = document.getElementById('swing_start_date').value;
	var end_date = document.getElementById('swing_end_date').value;
	var leave;
	if (document.getElementById('total_leave').value) 
	{
		var leave = document.getElementById('total_leave').value;
	}
	else
	{
		var leave = 0;
	}
	
	// alert(start_date);
	// alert(end_date);

	var date1 = new Date(start_date);
	var date2 = new Date(end_date);

	const diffInMs = Math.abs(date2.getTime() - date1.getTime());
	//alert(diffInMs);
  	const diffTime = (diffInMs / (1000 * 60 * 60 * 24)) - leave;
  	//alert(diffTime);

	document.getElementById('total_days').value = 	diffTime;
	document.getElementById('total_days_hidden').value = 	diffTime;

	
	var allocated_quantity = document.getElementById('allocated_quantity').value;
	
	alert(allocated_quantity);

	var calculation_cumulative_quantity = allocated_quantity/diffTime;
	document.getElementById('cumulative_target').value=calculation_cumulative_quantity;
	document.getElementById('cumulative_target_hidden').value=calculation_cumulative_quantity;

	

}

function calculate_target_hour()
{
	alert(document.getElementById('targeted_hour').value)
	alert(document.getElementById('cumulative_target').value)

	document.getElementById('hourly_target').value=document.getElementById('cumulative_target').value/document.getElementById('targeted_hour').value
}

function line_select()
{
	let line=line_no.value;
	alert(line);

}
</script>

<style>
    div.dataTables_wrapper div.dataTables_length select {
    width: 42px;
    display: inline-block;
}
    </style>


<div class="col-sm-12 col-md-12 col-lg-12" style="font-size: 14px;">

		<div class="panel panel-default"> <!-- This div will create a block/panel for FORM -->

            <div id="element">

				<div class="panel-heading" style="color:#191970;"><b>Output Board</b></div> <!-- This will create a upper block for FORM (Just Beautification) -->

				<nav aria-label="breadcrumb">
					  <ol class="breadcrumb">
					    <li class="breadcrumb-item active" aria-current="page">Home</li>
					    <li class="breadcrumb-item"><a onclick="load_page('swing/swing_production_info.php')">Hourly Output Board</a></li>
					  </ol>
				 </nav>
            </div> 
			<?php

$select_sql_for_duplicacy="select distinct hour.order_details_id order_details_id,
hour.input_date as input_date,hour.line_no as line_no,hour.ship_date as ship_date,
(select distinct target_per_line.hourly_target as  hourly_target 
from target_output_set_per_line 
 target_per_line,`line_wise_input_per_hour`  ashour
 where

 ashour.order_details_id=target_per_line.order_details_id
 and   ashour.line_no=target_per_line.line_no
 and `ashour`.`ship_date`=target_per_line.ship_date

 ) hourly_target
from `line_wise_input_per_hour`  hour


ORDER BY hour.`recording_time` DESC";
$result = mysqli_query($con,$select_sql_for_duplicacy) or die(mysqli_error());


			?>


                    <!-- DataTales Example -->
                    <div class="card shadow mb-4" style="font-size: 14px;">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Hourly Output Board Details</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
											<th>Date</th>   
                                        	<th>Line</th>                                          
                                            <th>Style Number</th>                                          
                                            <th>Ship Date</th>
											<th>Hourly Target</th>
                                            <th>1st Hour</th>
                                            <th>2nd Hour</th>
                                            <th>3rd Hour</th>
                                            <th>4th Hour</th>
											<th>5th Hour</th>
                                            <th>6th Hour</th>
                                            <th>7th Hour</th>
                                            <th>8th Hour</th>
											<th>9th Hour</th>
                                            <th>10th Hour</th>
											<th>11th Hour</th>
											<th>12th Hour</th>
											<th>13th Hour</th>
											<th>14th Hour</th>
											<th>15th Hour</th>
											<th>16th Hour</th>
                                          
                                        </tr>
                                    </thead>                                   
                                    <tbody>
                                       

										<?php
								if(mysqli_num_rows($result)>0)
								{

								while( $row = mysqli_fetch_array( $result))
										{
											  ?>   
 											<tr>

											<th><?php echo $row['input_date'];?></th>  
                                            <td><?php echo $line_no=$row['line_no'];?></td>
                                            <td><?php echo $order_details_id=$row['order_details_id'];?></td> 
											<td><?php echo $ship_date=$row['ship_date'];?></td>                                           
                                            <td><?php echo $hourly_target=$row['hourly_target'];?></td>


<?php

 $hour="SELECT * FROM `line_wise_input_per_hour` 
where `line_no`='$line_no' and 
`order_details_id`='$order_details_id'
and `ship_date`='$ship_date'
ORDER BY 
`line_wise_input_per_hour`.`hour_no` asc
";
$result_hour = mysqli_query($con,$hour) or die(mysqli_error());
if(mysqli_num_rows($result_hour)>0)
{

	$k=1;
while( $row_hour = mysqli_fetch_array( $result_hour))
		{
			echo $hour_number=$row_hour['hour_no'];
			if($hour_number===$k)
			{
				?>

				<td><?php echo $row_hour['hour_no'];?></td>


				<?php

			}
			else
			{
				for ($i=$k; $i<$hour_number ; $i++) { 
					echo '<td></td>';
					$k++;

				}
				$k++;

				?>
				<td><?php echo $row_hour['hour_no'];?></td>
				<?php

			}
			
			

		}
		if($k<20)
			{
				for ($i=$k; $i <=16 ; $i++) { 
					echo '<td>'.'</td>';

				}				

			}
	}
?>

                                                 
											 
											</tr>
											  <?php

										}
									}
										?>
											                                    
                                          
                                    
                                        

										
                                       
                                      
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    
		</div> <!-- End of <div class="panel panel-default"> -->

</div> <!-- End of <div class="col-sm-12 col-md-12 col-lg-12"> -->