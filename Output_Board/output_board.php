<?php
session_start();
error_reporting(0);
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

    <?php
    $sql="SELECT style_name.style_name, `production_details`.`recording_time`,`production_details`.`input_date` ,f_details.* FROM
(
Select (T_details.Total_Required_Date-T_details.Running_Days) as Balance_Days 
,  sum(T_details.man_power)/60 as output_running_hours, T_details.Running_Days/(sum(T_details.man_power)/60) as avg_hours, T_details.*
FROM
(select `buyer`.`buyer_name`, details.* from 
(select style_details.buyer_no,`style_details`.`smv`,full_details.* from (select DISTINCT line_wise_output_per_hour.input_date as First_output_date,datediff(CURDATE(),line_wise_output_per_hour.input_date) as Running_Days,line_wise_output_per_hour.line_no,`line_wise_output_per_hour`.`man_power`,`line_wise_output_per_hour`.`quantity` ,`line_wise_output_per_hour`.`hour_no`,day_target.style_details_id,day_target.color,day_target.po,day_target.ship_date, 
`order_details`.`order_qty`,order_details.plan_cut_qty,plan_details.allocated_qty,
plan_details.plan_input_date,plan_details.plan_output_start_date,plan_details.plan_output_end_date,plan_details.total_leave,plan_details.top_target,
datediff(plan_details.plan_output_end_date, plan_details.plan_output_start_date) as Total_Required_Date,
(plan_details.allocated_qty/datediff(plan_details.plan_output_end_date, plan_details.plan_output_start_date)) Day_Avg_Target,swing_production_planning.layout_start_time,swing_production_planning.layout_end_time,swing_production_planning.total_time
 FROM `daily_target_set_line_details` as day_target INNER JOIN line_wise_output_per_hour as day_output 
ON day_target.style_details_id=day_output.order_details_id and day_target.color=day_output.color and 
day_target.po=day_output.po and day_target.ship_date=day_output.ship_date INNER JOIN order_details 
ON order_details.style_details_id=day_output.order_details_id and order_details.color=day_output.color 
and order_details.po=day_output.po and order_details.ship_date=day_output.ship_date
 INNER JOIN plan_details 
ON plan_details.order_details_id=day_output.order_details_id and plan_details.color=day_output.color 
and plan_details.po=day_output.po and plan_details.ship_date=day_output.ship_date
INNER JOIN swing_production_planning
ON swing_production_planning.order_details_id=day_output.order_details_id and swing_production_planning.color=day_output.color 
and swing_production_planning.po=day_output.po and swing_production_planning.ship_date=day_output.ship_date
INNER JOIN line_wise_output_per_hour
ON line_wise_output_per_hour.order_details_id=swing_production_planning.order_details_id and line_wise_output_per_hour.color=swing_production_planning.color 
and line_wise_output_per_hour.po=swing_production_planning.po and line_wise_output_per_hour.ship_date=swing_production_planning.ship_date) as full_details,style_details
WHERE full_details.style_details_id=`style_details`.`id`) as details,buyer
WHERE buyer.buyer_id=details.buyer_no) T_details) f_details
INNER JOIN style_name
ON style_name.row_id=f_details.style_details_id 
INNER JOIN production_details
ON production_details.order_details_id=f_details.style_details_id and
production_details.color=f_details.color 
and production_details.po=f_details.po 
and production_details.ship_date=f_details.ship_date
and production_details.ship_date
 ORDER BY `production_details`.`recording_time` ASC LIMIT 1";

    $result = mysqli_query($con,$sql) or die(mysqli_error($con));


    ?>


		<div class="panel panel-default"> <!-- This div will create a block/panel for FORM -->

            <div id="element">

				<div class="panel-heading" style="color:#191970;"><b>Output Board</b></div> <!-- This will create a upper block for FORM (Just Beautification) -->

				<nav aria-label="breadcrumb">
					  <ol class="breadcrumb">
					    <li class="breadcrumb-item active" aria-current="page">Home</li>
					    <li class="breadcrumb-item"><a onclick="load_page('swing/swing_production_info.php')">Output Board</a></li>
					  </ol>
				 </nav>
            </div> 


                    <!-- DataTales Example -->
                    <div class="card shadow mb-4" style="font-size: 14px;">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Output Board Details</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        <th>Line</th>                                           </th>
                                            <th>Buyer</th>                                            </th>
                                            <th>Style</th>
                                            <th>Order Qty</th>
                                            <th>Cut Qty</th>
                                            <th>Allocated Qty</th>
                                            <th>Ship Date</th>
                                            <th>SMV</th>
                                            <th>Plan Input Date</th>
                                            <th>Plan Output Date</th>
                                            <th>Plan End Date</th>                                            
                                            <th>Leave</th>
                                            <th>Total Required Date</th>
                                            <th>Top Target</th>
                                            <th>Day Avg. Target</th>
                                            <th>Input Date</th>
                                            <th>1st Output Date</th>
                                            <th>Layout Start Time</th>
                                            <th>Layout End Time</th>
                                            <th>Hours Taken</th>
                                            <th>Output Running Days</th>
                                            <th>Output Running Hours</th>
                                            <th>Avg. Hours</th>

                                            <th>Balance Days</th>

                                            <th>Total Quantity</th>
                                            <th>Avg. Achive</th>
                                            <th>Ahv %</th>                                               
                                            <th>Balance Qty</th>                                           
                                            <th>Balance Qty. Hourly Target (8H)</th> 
                                        </tr>
                                    </thead>                                   
                                    <tbody>


                                        <tr>
                                            <?php
                                            if(mysqli_num_rows($result)>0)
                                            {
                                                while( $row = mysqli_fetch_array( $result))
                                                {
                                                    echo "<td>".$row['line_no']."</td>";
                                                    echo "<td>".$row['buyer_name']."</td>";
                                                    echo "<td>".$row['style_name']."</td>";

                                                    echo "<td>".$row['order_qty']."</td>";

                                                    echo "<td>".$row['plan_cut_qty']."</td>";

                                                    echo "<td>".$row['allocated_qty']."</td>";

                                                    echo "<td>".$row['ship_date']."</td>";

                                                    echo "<td>".$row['smv']."</td>";

                                                    echo "<td>".$row['plan_input_date']."</td>";
                                                    echo "<td>".$row['plan_output_start_date']."</td>";
                                                    echo "<td>".$row['plan_output_end_date']."</td>";
                                                    echo "<td>".$row['total_leave']."</td>";
                                                    echo "<td>".$row['Total_Required_Date']."</td>";
                                                    echo "<td>".$row['top_target']."</td>";
                                                    echo "<td>".$row['Day_Avg_Target']."</td>";
                                                    echo "<td>".$row['input_date']."</td>";
                                                    echo "<td>".$row['First_output_date']."</td>";
                                                    echo "<td>".$row['layout_start_time']."</td>";
                                                    echo "<td>".$row['layout_start_time']."</td>";
                                                    echo "<td>".$row['total_time']."</td>";
                                                    echo "<td>".$row['Running_Days']."</td>";

                                                    echo "<td>".$row['output_running_hours']."</td>";

                                                    echo "<td>".$row['avg_hours']."</td>";

                                                    echo "<td>".$row['Balance_Days']."</td>";

                                                    echo "<td>".$row['quantity']."</td>";

                                                    echo "<td>".$row['quantity']/$row['Running_Days']."</td>";
                                                    echo "<td>".($row['quantity']/$row['Running_Days'])/$row['Day_Avg_Target']."</td>";
                                                    echo "<td>". ($row['quantity']-$row['allocated_qty'])."</td>";
                                                    echo "<td>".($row['quantity']-$row['allocated_qty'])/$row['Balance_Days']."</td>";





                                                }
                                            }
                                            ?>

                                                    
                                            
                                        </tr>
                                       
                                      
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    
		</div> <!-- End of <div class="panel panel-default"> -->

</div> <!-- End of <div class="col-sm-12 col-md-12 col-lg-12"> -->