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
<script type='text/javascript' src='Line_Details/save_line_man_details_form.js'></script>

<style>

.form-group		/* This is for reducing Gap among Form's Fields */
{

	margin-bottom: 5px;

}
.row.no-gutter {
  margin-left: 0;
  margin-right: 0;
}
tr th{
	text-align:center;
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


 function save_L_man_details()
 {

       var validate = save_line_man_details_form();
       var url_encoded_form_data = $("#save_line_man_details").serialize(); //This will read all control elements value of the form	
       if(validate != false)
	   {
		  	 $.ajax({
			 		url: 'Line_Details/save_man_line.php',
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





</script>



<div class="col-sm-12 col-md-12 col-lg-12">

		<div class="panel panel-default"> <!-- This div will create a block/panel for FORM -->

            <div id="element">

				<div class="panel-heading" style="color:#191970;"><b>Line and ManPower Details</b></div> <!-- This will create a upper block for FORM (Just Beautification) -->

				<nav aria-label="breadcrumb">
					  <ol class="breadcrumb">
					    <li class="breadcrumb-item active" aria-current="page">Home</li>
					    <li class="breadcrumb-item"><a onclick="load_page('Order_Details/order_details.php')">Line and ManPower Details</a></li>
					  </ol>
				 </nav>

				<form class="form-horizontal" action="" style="margin-top:10px;" name="save_line_man_details" id="save_line_man_details">
				<table class="table">
  <thead>
    <tr>
      <th scope="col">Line Number</th>
      <th scope="col">Operator</th>
      <th scope="col">Helper</th>
      <th scope="col">Iron Man</th>
	  <th scope="col">Date</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
     
    <td>
		<input type="text" class="form-control" id="operator1" name="operator1" value="52" required >

		</td>
      <td><input type="text" class="form-control" id="helper1" name="helper1" value="8" required >
	</td>
	<td><input type="text" class="form-control" id="iron_man1" name="iron_man1" value="4" required >
	</td>
	<td><?php
		echo gmdate("m-d-Y");
		?></td>

    </tr>
    <tr>
      <th scope="row" >2</th>
	  <td><input type="text" class="form-control" id="operator2" name="operator2" value="52" required >
	</td>
      <td><input type="text" class="form-control" id="helper2" name="helper2" value="8" required >
	</td>
	<td><input type="text" class="form-control" id="iron_man2" name="iron_man2" value="4" required >
	</td>
	<td><?php
		echo gmdate("m-d-Y");
		?></td>
   
    </tr>

	<tr>
      <th scope="row" >3</th>
	  <td><input type="text" class="form-control" id="operator3" name="operator3" value="52" required >
	</td>
      <td><input type="text" class="form-control" id="helper3" name="helper3" value="8" required >
	</td>
	<td><input type="text" class="form-control" id="iron_man3" name="iron_man3" value="4" required >
	</td>
	<td><?php
		echo gmdate("m-d-Y");
		?></td>
   
    </tr>

	<tr>
      <th scope="row" >4</th>
	  <td><input type="text" class="form-control" id="operator4" name="operator4" value="52" required >
	</td>
      <td><input type="text" class="form-control" id="helper4" name="helper4" value="8" required >
	</td>
	<td><input type="text" class="form-control" id="iron_man4" name="iron_man4" value="4" required >
	</td>
	<td><?php
		echo gmdate("m-d-Y");
		?></td>
   
    </tr>

	<tr>
      <th scope="row" >5</th>
	  <td><input type="text" class="form-control" id="operator5" name="operator5" value="52" required >
	</td>
      <td><input type="text" class="form-control" id="helper5" name="helper5" value="8" required >
	</td>
	<td><input type="text" class="form-control" id="iron_man5" name="iron_man5" value="4" required >
	</td>
	<td><?php
		echo gmdate("m-d-Y");
		?></td>
   
    </tr>

	<tr>
      <th scope="row" >6</th>
	  <td><input type="text" class="form-control" id="operator6" name="operator6" value="52" required >
	</td>
      <td><input type="text" class="form-control" id="helper6" name="helper6" value="8" required >
	</td>
	<td><input type="text" class="form-control" id="iron_man6" name="iron_man6" value="4" required >
	</td>
	<td><?php
		echo gmdate("m-d-Y");
		?></td>
   
    </tr>

	<tr>
      <th scope="row" >7</th>
	  <td><input type="text" class="form-control" id="operator7" name="operator7" value="52" required >
	</td>
      <td><input type="text" class="form-control" id="helper7" name="helper7" value="8" required >
	</td>
	<td><input type="text" class="form-control" id="iron_man7" name="iron_man7" value="4" required >
	</td>
	<td><?php
		echo gmdate("m-d-Y");
		?></td>
   
    </tr>

	<tr>
      <th scope="row" >8</th>
	  <td><input type="text" class="form-control" id="operator8" name="operator8" value="52" required >
	</td>
      <td><input type="text" class="form-control" id="helper8" name="helper8" value="8" required >
	</td>
	<td><input type="text" class="form-control" id="iron_man8" name="iron_man8" value="4" required >
	</td>
	<td><?php
		echo gmdate("m-d-Y");
		?></td>
   
    </tr>

	<tr>
      <th scope="row" >9</th>
	  <td><input type="text" class="form-control" id="operator9" name="operator9" value="52" required >
	</td>
      <td><input type="text" class="form-control" id="helper9" name="helper9" value="8" required >
	</td>
	<td><input type="text" class="form-control" id="iron_man9" name="iron_man9" value="4" required >
	</td>
	<td><?php
		echo gmdate("m-d-Y");
		?></td>
   
    </tr>

	<tr>
      <th scope="row" >10</th>
	  <td><input type="text" class="form-control" id="operator10" name="operator10" value="52" required >
	</td>
      <td><input type="text" class="form-control" id="helper10" name="helper10" value="8" required >
	</td>
	<td><input type="text" class="form-control" id="iron_man10" name="iron_man10" value="4" required >
	</td>
	<td><?php
		echo gmdate("m-d-Y");
		?></td>
   
    </tr>

	<tr>
      <th scope="row" >11</th>
	  <td><input type="text" class="form-control" id="operator11" name="operator11" value="52" required >
	</td>
      <td><input type="text" class="form-control" id="helper11" name="helper11" value="8" required >
	</td>
	<td><input type="text" class="form-control" id="iron_man11" name="iron_man11" value="4" required >
	</td>
	<td><?php
		echo gmdate("m-d-Y");
		?></td>
   
    </tr>

	<tr>
      <th scope="row" >12</th>
	  <td><input type="text" class="form-control" id="operator12" name="operator12" value="52" required >
	</td>
      <td><input type="text" class="form-control" id="helper12" name="helper12" value="8" required >
	</td>
	<td><input type="text" class="form-control" id="iron_man12" name="iron_man12" value="4" required >
	</td>
	<td><?php
		echo gmdate("m-d-Y");
		?></td>
   
    </tr>

	<tr>
      <th scope="row" >13</th>
	  <td><input type="text" class="form-control" id="operator13" name="operator13" value="52" required >
	</td>
      <td><input type="text" class="form-control" id="helper13" name="helper13" value="8" required >
	</td>
	<td><input type="text" class="form-control" id="iron_man13" name="iron_man13" value="4" required >
	</td>
	<td><?php
		echo gmdate("m-d-Y");
		?></td>
   
    </tr>

	<tr>
      <th scope="row" >14</th>
	  <td><input type="text" class="form-control" id="operator14" name="operator14" value="52" required >
	</td>
      <td><input type="text" class="form-control" id="helper14" name="helper14" value="8" required >
	</td>
	<td><input type="text" class="form-control" id="iron_man14" name="iron_man14" value="4" required >
	</td>
	<td><?php
		echo gmdate("m-d-Y");
		?></td>
   
    </tr>

	<tr>
      <th scope="row" >15</th>
	  <td><input type="text" class="form-control" id="operator15" name="operator15" value="52" required >
	</td>
      <td><input type="text" class="form-control" id="helper15" name="helper15" value="8" required >
	</td>
	<td><input type="text" class="form-control" id="iron_man15" name="iron_man15" value="52"4 required >
	</td>
	<td><?php
		echo gmdate("m-d-Y");
		?></td>
   
    </tr>

	<tr>
      <th scope="row" >16</th>
	  <td><input type="text" class="form-control" id="operator16" name="operator16" value="52" required >
	</td>
      <td><input type="text" class="form-control" id="helper16" name="helper16" value="8" required >
	</td>
	<td><input type="text" class="form-control" id="iron_man16" name="iron_man16" value="4" required >
	</td>
	<td><?php
		echo gmdate("m-d-Y");
		?></td>
   
    </tr>

	<tr>
      <th scope="row" >17</th>
	  <td><input type="text" class="form-control" id="operator17" name="operator17" value="52" required >
	</td>
      <td><input type="text" class="form-control" id="helper17" name="helper17" value="8" required >
	</td>
	<td><input type="text" class="form-control" id="iron_man17" name="iron_man17"value="4" required >
	</td>
	<td><?php
		echo gmdate("m-d-Y");
		?></td>
   
    </tr>


	<tr>
      <th scope="row" >18</th>
	  <td><input type="text" class="form-control" id="operator18" name="operator18" value="52" required >
	</td>
      <td><input type="text" class="form-control" id="helper18" name="helper18" value="8" required >
	</td>
	<td><input type="text" class="form-control" id="iron_man18" name="iron_man18" value="4" required >
	</td>
	<td><?php
		echo gmdate("m-d-Y");
		?></td>
   
    </tr>


	<tr>
      <th scope="row" >19</th>
	  <td><input type="text" class="form-control" id="operator19" name="operator19" value="52" required >
	</td>
      <td><input type="text" class="form-control" id="helper19" name="helper19" value="8" required >
	</td>
	<td><input type="text" class="form-control" id="iron_man19" name="iron_man19" value="4" required >
	</td>
	<td><?php
		echo gmdate("m-d-Y");
		?></td>
   
    </tr>


	<tr>
      <th scope="row" >20</th>
	  <td><input type="text" class="form-control" id="operator20" name="operator20" value="52" required >
	</td>
      <td><input type="text" class="form-control" id="helper20" name="helper20" value="8" required >
	</td>
	<td><input type="text" class="form-control" id="iron_man20" name="iron_man20" value="4" required >
	</td>
	<td><?php
		echo gmdate("m-d-Y");
		?></td>
   
    </tr>

  
  </tbody>
</table>	
                
           			

						<div class="form-group form-group-sm">
								<div class="col-sm-offset-5 col-sm-6">
									<button type="button" class="btn btn-primary" onClick="save_L_man_details()">Submit</button>
									<button type="reset" class="btn btn-success">Reset</button>
								</div>
						</div>

				</form>

		</div> <!-- End of <div class="panel panel-default"> -->




</div> <!-- End of <div class="col-sm-12 col-md-12 col-lg-12"> -->