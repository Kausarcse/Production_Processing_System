<?php
session_start();
require_once("../login/session.php");
include('../login/db_connection_class.php');
$obj = new DB_Connection_Class();
$obj->connection();



$user_id = $_SESSION['user_id'];
$password = $_SESSION['password'];
$user_name = $_SESSION['user_name'];

$layout_start_time= $_GET['layout_start_time'];
$start_time=explode("/",$layout_start_time);

$start_year=$start_time[0];
$start_month=$start_time[1];
$start_day_main=$start_time[2];
$start_day=$start_day_main[0].$start_day_main[1];
$start_hour=$start_day_main[3].$start_day_main[4];





$layout_end_time=$_GET['layout_end_time'];

$end_time=explode("/",$layout_end_time);

$end_year=$end_time[0];
$end_month=$end_time[1];
$end_day_main=$end_time[2];
$end_day=$end_day_main[0].$end_day_main[1];
$end_hour=$end_day_main[3].$end_day_main[4];

function monthName($month)
{
    if($month==1)
    {
        return 31;
    }
    else if($month==2)
    {
        return 28;
    }
    else if($month==3)
    {
        return 31;
    }
    else if($month==4)
    {
        return 30;
    }
    else if($month==5)
    {
        return 31;
    }
    else if($month==6)
    {
        return 30;
    }
    else if($month==7)
    {
        return 31;
    }
    else if($month==8)
    {
        return 31;
    }
    else if($month==9)
    {
        return 30;
    }
    else if($month==10)
    {
        return 31;
    }
    else if($month==11)
    {
        return 30;
    }
    else if($month==12)
    {
        return 31;
    }



}
$year=$end_year-$start_year;
$hour=0;
//for same year calculation

$total_time=0;
if($year==0)
{
     $month=$end_month-$start_month;
    if($month==0)
    {
        $day=$end_day-$start_day;
        if( $day==0)
        {
             $hour=$end_hour-$start_hour." Hour";
            $total_time=$hour;
        }
        else if($day>0)
        {
            //  $day_hour="Day".$day."-".($end_hour-$start_hour)."Hour";
             $day_hour=$day." Day ".($end_hour-$start_hour)." Hour";

            $total_time=$day_hour;

        }
    }
    else if($month>0)
    {
        $total_month=$end_month-$start_month;
     // echo "Total end Day :".$end_month_day=monthName($end_month)+$end_day;
        $start= monthName($start_month)-$start_day;
         $start_date_total=$start;
      for ($i=1; $i <$total_month ; $i++) { 
          $start_date_total=$start_date_total+monthName($start_month+$i);

      }
  
      $start_date_total=$start_date_total+$end_day;

      $hour=$end_hour-$start_hour;
   
      $total_time=$start_date_total." Day ".$hour." Hour";


    }
}
//if year is not match
else if($year>0)
{

}


        ?>        	

		<input type="text" class="form-control" id="time" value="<?php echo $total_time;?>"
         disabled>
		
        <input type="hidden" class="form-control" id="total_layout_time"  name="total_layout_time"
             value="<?php echo $total_time;?>">

        <?php

       // echo $param=$order_qty."".$plan_cut_qty;

    





$obj->disconnection();

?>














