

function swing_daily_form_val()
{
		
	 if(document.getElementById("input_date").value.trim()=="")
		{
			alert("Please Enter Date");
			document.getElementById("input_date").focus();
			return false;
		}

		else if(document.getElementById("style_details_id").value=="select")
		{
			alert("Please Enter Style ID");
			document.getElementById("style_details_id").focus();
			return false;
		}

		else if(document.getElementById("order_details_id").value=="select")
		{
			alert("Please Enter Ship Date");
			document.getElementById("order_details_id").focus();
			return false;
		}

		else if(document.getElementById("cutting_input_date").value.trim()=="")
		{
			alert("Please Add Cutting Completed Date");
			document.getElementById("cutting_input_date").focus();
			return false;
		}

		else if(document.getElementById("line_no").value=="select")
		{
			alert("Please Add Line No");
			document.getElementById("line_no").focus();
			return false;
		}

		

		


}

