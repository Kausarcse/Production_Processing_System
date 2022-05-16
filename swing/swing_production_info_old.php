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



<div class="col-sm-12 col-md-12 col-lg-12">

		<div class="panel panel-default"> <!-- This div will create a block/panel for FORM -->

            <div id="element">

				<div class="panel-heading" style="color:#191970;"><b>Sewing Production Info</b></div> <!-- This will create a upper block for FORM (Just Beautification) -->

				<nav aria-label="breadcrumb">
					  <ol class="breadcrumb">
					    <li class="breadcrumb-item active" aria-current="page">Home</li>
					    <li class="breadcrumb-item"><a onclick="load_page('swing/swing_production_info.php')">Sewing Production Info</a></li>
					  </ol>
				 </nav>

				<form class="form-horizontal" action="" style="margin-top:10px;" name="swing_production_info_form" id="swing_production_info_form">
						
						<div class="form-group form-group-sm" id="form-group_for_customer_name">
							<label class="control-label col-sm-3" for="buyer_name" style="margin-right:0px; color:#00008B;">Buyer Name:<span style="color:red"> *</span></label>
							<div class="col-sm-6">
								<select  class="form-control for_auto_complete" id="buyer_name" name="buyer_name">
											<option select="selected" value="select">Select Customer Name</option>
											<?php 
												 $sql = 'select * from `buyer` order by `buyer_name`';
												 $result= mysqli_query($con,$sql) or die(mysql_error);
												 while( $row = mysqli_fetch_array( $result))
												 {

													 echo '<option value="'.$row['buyer_id'].'">'.$row['buyer_name'].'</option>';

												 }

											 ?>
								</select>
							</div>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_customer_name"> -->


						<div class="form-group form-group-sm" id="form-group_for_pp_number">
								<label class="control-label col-sm-3" for="order_qty" style="color:#00008B;">Order Quantity:<span style="color:red"> *</span> </label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="order_qty" name="order_qty" placeholder="Enter Order Quantity" required>
								</div>
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('order_qty')"></i>
						</div> 

						

						<div class="form-group form-group-sm" id="form-group_for_customer_name">
						<label class="control-label col-sm-3" for="style_no" style="margin-right:0px; color:#00008B;">Style No:<span style="color:red"> *</span></label>
							<div class="col-sm-6">
								<select  class="form-control for_auto_complete" id="style_no" name="style_no">
											<option select="selected" value="select">Select Style No</option>
											<?php 
												 $sql = 'select * from `style_name` order by `style_name`';
												 $result= mysqli_query($con,$sql) or die(mysql_error);
												 while( $row = mysqli_fetch_array( $result))
												 {

													 echo '<option value="'.$row['style_id'].'">'.$row['style_name'].'</option>';

												 }

											 ?>
								</select>
							</div>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_customer_name"> -->



						<div class="form-group form-group-sm" id="form-group_for_customer_name">
						<label class="control-label col-sm-3" for="color" style="margin-right:0px; color:#00008B;">Color:<span style="color:red"> *</span></label>
							<div class="col-sm-6">
								<select  class="form-control for_auto_complete" id="color" name="color">
											<option select="selected" value="select">Select Color</option>
											<?php 
												 $sql = 'select * from `color` order by `color_name`';
												 $result= mysqli_query($con,$sql) or die(mysql_error);
												 while( $row = mysqli_fetch_array( $result))
												 {
													 echo '<option value="'.$row['color_id'].'">'.$row['color_name'].'</option>';

												 }
											 ?>
								</select>
							</div>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_customer_name"> -->


						<div class="form-group form-group-sm " id="form-group_for_pp_creation_date">
								<label class="control-label col-sm-3" for="ship_date" style="color:#00008B;">Ship Date:<span style="color:red"> *</span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="ship_date" name="ship_date" placeholder="Enter Ship Date" required>
								</div>
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
								</div> -->
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('ship_date')"></i>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->
								<script>
									$( function()
									{
										$( "#ship_date" ).datepicker(
										{
											showWeek: true, // This is for Showing Week in Datepicker Calender.
											altField: "#alternate_ship_date", // This is for Descriptive Date Showing in Alternative Field.
											altFormat: "DD, d MM, yy" // This is for Descriptive Date Format in Alternative Field.
										}
										); // End of $( "#pp_creation_date" ).datepicker(

										$( "#ship_date" ).datepicker( "option", "dateFormat", "mm/dd/yy" ); // This is for Date Format in Actual Date Field.
										$( "#ship_date" ).datepicker( "option", "showAnim", "drop" ); // This is for Datepicker Calender Animation in Actual Date Field.
									}
									); // End of $( function()
								</script>

						

						<div class="form-group form-group-sm " id="form-group_for_pp_creation_date">
								<label class="control-label col-sm-3" for="smv" style="color:#00008B;">SMV:<span style="color:red"> *</span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="smv" name="smv" placeholder="Enter SMV" required>
								</div>
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
								</div> -->
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('smv')"></i>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->

							
						<div class="form-group form-group-sm" id="form-group_for_pp_number">
								<label class="control-label col-sm-3" for="po_number" style="color:#00008B;">PO Number:</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="po_number" name="po_number" placeholder="Enter PO Numbar">
								</div>
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('po_number')"></i>
						</div> 


						<div class="form-group form-group-sm" id="form-group_for_customer_name">
							<label class="control-label col-sm-3" for="line_no" style="margin-right:0px; color:#00008B;">Line No:<span style="color:red"> *</span></label>
							<div class="col-sm-6">
								<select  class="form-control for_auto_complete" id="line_no" name="line_no">
											<option select="selected" value="select">Select Unit Wise Line No</option>
											<?php 
												 $sql = 'select * from `line_info` order by `line`';
												 $result= mysqli_query($con,$sql) or die(mysql_error);
												 while( $row = mysqli_fetch_array( $result))
												 {
													 echo '<option value="'.$row['id'].'">Unit:'.$row['unit'].', Line: '.$row['line'].', '.$row['description'].'</option>';

												 }

											 ?>
								</select>
							</div>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_customer_name"> -->



						<div class="form-group form-group-sm" id="form-group_for_pp_number">
								<label class="control-label col-sm-3" for="allocated_quantity" style="color:#00008B;">Allocated Qunatity:<span style="color:red"> *</span></label>
								<div class="col-sm-6">

									<input type="text" class="form-control" id="allocated_quantity" name="allocated_quantity" placeholder="Enter Allocated Qunatity">
								</div>
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('allocated_quantity')"></i>
						</div> 




						<div class="form-group form-group-sm " id="form-group_for_pp_creation_date">
								<label class="control-label col-sm-3" for="swing_start_date" style="color:#00008B;">Sewing Start Date:<span style="color:red"> *</span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="swing_start_date" name="swing_start_date" placeholder="Enter Sewing Start Date" required>
								</div>
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
								</div> -->
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('swing_start_date')"></i>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->
								<script>
									$( function()
									{
										$( "#swing_start_date" ).datepicker(
										{
											showWeek: true, // This is for Showing Week in Datepicker Calender.
											altField: "#alternate_swing_start_date", // This is for Descriptive Date Showing in Alternative Field.
											altFormat: "DD, d MM, yy" // This is for Descriptive Date Format in Alternative Field.
										}
										); // End of $( "#pp_creation_date" ).datepicker(

										$( "#swing_start_date" ).datepicker( "option", "dateFormat", "mm/dd/yy" ); // This is for Date Format in Actual Date Field.
										$( "#swing_start_date" ).datepicker( "option", "showAnim", "drop" ); // This is for Datepicker Calender Animation in Actual Date Field.
									}
									); // End of $( function()
								</script>


						<div class="form-group form-group-sm " id="form-group_for_pp_creation_date">
								<label class="control-label col-sm-3" for="swing_end_date" style="color:#00008B;">Sewing End Date:<span style="color:red"> *</span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="swing_end_date" name="swing_end_date" placeholder="Enter Sewing End Date" required>
								</div>
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_end_date" name="alternate_swing_end_date" readonly>
								</div> -->
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('swing_end_date')"></i>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->
								<script>
									$( function()
									{
										$( "#swing_end_date" ).datepicker(
										{
											showWeek: true, // This is for Showing Week in Datepicker Calender.
											altField: "#alternate_swing_end_date", // This is for Descriptive Date Showing in Alternative Field.
											altFormat: "DD, d MM, yy" // This is for Descriptive Date Format in Alternative Field.
										}
										); // End of $( "#pp_creation_date" ).datepicker(

										$( "#swing_end_date" ).datepicker( "option", "dateFormat", "mm/dd/yy" ); // This is for Date Format in Actual Date Field.
										$( "#swing_end_date" ).datepicker( "option", "showAnim", "drop" ); // This is for Datepicker Calender Animation in Actual Date Field.
									}
									); // End of $( function()
								</script>



						<div class="form-group form-group-sm" id="form-group_for_pp_number">
								<label class="control-label col-sm-3" for="leave" style="color:#00008B;">Total Leave:</label>
								<div class="col-sm-6">
									<input type="number" class="form-control" id="total_leave" name="total_leave" placeholder="Enter Total Leave" onchange="calculation_total_leave()">
								</div>
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('leave')"></i>
						</div> 

						<div class="form-group form-group-sm" id="form-group_for_pp_number">
								<label class="control-label col-sm-3" for="total_days" style="color:#00008B;">Total working days: </label>
								<div class="col-sm-6">
								<input type="hidden" class="form-control" id="total_days_hidden" name="total_days_hidden" placeholder="Total working days">

									<input type="text" class="form-control" id="total_days" name="total_days" placeholder="Total working days" disabled>
								</div>
						</div> 

						<div class="form-group form-group-sm" id="form-group_for_pp_number">
								<label class="control-label col-sm-3" for="cumulative_target" style="color:#00008B;">Cumulative Target:</label>
								<div class="col-sm-6">
								<input type="hidden" class="form-control" id="cumulative_target_hidden" name="cumulative_target_hidden">

									<input type="text" class="form-control" id="cumulative_target" name="cumulative_target" disabled  >
								</div>
						</div> 
						

						
						<div class="form-group form-group-sm" id="form-group_for_pp_number">
								<label class="control-label col-sm-3" for="targeted_hour" style="color:#00008B;">Targeted hour:<span style="color:red"> *</span></label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="targeted_hour" name="targeted_hour" placeholder="Enter targeted hour" required onchange="calculate_target_hour()">
								</div>
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('targeted_hour')"></i>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_number"> -->

						
						
						<div class="form-group form-group-sm" id="form-group_for_pp_number">
								<label class="control-label col-sm-3" for="hourly_target" style="color:#00008B;">Hourly Target:</span></label>
								<div class="col-sm-6">
								<input type="hidden" class="form-control" id="hourly_target_hidden" name="hourly_target_hidden" placeholder="Hourly Target">

									<input type="text" class="form-control" id="hourly_target" name="hourly_target" placeholder="Hourly Target" disabled>
								</div>
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('hourly_target')"></i>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_number"> -->



					

					
						<div class="form-group form-group-sm" id="form-group_for_pp_number">
								<label class="control-label col-sm-3" for="manpower" style="color:#00008B;">Manpower:<span style="color:red"> *</span></label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="manpower" name="manpower" placeholder="Enter Manpower" required >
								</div>
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('manpower')"></i>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_number"> -->

	
						



						<div class="form-group form-group-sm">
								<div class="col-sm-offset-3 col-sm-6">
									<button type="button" class="btn btn-primary" onClick="sending_data_of_swing_production_info_form_for_saving_in_database()">Submit</button>
									<button type="reset" class="btn btn-success">Reset</button>
								</div>
						</div>

				</form>

		</div> <!-- End of <div class="panel panel-default"> -->




</div> <!-- End of <div class="col-sm-12 col-md-12 col-lg-12"> -->