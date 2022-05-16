

function line_wise_input_hour_val()
{
      
    if(document.getElementById("style_details_id").value=="select")
    {
        alert("Please Style  ID");
        document.getElementById("style_details_id").focus();
        return false;
    }
    else  if(document.getElementById("style_details_date").value=="select")
    {
        alert("Please Enter Ship Date");
        document.getElementById("style_details_date").focus();
        return false;
    }

    else  if(document.getElementById("line_no").value=="select")
    {
        alert("Please Enter Line Number");
        document.getElementById("line_no").focus();
        return false;
    }

    else if(document.getElementById("hour_no").value=="select")
		{
			alert("Please Enter Hour Number");
			document.getElementById("hour_no").focus();
			return false;
		}
        else if(document.getElementById("man_power").value.trim()=="")
		{
			alert("Please Enter Man Power");
			document.getElementById("man_power").focus();
			return false;
		}
        else if(document.getElementById("hourly_output").value.trim()=="")
		{
			alert("Please Enter Hourly Output Power");
			document.getElementById("hourly_output").focus();
			return false;
		}     
		
		
}

