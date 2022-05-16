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
<script type='text/javascript' src='swing/swing_daily_form_val.js'></script>

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
function order_details_number()
 {

	
	let ajaxRequest=new XMLHttpRequest();
	
	ajaxRequest.onreadystatechange = function(){
                  if(ajaxRequest.readyState == 4){
						document.getElementById('order_ajax_id').innerHTML=ajaxRequest.responseText;
                    // var ajaxDisplay = document.getElementById('ajaxDiv');
                     //ajaxDisplay.innerHTML = ajaxRequest.responseText;
					
                  }
               }
			   let order_details_id=document.getElementById("order_details_id").value;
			   let input_date=document.getElementById("input_date").value;

			   var queryString = "?order_details_id=" + order_details_id ;
			   
			  queryString +=  "&input_date=" + input_date;
			  alert(queryString);

			 //  queryString +=  "&order_details_id=" + order_details_id;
               ajaxRequest.open("GET", "swing/daily_swing_input_few.php" + queryString, true);
               ajaxRequest.send(null); 

 }


 $(document).on('click','.submit', function() {
	let received_from_cutting=document.getElementById("received_from_cutting").value;

	
	if(received_from_cutting=="")
	{
		alert("Yet No value added in Production")
	}
	else
	{
	   var validate = swing_daily_form_val();
       var url_encoded_form_data = $("#order_details_form").serialize(); //This will read all control elements value of the form	
       if(validate != false)
	   {
		  	 $.ajax({
			 		url: 'swing/daily_swing_input_all_save.php',
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


	}
     
 });
 //End of function sending_data_of_process_program_info_form_for_saving_in_database()




 /***************************************************** FOR AUTO COMPLETE********************************************************************/

$('.for_auto_complete').chosen();


/***************************************************** FOR AUTO COMPLETE********************************************************************/


function style_details_number()
 {			   let style_details_id=document.getElementById("style_details_id").value;

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
               ajaxRequest.open("GET", "Plan_Details/plan_details_date.php" + queryString, true);
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
				 // console.log(ajaxRequest.responseText);
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
});




$('body').ready(function(){
   $(document).on('change', '#cutting_input_date', function(){
      // do something
	  	let cutting_input_date=document.getElementById("cutting_input_date").value;
		
		let style_details_id=document.getElementById("style_details_id").value;
		let style_details_date=document.getElementById("style_details_date").value;


		let ajaxRequest=new XMLHttpRequest();

	ajaxRequest.onreadystatechange = function(){
			  if(ajaxRequest.readyState == 4){
				 // console.log(ajaxRequest.responseText);
					document.getElementById('received_cutting_quantity_ajax').innerHTML=ajaxRequest.responseText;
				// var ajaxDisplay = document.getElementById('ajaxDiv');
				 //ajaxDisplay.innerHTML = ajaxRequest.responseText;
				
			  }
		   }

		 var queryString = "?cutting_input_date=" + cutting_input_date ;
		 
		  queryString += "&style_details_id=" + style_details_id;
		  queryString += "&style_details_date=" + style_details_date;





		 //  queryString +=  "&order_details_id=" + order_details_id;
		   ajaxRequest.open("GET", "swing/received_cutting_quantity_ajax.php" + queryString , true);
		   ajaxRequest.send(null); 

   });
});

</script>



<div class="col-sm-12 col-md-12 col-lg-12">

		<div class="panel panel-default"> <!-- This div will create a block/panel for FORM -->

            <div id="element">

				<div class="panel-heading" style="color:#191970;"><b>Daily Input For Swing Details</b></div> <!-- This will create a upper block for FORM (Just Beautification) -->

				<nav aria-label="breadcrumb">
					  <ol class="breadcrumb">
					    <li class="breadcrumb-item active" aria-current="page">Home</li>
					    <li class="breadcrumb-item"><a onclick="load_page('Order_Details/order_details.php')">Add Daily Input For Swing Details</a></li>
					  </ol>
				 </nav>

				<form class="form-horizontal" action="" style="margin-top:10px;" name="order_details_form" id="order_details_form">
						
				<div class="form-group form-group-sm " id="form-group_for_pp_creation_date">
								<label class="control-label col-sm-3" for="input_date" style="color:#00008B;">Swing Date:<span style="color:red"> *</span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="input_date" name="input_date" placeholder="Enter Received From Cutting Quantity Date" required>
								</div>
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
								</div> -->
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('ship_date')"></i>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->
								<script>
									$( function()
									{
										$( "#input_date" ).datepicker(
										{
											showWeek: true, // This is for Showing Week in Datepicker Calender.
											altField: "#alternate_ship_date", // This is for Descriptive Date Showing in Alternative Field.
											altFormat: "DD, d MM, yy" // This is for Descriptive Date Format in Alternative Field.
										}
										); // End of $( "#pp_creation_date" ).datepicker(

										$( "#input_date" ).datepicker( "option", "dateFormat", "mm/dd/yy" ); // This is for Date Format in Actual Date Field.
										$( "#input_date" ).datepicker( "option", "showAnim", "drop" ); // This is for Datepicker Calender Animation in Actual Date Field.
									}
									); // End of $( function()
								</script>

						

					<div class="form-group form-group-sm" id="form-group_for_customer_name">
							<label class="control-label col-sm-3" for="order_details_id" style="margin-right:0px; color:#00008B;">Order Details Number:</label>
							<div class="col-sm-6">
								<select  class="form-control for_auto_complete" id="style_details_id" name="style_details_id" onchange="style_details_number()">
											<option select="selected" value="select">Select Style Number</option>
											<?php 
												 $sql = 'select style_details.id as id, style_name.style_name as style_name from `style_details`,style_name where
												 `style_details`.`style_no`=`style_name`.`style_id`';
												 $result= mysqli_query($con,$sql) or die(mysqli_error($con));
												 while( $row = mysqli_fetch_array( $result))
												 {

													 echo '<option value="'.$row['id'].'">'. $row['style_name'] .'</option>';

												 }

											 ?>
								</select>
							</div>
						</div> 

						
						<div id="ajax_ship_date"  class="form-group form-group-sm" id="form-group_for_customer_name">
							<label class="control-label col-sm-3" for="order_details_id" style="margin-right:0px; color:#00008B;">Select Ship Date:</label>
							<div class="col-sm-6">
								<select  class="form-control" id="style_details_date" name="style_details_date">
											<option select="select" value="select">Select Ship Date</option>
											<?php 
												  $select_sql_for_duplicacy="select `style_details`.`id` id ,`order_details`.`ship_date` ship_date
                                                  from style_details,order_details where `style_details`.`id`=`order_details`.`style_details_id`
                                                  and `order_details`.`style_details_id`='$style_details_id'
                                                  ";
                                              $result = mysqli_query($con,$select_sql_for_duplicacy) or die(mysqli_error());
                                              
												 while( $row = mysqli_fetch_array( $result))
												 {

													 echo '<option value="'.$row['ship_date'].'">'. $row['ship_date'] .'</option>';

												 }

											 ?>
								</select>
							</div>
					</div> 

					
					<div id="buyer_smv_item_ajax" >
							
					</div> 
					

					

					<div class="form-group form-group-sm " id="form-group_for_pp_creation_date">
								<label class="control-label col-sm-3" for="input_date" style="color:#00008B;">Cutting Completed Date:<span style="color:red"> *</span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="cutting_input_date" name="cutting_input_date" placeholder="Enter Cutting Completed Date">
								</div>
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
								</div> -->
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('ship_date')"></i>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->
								<script>
									$( function()
									{
										$( "#cutting_input_date" ).datepicker(
										{
											showWeek: true, // This is for Showing Week in Datepicker Calender.
											altField: "#alternate_ship_date", // This is for Descriptive Date Showing in Alternative Field.
											altFormat: "DD, d MM, yy" // This is for Descriptive Date Format in Alternative Field.
										}
										); // End of $( "#pp_creation_date" ).datepicker(

										$( "#input_date" ).datepicker( "option", "dateFormat", "mm/dd/yy" ); // This is for Date Format in Actual Date Field.
										$( "#input_date" ).datepicker( "option", "showAnim", "drop" ); // This is for Datepicker Calender Animation in Actual Date Field.
									}
									); // End of $( function()
								</script>

						

	

                        <div  class="form-group form-group-sm " id="form-item_name">
								<label class="control-label col-sm-3" for="received_from_cutting" style="color:#00008B;">Received Cutting Quantity:</label>
								
								<div class="col-sm-6"  id="received_cutting_quantity_ajax">
									<input type="text" class="form-control" id="received_from_cutting" name="received_from_cutting" placeholder="Enter Received Cutting Quantity" disabled>
								</div>
								
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->

                       
				

						<div class="form-group form-group-sm" id="form-group_for_line_no">
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
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_line_no"> -->



						<div class="form-group form-group-sm">
								<div class="col-sm-offset-3 col-sm-6">
									<button type="button" class="submit btn btn-primary">Submit</button>
									<button type="reset" class="btn btn-success">Reset</button>
								</div>
						</div>

				</form>

		</div> <!-- End of <div class="panel panel-default"> -->




</div> <!-- End of <div class="col-sm-12 col-md-12 col-lg-12"> -->