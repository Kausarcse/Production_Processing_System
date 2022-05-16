

function save_line_man_details_form()
{
    for (let index = 1; index <= 20; index++) {
        if(document.getElementById("operator"+index).value.trim()=="")
		{
			alert("Please Enter Operator Number On Line "+index);
			document.getElementById("operator"+index).focus();
			return false;
		}
		else if(document.getElementById("helper"+index).value.trim()=="")
		{
			alert("Please Enter Helper Number On Line "+index);
			document.getElementById("helper"+index).focus();
			return false;
		}

		else if(document.getElementById("iron_man"+index).value.trim()=="")
		{
			alert("Please Enter Helper Iron Man On Line "+index);
			document.getElementById("iron_man"+index).focus();
			return false;
		}
        
    }
		
		
}

