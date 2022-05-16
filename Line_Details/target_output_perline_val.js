

function target_output_perline_val()
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

    else if(document.getElementById("hourly_target").value.trim()=="")
		{
			alert("Please Enter Hourly Target");
			document.getElementById("hourly_target").focus();
			return false;
		}

        
		
		
}

