<?php
session_start();
require_once("../login/session.php");
include('../login/db_connection_class.php');
$obj = new DB_Connection_Class();
$obj->connection();

 ?>



 <div class="panel panel-default"> <!-- This div will create a block/panel for FORM -->

        <div id="element">

    <div class="panel-heading" style="color:#191970;"><b>Swing Production per Hour</b></div> <!-- This will create a upper block for FORM (Just Beautification) -->

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item active" aria-current="page">Home</li>
          <li class="breadcrumb-item"><a onclick="load_page('swing/hour.php')">Swing Production Per Hour</a></li>
        </ol>
     </nav>

    <form class="form-horizontal" action="" style="margin-top:10px;" name="process_program_info_form" id="process_program_info_form">

        
						<div class="form-group form-group-sm" id="form-group_for_customer_name">
							<label class="control-label col-sm-3" for="line_no" style="margin-right:0px; color:#00008B;">Line No:<span style="color:red"> *</span></label>
							<div class="col-sm-6">
								<select  class="form-control for_auto_complete" id="line_no" name="line_no"  onchange="line_select()">
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



        <div class="form-group form-group-sm" id="form_group_for_garments">
          <label class="control-label col-sm-3" for="date" style="margin-right:0px; color:#00008B;">Date:</span></label>
            <div class="col-sm-6">
              <input type="text" class="form-control" id="date"  name="date" placeholder="Date" disabled>


            </div>
          </div> <!-- End of <div class="form-group form-group-sm" id="form_group_for_garments"> -->



        <div class="form-group form-group-sm" id="form_group_for_buyer_name">
        <label class="control-label col-sm-3" for="buyer_name" style="margin-right:0px; color:#00008B;">Buyer Name:<span style="color:red"> *</span></label>
          <div class="col-sm-6">
          <input type="text" class="form-control" id="buyer_name"  name="buyer_name" placeholder="Buyer Name" disabled>

          </div>
        </div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_buyer_name"> -->
      <div class="" id="style_name_select">


          <div class="form-group form-group-sm" id="form-form-group_for_style">
          <label class="control-label col-sm-3" for="style" style="margin-right:0px; color:#00008B;">
            Select Style:<span style="color:red"> *</span></label>
            <div class="col-sm-6" >
            <input type="text" class="form-control" id="style_name"  name="style_name" placeholder="Style Name" disabled>


            </div>
          </div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_style"> -->


              <div class="form-group form-group-sm" id="form-form-group_for_color">
                      <label class="control-label col-sm-3" for="color" style="margin-right:0px; color:#00008B;">
                        Select Color:<span style="color:red"> *</span></label>
                        <div class="col-sm-6">
                        <input type="text" class="form-control" id="color_name"  name="color_name" placeholder="Color Name" disabled>

                        </div>
                      </div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_color"> -->

      </div> <!-- End of <div id="style_name_select" Used for generating ajax content"> -->

        <div class="form-group form-group-sm" id="form_group_for_hour">
        <label class="control-label col-sm-3" for="line_number" style="margin-right:0px; color:#00008B;">Man Per Hour:<span style="color:red"> *</span></label>
          <div class="col-sm-6">
          <input type="text" class="form-control" id="man_power"  name="man_power" placeholder="Man Per Hower">

          </div>
        </div> <!-- End of <div class="form-group form-group-sm" id="form-group_for_hour"> -->

          <div class="form-group form-group-sm" id="form_group_for_garments">
          <label class="control-label col-sm-3" for="garments" style="margin-right:0px; color:#00008B;">Total Completed garments:<span style="color:red"> *</span></label>
            <div class="col-sm-6">
              <input type="text" class="form-control" id="garments"  name="garments" placeholder="Total Completed garments">
              <br>
              <button type="submit" class="btn btn-primary">Submit</button>


            </div>
          </div> <!-- End of <div class="form-group form-group-sm" id="form_group_for_garments"> -->

</form>
<script type="text/javascript">

$(document).ready(function ()
{
  $('.for_auto_complete').chosen();

  $('#buyer_name').change(function() {
      var data_k = $( "select#buyer_name" ).val();

      $.ajax({
          type:"GET",
          data : data_k,
          url : "swing/select_style.php?id='"+data_k+"'",
          async: false,
          success : function(response) {
             $("#style_name_select").html(response);

          },
          error: function() {
              alert('Error occured');
          }
      });
    });

$('#line_number_of_hour').change(function(){

  var buyer_name=$('#buyer_name').val();
  var style_of_day=$('#style_of_day').val();
  var color_of_day=$('#color_of_day').val();
  var line_number_of_hour=$('#line_number_of_hour').val();
  $.ajax({
      type:"GET",
      data:{buyer_name: buyer_name,
      style_of_day: style_of_day,
      color_of_day:color_of_day,
      line_number_of_hour:line_number_of_hour},
      url : "swing/hour_exits.php?buyer_name='"+buyer_name+"'&style_of_day='"+style_of_day+"'&color_of_day='"+color_of_day+"'&line_number_of_hour='"+line_number_of_hour+"'",
      async: false,
      success : function(response) {
      //allready selectd;]
      if (response==="") {

      }
      else {
        alert(response);

      }

      },
      error: function() {
          alert('Error occured');
      }
  });

});


    $("#process_program_info_form").on("submit", function(e)
    {
      e.preventDefault();
      // var formData = new FormData(this);
      $.ajax({
          url: 'swing/create_hour.php',
          type: "POST",
          data:  new FormData(this),
          contentType: false,
          cache: false,
          processData:false,
          success: function(data)
          {
              alert(data);
              document.getElementById("process_program_info_form").reset();
              return false; // Prevent page refresh
          },
          error: function()
          {

          }
      });

    });

});

</script>


<script>
  
function line_select()
{
	let line=document.getElementById('line_no').value;
  
}
</script>