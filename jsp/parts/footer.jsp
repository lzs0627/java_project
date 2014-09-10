<!-- jQuery 2.0.2 -->
<script src="../js/jquery-2.1.1.min.js"></script>
<!-- Bootstrap -->
<script src="../js/bootstrap.min.js" type="text/javascript"></script> 
<!-- date-range-picker -->
<script src="../js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
<!-- date-picker -->
<script src="../js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
<!-- bootstrap time picker -->
<script src="../js/plugins/timepicker/bootstrap-timepicker.min.js" type="text/javascript"></script>
<!-- fullCalendar -->
<script src="../js/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
<!-- AdminLTE App -->
<script src="../js/AdminLTE/app.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function(){

$(".timepicker").timepicker({
       showInputs: true,
       showMeridian:false
    });
    $(".datepicker").datepicker({
        format: 'yyyy/mm/dd'
    });

});
</script>