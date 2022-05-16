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
<script type='text/javascript' src='Order_Details/save_order_details_Form_Validation.js'></script>

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


 function save_order_details()
 {

       var validate = save_order_details_Form_Validation();
       var url_encoded_form_data = $("#order_details_form").serialize(); //This will read all control elements value of the form	
       if(validate != false)
	   {
		  	 $.ajax({
			 		url: 'Order_details/save_order_details.php',
			 		dataType: 'text',
			 		type: 'post',
			 		contentType: 'application/x-www-form-urlencoded',
			 		data: url_encoded_form_data,
			 		success: function( data, textStatus, jQxhr )
			 		{
						 
			 				alert(data);
							 console.log(data)
			 		
			 		},
			 		error: function( jqXhr, textStatus, errorThrown )
			 		{
			 				//console.log( errorThrown );
			 				alert(errorThrown);
			 		}
			 }); // End of $.ajax({

       }//End of if(validate != false)

 }//End of function sending_data_of_process_program_info_form_for_saving_in_database()




 /***************************************************** FOR AUTO COMPLETE********************************************************************/

$('.for_auto_complete').chosen();


/***************************************************** FOR AUTO COMPLETE********************************************************************/

function order_details_number()
{
	
	let ajaxRequest=new XMLHttpRequest();
	
	ajaxRequest.onreadystatechange = function(){
                  if(ajaxRequest.readyState == 4){
					 // console.log(ajaxRequest.responseText);
						document.getElementById('order_ajax_id').innerHTML=ajaxRequest.responseText;
                    
                  }
               }
			   let order_details_id=document.getElementById("order_details_id").value;

			   var queryString = "?order_details_id=" + order_details_id ;


			 //  queryString +=  "&order_details_id=" + order_details_id;
               ajaxRequest.open("GET", "Order_Details/order_details_mini.php" + queryString, true);
               ajaxRequest.send(null); 
}



</script>



<div class="col-sm-12 col-md-12 col-lg-12">

		<div class="panel panel-default"> <!-- This div will create a block/panel for FORM -->

            <div id="element">

				<div class="panel-heading" style="color:#191970;"><b>Add Order Details</b></div> <!-- This will create a upper block for FORM (Just Beautification) -->

				<nav aria-label="breadcrumb">
					  <ol class="breadcrumb">
					    <li class="breadcrumb-item active" aria-current="page">Home</li>
					    <li class="breadcrumb-item"><a onclick="load_page('Order_Details/order_details.php')">Order Details</a></li>
					  </ol>
				 </nav>

				<form class="form-horizontal" action="" style="margin-top:10px;" name="order_details_form" id="order_details_form"  >
						
						<div class="form-group form-group-sm" id="form-group_for_customer_name">
							<label class="control-label col-sm-3" for="order_details_id" style="margin-right:0px; color:#00008B;">Style Details:</label>
							<div class="col-sm-6">
								<select  class="form-control for_auto_complete" id="order_details_id" name="order_details_id" onchange="order_details_number()">
											<option select="selected" value="select">Select Style Number</option>
											<?php 
												//  $sql = 'select style_details.id as id, style_name.style_name as style_name from `style_details`,style_name where
												//  `style_details`.`style_no`=`style_name`.`style_id`';
												$sql = "SELECT DISTINCT style_details.style_details_id, style_name.style_name FROM style_details 
												INNER JOIN style_name ON style_details.style_no = style_name.style_id";
												 $result= mysqli_query($con,$sql) or die(mysqli_error($con));
												 while( $row = mysqli_fetch_array( $result))
												 {

													 echo '<option value="'.$row['style_details_id'].'">'. $row['style_name'] .'</option>';

												 }

											 ?>
								</select>
							</div>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_customer_name"> -->

						<div id="order_ajax_id">
						</div>
						



						<div class="form-group form-group-sm " id="form-group_for_pp_creation_date">
								<label class="control-label col-sm-3" for="smv" style="color:#00008B;">PO:<span style="color:red"> *</span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="po" name="po" placeholder="Enter PO" required>
								</div>
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
								</div> -->
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('po')"></i>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->

						<div class="form-group form-group-sm" id="form-group_for_customer_name">
						<label class="control-label col-sm-3" for="color" style="margin-right:0px; color:#00008B;">Color:<span style="color:red"> *</span></label>
							<div class="col-sm-6">
								<select  class="form-control for_auto_complete" id="color" name="color">
											<option select="selected" value="select">Select Color</option>
											<?php 
												 $sql = 'select * from `color` order by `color_name`';
												 $result= mysqli_query($con,$sql) or die(mysqli_error($con));
												 while( $row = mysqli_fetch_array( $result))
												 {
													 echo '<option value="'.$row['color_id'].'">'.$row['color_name'].'</option>';

												 }
											 ?>
								</select>
							</div>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_customer_name"> -->



					<div id="order_ajax_id">

						<div class="form-group form-group-sm " id="form-item_name">
								<label class="control-label col-sm-3" for="Order Quantity:" style="color:#00008B;">Order Quantity:<span style="color:red"> *</span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="order_quantity" name="order_quantity" placeholder="Enter Order Quantity" required>
								</div>
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
								</div> -->
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('order_quantity')"></i>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->
							
						
                        <div class="form-group form-group-sm " id="form-item_name">
								<label class="control-label col-sm-3" for="plan_cut_quantity" style="color:#00008B;">Plan Cut Quantity:<span style="color:red"> *</span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="plan_cut_quantity" name="plan_cut_quantity" placeholder="Enter Plan Cut Quantity" required>
								</div>
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
								</div> -->
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('plan_cut_quantity')"></i>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->

					</div>
						
                        <!-- <div class="form-group form-group-sm " id="form-item_name">
								<label class="control-label col-sm-3" for="pcd" style="color:#00008B;">PCD:<span style="color:red"> *</span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="pcd" name="pcd" placeholder="Enter PCD" required>
								</div> -->
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
								</div> -->
								<!-- <i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('pcd')"></i>
						</div> End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->

						<div class="form-group form-group-sm " id="form-group_for_pcd">
								<label class="control-label col-sm-3" for="pcd" style="color:#00008B;">PCD:<span style="color:red"> *</span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="pcd" name="pcd" placeholder="Enter pcd" required>
								</div>
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
								</div> -->
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('pcd')"></i>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->
								<script>
									$( function()
									{
										$( "#pcd" ).datepicker(
										{
											showWeek: true, // This is for Showing Week in Datepicker Calender.
											altField: "#alternate_pcd", // This is for Descriptive Date Showing in Alternative Field.
											altFormat: "DD, d MM, yy" // This is for Descriptive Date Format in Alternative Field.
										}
										); // End of $( "#pp_creation_date" ).datepicker(

										$( "#pcd" ).datepicker( "option", "dateFormat", "mm/dd/yy" ); // This is for Date Format in Actual Date Field.
										$( "#pcd" ).datepicker( "option", "showAnim", "drop" ); // This is for Datepicker Calender Animation in Actual Date Field.
									}
									); // End of $( function()
								</script>

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

						

						<div class="form-group form-group-sm">
								<div class="col-sm-offset-3 col-sm-6">
									<button type="button" class="btn btn-primary" onClick="save_order_details()">Submit</button>
									<button type="reset" class="btn btn-success">Reset</button>
								</div>
						</div>

				</form>

		</div> <!-- End of <div class="panel panel-default"> -->




</div> <!-- End of <div class="col-sm-12 col-md-12 col-lg-12"> -->