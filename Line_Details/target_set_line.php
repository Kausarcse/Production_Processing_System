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
<script type='text/javascript' src='Line_Details/target_output_perline_val.js'></script>

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

 function find_order_details_id(){
	var input_date =  document.getElementById('input_date').value;

	
		  	 $.ajax({
			 		url: 'Line_Details/return_order_details_id.php',
			 		dataType: 'text',
			 		type: 'post',
			 		contentType: 'application/x-www-form-urlencoded',
			 		data: {input_date:input_date},
			 		success: function( data, textStatus, jQxhr )
			 		{
					 	//alert(data)

						 document.getElementById('wip_table').innerHTML=data;
						 

							 console.log(data)
			 		
			 		},
			 		error: function( jqXhr, textStatus, errorThrown )
			 		{
			 				//console.log( errorThrown );
			 				alert(errorThrown);
			 		}
			 }); // End of $.ajax({
	

 }

 function set_ship_date_color_po(counter)
 {
	 
	 var counter = counter;
	
	 var style_details = document.getElementById('style_'+counter).value;

	       $.ajax({
			 		url: 'Line_Details/change_po_ship_date_color.php',
			 		dataType: 'text',
			 		type: 'post',
			 		contentType: 'application/x-www-form-urlencoded',
			 		data: {counter:counter, style_details:style_details},
			 		success: function( data, textStatus, jQxhr )
			 		{
			 				//alert(data);
							//  console.log(data)
							document.getElementById('details_'+counter).innerHTML = data;
							
			 		
			 		},
			 		error: function( jqXhr, textStatus, errorThrown )
			 		{
			 				//console.log( errorThrown );
			 				//alert(errorThrown);
			 		}
			 }); // End of $.ajax({


	 

 }

 function save_target_set_line()
 {
         
	//  var counter = document.getElementById('counter').value;
	//  alert(counter);


      // var validate = save_line_man_details_form();
	  var validate = true;
       var url_encoded_form_data = $("#order_details_form").serialize();
	   //This will read all control elements value of the form	
       if(validate != false)
	   {
		  	 $.ajax({
			 		url: 'Line_Details/save_target_set_line.php',
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

$(document).on('click','.submit', function() {

	   var validate = target_output_perline_val();
       var url_encoded_form_data = $("#order_details_form").serialize(); //This will read all control elements value of the form	
       if(validate != false)
	   {
		  	 $.ajax({
			 		url: 'Line_Details/target_set_live_save.php',
			 		dataType: 'text',
			 		type: 'post',
			 		contentType: 'application/x-www-form-urlencoded',
			 		data: url_encoded_form_data,
			 		success: function( data, textStatus, jQxhr )
			 		{
					 	     alert(data)
							 console.log(data)
			 		
			 		},
			 		error: function( jqXhr, textStatus, errorThrown )
			 		{
			 				//console.log( errorThrown );
			 				alert(errorThrown);
			 		}
			 }); // End of $.ajax({

      

	}
     
 });



</script>



<div class="col-sm-12 col-md-12 col-lg-12">

		<div class="panel panel-default"> <!-- This div will create a block/panel for FORM -->

            <div id="element">

				<div class="panel-heading" style="color:#191970;"><b>Target Output Set Per Line</b></div> <!-- This will create a upper block for FORM (Just Beautification) -->

				<nav aria-label="breadcrumb">
					  <ol class="breadcrumb">
					    <li class="breadcrumb-item active" aria-current="page">Home</li>
					    <li class="breadcrumb-item"><a onclick="load_page('Order_Details/order_details.php')">Details of Output Set Per Line</a></li>
					  </ol>
				 </nav>

				<form class="form-horizontal" action="" style="margin-top:10px;" name="order_details_form" id="order_details_form">


				       <div class="form-group form-group-sm " id="form-group_for_input_date">
								<label class="control-label col-sm-3" for="input_date" style="color:#00008B;">Plan Input Date:<span style="color:red"> *</span></label>
								
								<div class="col-sm-6">
									<input type="text" class="form-control" id="input_date" name="input_date" placeholder="Input Date" required>
								</div>
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
								</div> -->
								<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('input_date')"></i>
						</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->
								<script>
									$( function()
									{
										$( "#input_date" ).datepicker(
										{
											showWeek: true, // This is for Showing Week in Datepicker Calender.
											altField: "#alternate_input_date", // This is for Descriptive Date Showing in Alternative Field.
											altFormat: "DD, d MM, yy" // This is for Descriptive Date Format in Alternative Field.
										}
										); // End of $( "#pp_creation_date" ).datepicker(

										$( "#input_date" ).datepicker( "option", "dateFormat", "mm/dd/yy" ); // This is for Date Format in Actual Date Field.
										$( "#input_date" ).datepicker( "option", "showAnim", "drop" ); // This is for Datepicker Calender Animation in Actual Date Field.
									}
									); // End of $( function()
								</script>

					

						<div class="form-group form-group-sm">
								<div class="col-sm-offset-3 col-sm-6">
									<button type="button" class="submit btn btn-primary" onclick="find_order_details_id()">Submit</button>
									<button type="reset" class="btn btn-success">Reset</button>
								</div>
						</div>

                        <div id="wip_table">
							
						</div>

						<!-- <div class="form-group form-group-sm">
						<div class="col-sm-offset-5 col-sm-6">
							<button type="button" class="btn btn-success" onClick="save_target_set_line()">Submit</button>
							<button type="reset" class="btn btn-danger">Reset</button>
						</div>
				      </div> -->

					  </form>

		</div> <!-- End of <div class="panel panel-default"> -->




</div> <!-- End of <div class="col-sm-12 col-md-12 col-lg-12"> -->