

function style_details_Form_Validation()
{
		if(document.getElementById("buyer_name").value=="select")
		{
			alert("Please Select Buyer Name");
			document.getElementById("buyer_name").focus();
			return false;
		}
		else if(document.getElementById("style_no").value.trim()=="")
		{
			alert("Please Select Style No");
			document.getElementById("style_no").focus();
			return false;
		}

		else if(document.getElementById("smv").value.trim()=="")
		{
			alert("Please Enter smv");
			document.getElementById("smv").focus();
			return false;
		}

		else if(document.getElementById("item_name").value.trim()=="")
		{
			alert("Please Enter Item Name");
			document.getElementById("item_name").focus();
			return false;
		}
	

}

