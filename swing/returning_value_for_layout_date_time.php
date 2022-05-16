<?php
session_start();
require_once("../login/session.php");
include('../login/db_connection_class.php');
$obj = new DB_Connection_Class();
$obj->connection();



$user_id = $_SESSION['user_id'];
$password = $_SESSION['password'];
$user_name = $_SESSION['user_name'];

$order_details_id= $_POST['order_details_id'];
$line_no= $_POST['line_no'];


$sql = "SELECT * FROM swing_production_planning 
WHERE order_details_id = '$order_details_id' AND line_no = '$line_no'";

$result = mysqli_query($con,$sql) or die(mysqli_error($con));

if(mysqli_num_rows($result)>0)
{

    $row = mysqli_fetch_array( $result);

    $splitted_start_date_time=explode("-",$row['layout_start_time']);

    $splitted_start_time = explode(':',$splitted_start_date_time[2]);


    $layout_start_time = $splitted_start_date_time[0]."/".$splitted_start_date_time[1]."/".$splitted_start_time[0].":".$splitted_start_time[1];
    
    if($row['layout_end_time'] != '0000-00-00 00:00:00')
    {
        $splitted_end_date_time=explode("-",$row['layout_end_time']);
        $splitted_end_time = explode(':',$splitted_end_date_time[2]);
    
        $layout_end_time = $splitted_end_date_time[0]."/".$splitted_end_date_time[1]."/".$splitted_end_time[0].":".$splitted_end_time[1];    
    }
    else
    {
        $layout_end_time = '';
    }
   
    if($row['first_output_date'] != '0000-00-00')
    {
        $splitted_first_output_date = explode("-",$row['first_output_date']);

        $first_output_date = $splitted_first_output_date[0]."/".$splitted_first_output_date[1]."/".$splitted_first_output_date[2];    
    }
    else
    {
        $first_output_date = '';
    }
    

    
    // $layout_start_time = date_format(date_create($row['layout_start_time']),"Y/m/d h:i:s");

    // $layout_end_time = date_format(date_create($row['layout_end_time']),"Y/m/d h:i:s");

    ?>

        <div class="form-group form-group-sm " id="form-item_name">
            <label class="control-label col-sm-3" for="total_layout_time" style="color:#00008B;">Layout Start Time <span style="color:red"> *</span></label>
            
            <div class="col-sm-6">
                <input type="text" class="form-control" name="layout_start_time" id="search-from-date" value="<?php echo $layout_start_time ?>" required>
            </div>
        </div> 
                    

        <div class="form-group form-group-sm " id="form-item_name">
            <label class="control-label col-sm-3" for="total_layout_time" style="color:#00008B;">Layout End Time</label>
            
            <div class="col-sm-6">
                <input type="text" class="form-control" name="layout_end_time" id="search-to-date" value="<?php echo $layout_end_time ?>" onchange="get_value_for_first_output()">
            </div>
        </div> 

        <div class="form-group form-group-sm " id="div_total_layout_time" style="display:none">
            <label class="control-label col-sm-3" for="total_layout_time" style="color:#00008B;">{{ message }}</label>
            
            <div class="col-sm-6" id="total_layout_time_ajax">
                <input type="text" class="form-control"  id="total_layout_time" name="total_layout_time"  value="<?php echo $row['total_time'] ?>">
            </div>
                <div class="col-sm-3 row nopadding">
                <input type="text" class="form-control" id="alternate_swing_start_date" name="alternate_swing_start_date" readonly>
            </div> 
        </div>
                    
						
        <div class="form-group form-group-sm " id="form-group_for_pp_creation_date">
            <label class="control-label col-sm-3" for="first_output_date" style="color:#00008B;">First Output Date:</label>
            
            <div class="col-sm-6">
                <input type="text" class="form-control" id="first_output_date" name="first_output_date" value="<?php echo $first_output_date ?>"  readonly>
            </div>
            
        </div>  

    <?php

}
else if( mysqli_num_rows($result) < 1)
{
    ?>
        <div class="form-group form-group-sm " id="form-item_name">
            <label class="control-label col-sm-3" for="total_layout_time" style="color:#00008B;">Layout Start Time <span style="color:red"> *</span></label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="layout_start_time" id="search-from-date" placeholder="Enter layout Start Time" >
            </div>
        </div> 


        <div class="form-group form-group-sm " id="form-item_name">
            <label class="control-label col-sm-3" for="total_layout_time" style="color:#00008B;">Layout End Time</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="layout_end_time" id="search-to-date" placeholder="Enter layout End Time" onchange="get_value_for_first_output()">
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

    <?php
}

?>



<script>
	   $('body').ready(function(){
		$('.for_auto_complete').chosen();
		
		 });


   
</script>
<?php



$obj->disconnection();


?>
