

function swing_production_info()
{
		if(document.getElementById("style_details_id").value=="select")
		{
			alert("Please Select Style Details Id");
			document.getElementById("style_details_id").focus();
			return false;
		}
		else if(document.getElementById("order_details_id").value=="select")
		{
			alert("Please Enter Ship Date");
			document.getElementById("order_details_id").focus();
			return false;
		}
		else if(document.getElementById("line_no").value=="select")
		{
			alert("Please Enter Line Number");
			document.getElementById("line_no").focus();
			return false;
		}

		else if(document.getElementById("search-from-date").value.trim()=="")
		{
			alert("Please Enter Layout Start Time");
			document.getElementById("search-from-date").focus();
			return false;
		}

		// else if(document.getElementById("search-to-date").value.trim()=="")
		// {
		// 	alert("Please Layout End Time");
		// 	document.getElementById("search-to-date").focus();
		// 	return false;
		// }
		
		// else if(document.getElementById("first_output_date").value.trim()=="")
		// {
		// 	alert("Please Enter first Ouput Date");
		// 	document.getElementById("first_output_date").focus();
		// 	return false;
		// }

}

