

function save_order_details_Form_Validation()
{
		if(document.getElementById("order_details_id").value=="select")
		{
			alert("Please Select Order Detials/Style Details");
			document.getElementById("order_details_id").focus();
			return false;
		}
		else if(document.getElementById("po").value.trim()=="")
		{
			alert("Please Enter PO");
			document.getElementById("po").focus();
			return false;
		}

		else if(document.getElementById("color").value.trim()=="")
		{
			alert("Please Enter Color");
			document.getElementById("color").focus();
			return false;
		}
		else if(document.getElementById("order_quantity").value=="select")
		{
			alert("Please Enter Order Quantity");
			document.getElementById("order_quantity").focus();
			return false;
		}

		else if(document.getElementById("plan_cut_quantity").value.trim()=="")
		{
			alert("Please Enter Plan Cut Quantity");
			document.getElementById("plan_cut_quantity").focus();
			return false;
		}
		
		


		else if(document.getElementById("pcd").value.trim()=="")
		{
			alert("Please Enter Line PCD");
			document.getElementById("pcd").focus();
			return false;
		}

		else if(document.getElementById("ship_date").value.trim()=="")
		{
			alert("Please Enter Ship Date");
			document.getElementById("ship_date").focus();
			return false;
		}

		
}

