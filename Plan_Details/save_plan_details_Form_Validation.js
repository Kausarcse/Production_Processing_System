

function save_plan_details_Form_Validation()
{
		if(document.getElementById("style_details_id").value=="select")
		{
			alert("Please Select style ID");
			document.getElementById("style_details_id").focus();
			return false;
		}

		else if(document.getElementById("order_details_id").value=="select")
		{
			alert("Please Select Date");
			document.getElementById("order_details_id").focus();
			return false;
		}
		
		else if(document.getElementById("line_no").value=="select")
		{
			alert("Please Enter Line Number");
			document.getElementById("line_no").focus();
			return false;
		}
		
		else if(document.getElementById("line_allocated_qty").value.trim()=="")
		{
			alert("Please Enter Line Allocated Quantity");
			document.getElementById("line_allocated_qty").focus();
			return false;
		}

		else if(document.getElementById("line_allocated_qty").value.trim()=="")
		{
			alert("Please Enter Line Allocated Quantity");
			document.getElementById("line_allocated_qty").focus();
			return false;
		}

		else if(document.getElementById("plan_input_date").value.trim()=="")
		{
			alert("Please Enter Plan Input Date");
			document.getElementById("plan_input_date").focus();
			return false;
		}

		else if(document.getElementById("plan_output_start_date").value.trim()=="")
		{
			alert("Please Enter Plan Output Date");
			document.getElementById("plan_output_start_date").focus();
			return false;
		}

		else if(document.getElementById("plan_output_end_date").value.trim()=="")
		{
			alert("Please Enter Plan Output End Date");
			document.getElementById("plan_output_end_date").focus();
			return false;
		}

		
		
		else if(document.getElementById("total_leave").value.trim()=="")
		{
			alert("Please Enter Total Leave");
			document.getElementById("total_leave").focus();
			return false;
		}
		else if(document.getElementById("top_target").value.trim()=="")
		{
			alert("Please Enter Top Target");
			document.getElementById("top_target").focus();
			return false;
		}

		
		
		

	

}

