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
<script type='text/javascript' src='Production_Details/production_detials_Form_Validation.js'></script>

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

function set_previous_cutting_details(data)
{
	
	var order_details_id = document.getElementById("order_details_id").value;

	$.ajax({
				url: 'Production_Details/return_cutting_details_previous_value.php',
				dataType: 'text',
				type: 'post',
				contentType: 'application/x-www-form-urlencoded',
				data: {order_details_id:order_details_id},
				success: function( data, textStatus, jQxhr )
				{
					     //alert(data);
						// 	console.log(data)
						 document.getElementById('to_set_cutting_details_previous_value').innerHTML = data;
				
				},
				error: function( jqXhr, textStatus, errorThrown )
				{
						//console.log( errorThrown );
						alert(errorThrown);
				}
			});
	
}

function return_information_for_line(line_info)
{
    
    var order_details_id=document.getElementById("order_details_id").value;
    var input_date=document.getElementById("input_date").value;
    var line_no = line_info;

     $.ajax({
			 		url: 'Production_Details/return_information_for_line.php',
			 		dataType: 'text',
			 		type: 'post',
			 		contentType: 'application/x-www-form-urlencoded',
			 		data: {order_details_id:order_details_id, input_date:input_date, line_no:line_no},
			 		success: function( data, textStatus, jQxhr )
			 		{
			 				// alert(data);
							 // console.log(data)
							 var splitted_data_for_line_info = data.split('?fs?');
							 document.getElementById('daily_cutting_qty').value = splitted_data_for_line_info[0];
							 document.getElementById('sewing_input_quantity').value = splitted_data_for_line_info[1];

			 		
			 		},
			 		error: function( jqXhr, textStatus, errorThrown )
			 		{
			 				//console.log( errorThrown );
			 				alert(errorThrown);
			 		}
			 }); // End of $.ajax({


   
}


 function save_style_details()
 {

       var validate = production_detials_Form_Validation();
       var url_encoded_form_data = $("#order_details_form").serialize(); //This will read all control elements value of the form	

	   if(validate != false)
	   {
		  	 $.ajax({
			 		url: 'Production_Details/production_details_save.php',
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

		<div class="panel panel-default"> <!-- This div will create a block/panel for FORM -->

            <div id="element">

				<div class="panel-heading" style="color:#191970;"><b>Add Production Details</b></div> <!-- This will create a upper block for FORM (Just Beautification) -->

				<nav aria-label="breadcrumb">
					  <ol class="breadcrumb">
					    <li class="breadcrumb-item active" aria-current="page">Home</li>
					    <li class="breadcrumb-item"><a onclick="load_page('Order_Details/order_details.php')">Production Details</a></li>
					
					
					</ol>
				 </nav>
				<form class="form-horizontal" action="" style="margin-top:10px;" name="order_details_form" id="order_details_form">
				
				
				
				<div class="form-group form-group-sm " id="form-item_name">
								<label class="control-label col-sm-3" for="received_from_cutting" style="color:#00008B;">Input Date:</label>
								
								<div class="col-sm-6">
								<?php echo gmdate("m-d-Y");?>
								</div>
								<!-- <div class="col-sm-3 row nopadding">
									<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
								</div> -->
				</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->


								<input type="hidden" class="form-control" id="input_date"
								 name="input_date" value="<?php
								echo gmdate("Y-m-d");?>">


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

						
						<div id="ajax_ship_date"  class="form-group form-group-sm" id="form-group_for_customer_name">
						
						</div> 

					
					<div id="buyer_smv_item_ajax">
							
					</div> 


					


						<div id="to_set_cutting_details_previous_value">

							<div class="form-group form-group-sm " id="form-item_name">
									<label class="control-label col-sm-3" for="daily_cutting_qty" style="color:#00008B;">Daily Cutting Quantity:<span style="color:red"> </span></label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" id="daily_cutting_qty" name="daily_cutting_qty" placeholder="Enter Cutting Quantity" required>
									</div>
									<!-- <div class="col-sm-3 row nopadding">
										<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
									</div> -->
									<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('item_quantity')"></i>
							</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->

							<div class="form-group form-group-sm" id="form-group_for_line_no">
							<label class="control-label col-sm-3" for="line_no" style="margin-right:0px; color:#00008B;">Line No:<span style="color:red"> </span></label>
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




							<div class="form-group form-group-sm " id="form-sewing_input_quantity">
									<label class="control-label col-sm-3" for="sewing_input_quantity" style="color:#00008B;">Sewing Input Quantity:<span style="color:red"> </span></label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" id="sewing_input_quantity" name="sewing_input_quantity" placeholder="Enter Sewing Input Quantity" required>
									</div>
									<!-- <div class="col-sm-3 row nopadding">
										<input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
									</div> -->
									<i class="glyphicon glyphicon-remove" onclick="Remove_Value_Of_This_Element('item_quantity')"></i>
							</div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_pp_creation_date"> -->


						</div>



                        

                       
					
						

						<div class="form-group form-group-sm">
								<div class="col-sm-offset-3 col-sm-6">
									<button type="button" class="btn btn-primary" onClick="save_style_details()">Submit</button>
									<button type="reset" class="btn btn-success">Reset</button>
								</div>
						</div>

				</form>

		</div> <!-- End of <div class="panel panel-default"> -->




</div> <!-- End of <div class="col-sm-12 col-md-12 col-lg-12"> -->