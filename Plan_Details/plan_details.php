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


<script type='text/javascript' src='Plan_Details/save_plan_details_Form_Validation.js'></script>

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



	
function saving_plan_details()
{
	var validate = save_plan_details_Form_Validation();
	var url_encoded_form_data = $("#style_details_form").serialize(); //This will read all control elements value of the form	
	if(validate != false)
	{
		$.ajax({
			url: 'Plan_Details/plan_details_all_save.php',
			dataType: 'text',
			type: 'post',
			contentType: 'application/x-www-form-urlencoded',
			data: url_encoded_form_data,
			success: function( data, textStatus, jQxhr )
			{
					alert(data);
						// console.log(data)
			
			},
			error: function( jqXhr, textStatus, errorThrown )
			{
					//console.log( errorThrown );
					alert(errorThrown);
			}
		}); 
	}
}
      


 function order_details_number()
 {

	
	let ajaxRequest=new XMLHttpRequest();
	
	ajaxRequest.onreadystatechange = function(){
                  if(ajaxRequest.readyState == 4){
					 // console.log(ajaxRequest.responseText);
						document.getElementById('order_ajax_id').innerHTML=ajaxRequest.responseText;
                    // var ajaxDisplay = document.getElementById('ajaxDiv');
                     //ajaxDisplay.innerHTML = ajaxRequest.responseText;
					
                  }
               }
			   let order_details_id=document.getElementById("order_details_id").value;

			   var queryString = "?order_details_id=" + order_details_id ;


			 //  queryString +=  "&order_details_id=" + order_details_id;
               ajaxRequest.open("GET", "Plan_Details/plan_details_save.php" + queryString, true);
               ajaxRequest.send(null); 

 }

 function style_details_number()
 {			   let style_details_id=document.getElementById("style_details_id").value;

	// alert(style_details_id);
	let ajaxRequest=new XMLHttpRequest();
	
	ajaxRequest.onreadystatechange = function(){
                  if(ajaxRequest.readyState == 4){
					    console.log(ajaxRequest.responseText);
						document.getElementById('ajax_ship_date').innerHTML=ajaxRequest.responseText;
                    // var ajaxDisplay = document.getElementById('ajaxDiv');
                     //ajaxDisplay.innerHTML = ajaxRequest.responseText;
					
                  }
               }

			   var queryString = "?style_details_id=" + style_details_id ;


			 //  queryString +=  "&order_details_id=" + order_details_id;
               ajaxRequest.open("GET", "Plan_Details/plan_details_date.php" + queryString, true);
               ajaxRequest.send(null); 
 }

 /***************************************************** FOR AUTO COMPLETE********************************************************************/
 $('body').ready(function(){
$('.for_auto_complete').chosen();

 });
/***************************************************** FOR AUTO COMPLETE********************************************************************/



$('body').ready(function(){
   $(document).on('change', '#order_details_id', function(){
      // do something
	  let style_details_id=document.getElementById("style_details_id").value;

		let order_details_id=this.value;

		let ajaxRequest=new XMLHttpRequest();

	ajaxRequest.onreadystatechange = function(){
			  if(ajaxRequest.readyState == 4){
				 // console.log(ajaxRequest.responseText);
					document.getElementById('buyer_smv_item_ajax').innerHTML=ajaxRequest.responseText;
				// var ajaxDisplay = document.getElementById('ajaxDiv');
				 //ajaxDisplay.innerHTML = ajaxRequest.responseText;
				
			  }
		   }

		 var queryString = "?style_details_id=" + style_details_id ;
		 
		  queryString += "&order_details_id=" + order_details_id;

		  





		 //  queryString +=  "&order_details_id=" + order_details_id;
		   ajaxRequest.open("GET", "Plan_Details/Date_With_buyer_smv_item_ajax.php" + queryString , true);
		   ajaxRequest.send(null); 

   });
});

</script>


<div class="col-sm-12 col-md-12 col-lg-12">
	
<div id="app">

