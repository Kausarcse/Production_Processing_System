

function production_detials_Form_Validation()
{
		if(document.getElementById("style_details_id").value=="select")
		{
			alert("Please Select style");
			document.getElementById("style_details_id").focus();
			return false;
		}
		else if(document.getElementById("order_details_id").value=="select")
		{
			alert("Please Enter Ship Date");
			document.getElementById("order_details_id").focus();
			return false;
		}

		else if(document.getElementById("daily_cutting_qty").value.trim()=="")
		{
			alert("Please Enter Cutting Quantity");
			document.getElementById("daily_cutting_qty").focus();
			return false;
		}

}

