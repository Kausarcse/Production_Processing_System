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
<script type='text/javascript' src='swing/swing_production_info.js'></script>

<!-- <link rel="stylesheet" href="./timepicker_CSS_JS/jquery.timepicker.css"> -->


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


 function save_style_details()
 {

	   var validate = swing_production_info();
	alert(document.getElementById('total_layout_time').value);
       var url_encoded_form_data = $("#swing_details_form").serialize(); //This will read all control elements value of the form

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
							//  console.log(data)
			 		
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


function style_details_number()
 {			   
	 let style_details_id=document.getElementById("style_details_id").value;

	let ajaxRequest=new XMLHttpRequest();
	
	ajaxRequest.onreadystatechange = function(){
                  if(ajaxRequest.readyState == 4){
					 // console.log(ajaxRequest.responseText);
						document.getElementById('ajax_ship_date').innerHTML=ajaxRequest.responseText;
                    // var ajaxDisplay = document.getElementById('ajaxDiv');
                     //ajaxDisplay.innerHTML = ajaxRequest.responseText;
					
                  }
               }

			   var queryString = "?style_details_id=" + style_details_id ;


			 //  queryString +=  "&order_details_id=" + order_details_id;
               ajaxRequest.open("GET", "swing/plan_details_date.php" + queryString, true);
               ajaxRequest.send(null); 
 }


$('body').ready(function(){
   $(document).on('change', '#style_details_date', function(){
      // do something
	  let style_details_id=document.getElementById("style_details_id").value;

		let style_details_date=this.value;

		let ajaxRequest=new XMLHttpRequest();

	ajaxRequest.onreadystatechange = function(){
			  if(ajaxRequest.readyState == 4){
				  console.log(ajaxRequest.responseText);
					document.getElementById('buyer_smv_item_ajax').innerHTML=ajaxRequest.responseText;
				// var ajaxDisplay = document.getElementById('ajaxDiv');
				 //ajaxDisplay.innerHTML = ajaxRequest.responseText;
				
			  }
		   }

		 var queryString = "?style_details_id=" + style_details_id ;
		 
		  queryString += "&style_details_date=" + style_details_date;





		 //  queryString +=  "&order_details_id=" + order_details_id;
		   ajaxRequest.open("GET", "Plan_Details/Date_With_buyer_smv_item_ajax.php" + queryString , true);
		   ajaxRequest.send(null); 

   });



								
										$( "#start_date" ).datepicker(
										{
											showWeek: true, // This is for Showing Week in Datepicker Calender.
											altField: "#alternate_ship_date", // This is for Descriptive Date Showing in Alternative Field.
											altFormat: "DD, d MM, yy" // This is for Descriptive Date Format in Alternative Field.
										}
										); // End of $( "#pp_creation_date" ).datepicker(

										$( "#start_date" ).datepicker( "option", "dateFormat", "mm/dd/yy" ); // This is for Date Format in Actual Date Field.
										$( "#start_date" ).datepicker( "option", "showAnim", "drop" ); // This is for Datepicker Calender Animation in Actual Date Field.
								
										$( "#end_date" ).datepicker(
										{
											showWeek: true, // This is for Showing Week in Datepicker Calender.
											altField: "#alternate_ship_date", // This is for Descriptive Date Showing in Alternative Field.
											altFormat: "DD, d MM, yy" // This is for Descriptive Date Format in Alternative Field.
										}
										); // End of $( "#pp_creation_date" ).datepicker(

										$( "#end_date" ).datepicker( "option", "dateFormat", "mm/dd/yy" ); // This is for Date Format in Actual Date Field.
										$( "#end_date" ).datepicker( "option", "showAnim", "drop" ); // This is for Datepicker Calender Animation in Actual Date Field.
							

});

function get_line_details(order_details_id)
{
	$.ajax({
			 		url: 'swing/returning_line_number_details.php',
			 		dataType: 'text',
			 		type: 'post',
			 		contentType: 'application/x-www-form-urlencoded',
			 		data: {order_details_id: order_details_id},
			 		success: function( data, textStatus, jQxhr )
			 		{
			 				// alert(data);
							document.getElementById('form_group_for_line_number').innerHTML = data;
			 		},
			 		error: function( jqXhr, textStatus, errorThrown )
			 		{
			 				//console.log( errorThrown );
			 				alert(errorThrown);
			 		}
			 }); 
}

function returning_value_for_layout_date_time(line_no)
{
	var order_details_id=document.getElementById("order_details_id").value;
	var line_no = line_no;
	$.ajax({
			url: 'swing/returning_value_for_layout_date_time.php',
			dataType: 'text',
			type: 'post',
			contentType: 'application/x-www-form-urlencoded',
			data: {order_details_id : order_details_id, line_no : line_no},
			success: function( data, textStatus, jQxhr )
			{
					// alert(data);
					document.getElementById('div_id_for_layout_date_time_details').innerHTML = data;
					// alert(document.getElementById('first_output_date_1').value);
					datePicker_func();

			},
			error: function( jqXhr, textStatus, errorThrown )
			{
					//console.log( errorThrown );
					alert(errorThrown);
			}
		}); 
}

function datePicker_func()
{
	// $( function()
	// {
	// 	$( "#first_output_date" ).datepicker({ dateFormat: 'yy/mm/dd' }); 
	// }
	// ); 

	$( function() 
	{
		$( "#search-from-date" ).datetimepicker();
	} );

	$( function() {
		$( "#search-to-date" ).datetimepicker();
	} );
}

function get_value_for_first_output()
    {
        var layout_end_time = document.getElementById('search-to-date').value;
			  // 2022/05/15 11:54
		var split_date = layout_end_time.split(' ');
		var first_output_date = split_date[0];
		// alert(first_output_date);
		document.getElementById('first_output_date').value = first_output_date;
    }
</script>



<div class="col-sm-12 col-md-12 col-lg-12">

		<div class="panel panel-default"> <!-- This div will create a block/panel for FORM -->

            <div id="element">

				<div class="panel-heading" style="color:#191970;"><b>Add Production Details</b></div> <!-- This will create a upper block for FORM (Just Beautification) -->

				<nav aria-label="breadcrumb">
					  <ol class="breadcrumb">
					    <li class="breadcrumb-item active" aria-current="page">Home</li>
					    <li class="breadcrumb-item"><a onclick="load_page('Order_Details/order_details.php')">Production Details</a></li>
					  </ol>
				 </nav>

				<form class="form-horizontal" action="" style="margin-top:10px;" name="swing_details_form" id="swing_details_form">
						
				
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
					
					<div id="ajax_ship_date"  class="form-group form-group-sm">
							<label class="control-label col-sm-3" for="order_details_id" style="margin-right:0px; color:#00008B;">Select Ship Date:<span style="color:red"> *</span></label>
							<div class="col-sm-6">
								<select  class="form-control" id="style_details_date" name="style_details_date">
											<option select="select" value="select">Select Ship Date</option>
											<?php 
											// 	  $select_sql_for_duplicacy="select `style_details`.`id` id ,`order_details`.`ship_date` ship_date
                                            //       from style_details,order_details where `style_details`.`id`=`order_details`.`style_details_id`
                                            //       and `order_details`.`style_details_id`='$style_details_id'
                                            //       ";
                                            //   $result = mysqli_query($con,$select_sql_for_duplicacy) or die(mysqli_error($con));
                                              
											// 	 while( $row = mysqli_fetch_array( $result))
											// 	 {

											// 		 echo '<option value="'.$row['ship_date'].'">'. $row['ship_date'] .'</option>';

											// 	 }

											 ?>
								</select>
							</div>
					</div> 

					<div class="form-group form-group-sm" id="form_group_for_line_number">
						<label class="control-label col-sm-3" for="line_no" style="margin-right:0px; color:#00008B;">Line No:<span style="color:red"> *</span></label>
						<div class="col-sm-6">
							<select  class="form-control for_auto_complete" id="line_no" name="line_no">
								<option select="selected" value="select">Select Unit Wise Line No</option>
								<?php 
									$sql = "SELECT * FROM line_info";
									$result= mysqli_query($con,$sql) or die(mysqli_error($con));
									while( $row = mysqli_fetch_array( $result))
									{
										echo '<option value="'.$row['id'].'">Unit:'.$row['unit'].', Line: '.$row['line'].', '.$row['description'].'</option>';

									}

								?>
							</select>
						</div>
					</div> 

				
				<div id="div_id_for_layout_date_time_details">

					<div class="form-group form-group-sm " id="form-item_name">
						<label class="control-label col-sm-3" for="total_layout_time" style="color:#00008B;">Layout Start Time <span style="color:red"> *</span></label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="layout_start_time" id="search-from-date" placeholder="Enter layout Start Time" >
						</div>
					</div> 


					<div class="form-group form-group-sm " id="form-item_name">
						<label class="control-label col-sm-3" for="total_layout_time" style="color:#00008B;">Layout End Time</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="layout_end_time" id="search-to-date" placeholder="Enter layout End Time">
						</div>
					</div> 

					<div class="form-group form-group-sm " id="div_total_layout_time" style="display:none">
							<label class="control-label col-sm-3" for="total_layout_time" style="color:#00008B;">{{ message }}</label>
							
							<div class="col-sm-6" id="total_layout_time_ajax">
								<input type="text" class="form-control"  id="total_layout_time" name="total_layout_time"  placeholder="Total layout Time">
							</div>
					</div>

						
					<div class="form-group form-group-sm " id="form-group_for_pp_creation_date">
							<label class="control-label col-sm-3" for="first_output_date" style="color:#00008B;">First Output Date:</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="first_output_date" name="first_output_date" placeholder="First Output Date" readonly>
							</div>
					</div> 

								<script>
									// $( function()
									// {
									// 	$( "#first_output_date" ).datepicker({ dateFormat: 'yy/mm/dd' }); 
									// }
									// ); 

									$( function() 
									{
										$( "#search-from-date" ).datetimepicker({ dateFormat: 'yy/mm/dd', timeFormat: 'hh:mm:ss' });
									} );

									$( function() {
										$( "#search-to-date" ).datetimepicker({ dateFormat: 'yy/mm/dd', timeFormat: 'hh:mm:ss' });
									} );

								
									
								</script>
			
				</div>
					
						
						

						<div class="form-group form-group-sm">
								<div class="col-sm-offset-3 col-sm-6 text-center">
									<button type="button" class="btn btn-primary" onClick="save_style_details()">Submit</button>
									<button type="reset" class="btn btn-success">Reset</button>
								</div>
						</div>

				</form>

		</div> <!-- End of <div class="panel panel-default"> -->




</div> <!-- End of <div class="col-sm-12 col-md-12 col-lg-12"> -->

<!-- <script type='text/javascript'  src="./timepicker_CSS_JS/jquery.timepicker.js"></script> -->
<script>
     
            /*jslint browser:true*/
            /*global jQuery, document*/

    //         jQuery(document).ready(function () {
    //             'use strict';

    //             jQuery('#filter-date, #search-from-date, #search-to-date').datetimepicker();
						
	
    // });

	

	const TwoWayBinding = {
  data() {
    return {
      message: 'Total Layout Time'
    }
  }
}

Vue.createApp(TwoWayBinding).mount('#two-way-binding')




$('body').ready(function(){
   $(document).on('change', '#search-to-date', function(){
      // do something
	  

				let layout_start_time=document.getElementById("search-from-date").value;
			   	let layout_end_time=document.getElementById("search-to-date").value;

			   	var queryString = "?layout_start_time=" + layout_start_time ;
			   
			  	queryString +=  "&layout_end_time=" + layout_end_time;
			//  alert(queryString);

		let ajaxRequest=new XMLHttpRequest();

	ajaxRequest.onreadystatechange = function(){
			  if(ajaxRequest.readyState == 4){
				 // console.log(ajaxRequest.responseText);
					document.getElementById('total_layout_time_ajax').innerHTML=ajaxRequest.responseText;
				// var ajaxDisplay = document.getElementById('ajaxDiv');
				 //ajaxDisplay.innerHTML = ajaxRequest.responseText;
				
			  }
		   }

		   ajaxRequest.open("GET", "swing/total_layout_time.php" + queryString , true);
		   ajaxRequest.send(null); 

   });
});
</script>