</div>

		<div class="panel panel-default"> <!-- This div will create a block/panel for FORM -->

            <div id="element">

				<div class="panel-heading" style="color:#191970;"><b>Add Plan Details</b></div> <!-- This will create a upper block for FORM (Just Beautification) -->

				<nav aria-label="breadcrumb">
					  <ol class="breadcrumb">
					    <li class="breadcrumb-item active" aria-current="page">Home</li>
					    <li class="breadcrumb-item"><a onclick="load_page('Plan_Details/plan_details.php')">Plan Details</a></li>
					  </ol>
				 </nav>


				<form class="form-horizontal" action="" style="margin-top:10px;" name="style_details_form" id="style_details_form">
		
				<div class="form-group form-group-sm" id="form-group_for_customer_name">
							<label class="control-label col-sm-3" for="style_details_id" style="margin-right:0px; color:#00008B;">Style Details:<span style="color:red"> *</span></label>
							<div class="col-sm-6">
								<select  class="form-control for_auto_complete" id="style_details_id" name="style_details_id" onchange="style_details_number()">
											<option select="selected" value="select">Select Style Number</option>
											<?php 
												 $sql = 'SELECT DISTINCT order_details.style_details_id, style_name.style_name FROM style_details 
												 INNER JOIN style_name ON style_details.style_no = style_name.style_id
												 INNER JOIN order_details ON order_details.style_details_id = style_details.style_details_id';
												 $result= mysqli_query($con,$sql) or die(mysqli_error($con));
												 while( $row = mysqli_fetch_array( $result))
												 {

													 echo '<option value="'.$row['style_details_id'].'">'. $row['style_name'] .'</option>';

												 }

											 ?>
								</select>
							</div>
						</div> 
                        
						<div id="ajax_ship_date"  class="form-group form-group-sm" id="form-group_for_style_details_date" >
							<label class="control-label col-sm-3" for="order_details_id" style="margin-right:0px; color:#00008B;">Order Detials:<span style="color:red"> *</span></label>
							<div class="col-sm-6">
								<select  class="form-control for_auto_complete" id="order_details_id" name="order_details_id">
											<option select="select" value="select">Select Order Detials</option>
											<?php 
												//   $select_sql_for_duplicacy="select `style_details`.`id` id ,`order_details`.`ship_date` ship_date,`order_details`.`po` po,`order_details`.`color` color
                                                //   from style_details,order_details where `style_details`.`id`=`order_details`.`style_details_id`
                                                //   and `order_details`.`style_details_id`='$style_details_id'
                                                //   ";
                                                // $result = mysqli_query($con,$select_sql_for_duplicacy) or die(mysqli_error($con));
                                              
												//  while( $row = mysqli_fetch_array( $result))
												//  {

												// 	 echo '<option value="'.$row['color'].'">'. $row['color'] .'</option>';

												//  }

											 ?>
								</select>
							</div>
					    </div> 

					<div id="buyer_smv_item_ajax" >
							
					</div> 
				
				
						<div class="form-group form-group-sm" id="form-group_for_customer_name">
							<label class="control-label col-sm-3" for="line_no" style="margin-right:0px; color:#00008B;">Line No:<span style="color:red"> *</span></label>
							<div class="col-sm-6">
								<select  class="form-control for_auto_complete" id="line_no" name="line_no">
											<option select="selected" value="select">Select Unit Wise Line No</option>
											<?php 
												 $sql = 'select * from `line_info` order by `line`';
												 $result= mysqli_query($con,$sql) or die(mysqli_error($con));
												 while( $row = mysqli_fetch_array( $result))
												 {
													 echo '<option value="'.$row['id'].'">Unit:'.$row['unit'].', Line: '.$row['line'].', '.$row['description'].'</option>';

												 }

											 ?>
								</select>
							</div>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_customer_name"> -->



						<div class="form-group form-group-sm " id="form-group_for_pp_creation_date">
								<label class="control-label col-sm-3" for="line_allocated_qty" style="color:#00008B;">Line Allocated Quantity:<span style="color:red"> *</span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="line_allocated_qty" name="line_allocated_qty" placeholder="Enter Line Allocated Qty" required>
								</div>
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
								</div> -->
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('line_allocated_qty')"></i>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->

                        <div class="form-group form-group-sm " id="form-group_for_pp_creation_date">
								<label class="control-label col-sm-3" for="plan_input_date" style="color:#00008B;">Plan Input Date:<span style="color:red"> *</span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="plan_input_date" name="plan_input_date" placeholder="Plan Input Date" required>
								</div>
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
								</div> -->
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('plan_input_date')"></i>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->
								<script>
									$( function()
									{
										$( "#plan_input_date" ).datepicker(
										{
											showWeek: true, // This is for Showing Week in Datepicker Calender.
											altField: "#alternate_plan_input_date", // This is for Descriptive Date Showing in Alternative Field.
											altFormat: "DD, d MM, yy" // This is for Descriptive Date Format in Alternative Field.
										}
										); // End of $( "#pp_creation_date" ).datepicker(

										$( "#plan_input_date" ).datepicker( "option", "dateFormat", "mm/dd/yy" ); // This is for Date Format in Actual Date Field.
										$( "#plan_input_date" ).datepicker( "option", "showAnim", "drop" ); // This is for Datepicker Calender Animation in Actual Date Field.
									}
									); // End of $( function()
								</script>


                                <div class="form-group form-group-sm " id="form-group_for_pp_creation_date">
								<label class="control-label col-sm-3" for="plan_output_start_date" style="color:#00008B;">Plan Output Start Date:<span style="color:red"> *</span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="plan_output_start_date" name="plan_output_start_date" placeholder="Enter Plan Output Start Date" required>
								</div>
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
								</div> -->
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('plan_output_start_date')"></i>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->
								<script>
									$( function()
									{
										$( "#plan_output_start_date" ).datepicker(
										{
											showWeek: true, // This is for Showing Week in Datepicker Calender.
											altField: "#alternate_plan_output_start_date", // This is for Descriptive Date Showing in Alternative Field.
											altFormat: "DD, d MM, yy" // This is for Descriptive Date Format in Alternative Field.
										}
										); // End of $( "#pp_creation_date" ).datepicker(

										$( "#plan_output_start_date" ).datepicker( "option", "dateFormat", "mm/dd/yy" ); // This is for Date Format in Actual Date Field.
										$( "#plan_output_start_date" ).datepicker( "option", "showAnim", "drop" ); // This is for Datepicker Calender Animation in Actual Date Field.
									}
									); // End of $( function()
								</script>

                            <div class="form-group form-group-sm " id="form-group_for_pp_creation_date">
								<label class="control-label col-sm-3" for="plan_output_end_date" style="color:#00008B;">Plan Output End Date:<span style="color:red"> *</span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="plan_output_end_date" name="plan_output_end_date" placeholder="Enter Plan Output End Date" required>
								</div>
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
								</div> -->
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('plan_output_end_date')"></i>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->
								<script>
									$( function()
									{
										$( "#plan_output_end_date" ).datepicker(
										{
											showWeek: true, // This is for Showing Week in Datepicker Calender.
											altField: "#alternate_plan_output_end_date", // This is for Descriptive Date Showing in Alternative Field.
											altFormat: "DD, d MM, yy" // This is for Descriptive Date Format in Alternative Field.
										}
										); // End of $( "#pp_creation_date" ).datepicker(

										$( "#plan_output_end_date" ).datepicker( "option", "dateFormat", "mm/dd/yy" ); // This is for Date Format in Actual Date Field.
										$( "#plan_output_end_date" ).datepicker( "option", "showAnim", "drop" ); // This is for Datepicker Calender Animation in Actual Date Field.
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
							<label class="control-label col-sm-3" for="top_target" style="color:#00008B;">Top Target:</label>
							<div class="col-sm-6">
								<input type="number" class="form-control" id="top_target" name="top_target" placeholder="Enter Top Target" onchange="calculation_total_leave()">
							</div>
							<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('top_target')"></i>
						</div> 



						<div class="form-group form-group-sm">
								<div class="col-sm-offset-3 col-sm-6">
									<!-- <button type="button" class="btn btn-primary submit">Submit</button> -->
									<button type="button" class="btn btn-primary" onClick="saving_plan_details()">Submit</button>

									<button type="reset" class="btn btn-success">Reset</button>
								</div>
						</div>

				</form>

		</div> <!-- End of <div class="panel panel-default"> -->					
</div> <!-- End of <div class="col-sm-12 col-md-12 col-lg-12"> -->

