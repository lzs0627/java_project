<%@ page import="javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpSession,javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.util.List,beans.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="parts/admin_authcheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<%@ include file="parts/admin_header.jsp" %>
<body class="skin-blue">
<%@ include file="parts/admin_body_header.jsp" %>

<div class="wrapper row-offcanvas row-offcanvas-left">
<%@ include file="parts/admin_menu.jsp" %>
<%

List<DepartmentBean> departmentlist = (List<DepartmentBean>)request.getAttribute("departmentlist");
List<EmployeBean> employelist = (List<EmployeBean>)request.getAttribute("employelist");
List<VacationBean> vacationlist = (List<VacationBean>)request.getAttribute("vacationlist");

String did = (String)request.getAttribute("did");
String eid = (String)request.getAttribute("eid");


%>
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="box box-danger" style="width:600px;">
            <div class="box-header">
                <h3 class="box-title"><i class="fa fa-edit"></i>休暇検索</h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <form action="/wanwan/admin/vacation" method="get" id="formselect">                       
                        <div class="col-xs-4">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    所属
                                </div>
                            <select name="did" class="form-control">
                                <option>所属</option>
    <% if (departmentlist!=null) for(DepartmentBean department:departmentlist){%>
                                <option value="<%=department.getId()%>" <%=did!=null&&did.equals(department.getId())?"selected":""%>><%=department.getName()%></option>
    <% } %>
                            </select>
                            </div>
                        </div>
                        <div class="col-xs-4">
                        <div class="input-group">
                            <div class="input-group-addon">
                                社員
                            </div>
                            <select name="eid" class="form-control">
                                <option>社員選択</option>
    <% if (employelist!=null) for(EmployeBean employe:employelist){%>
                            <option value="<%=employe.getId()%>" <%=eid!=null&&eid.equals(employe.getId())?"selected":""%>><%=employe.getJpName()%></option>
    <% } %>
                            </select>  
                        </div>                      
                        </div>
                        <div class="col-xs-8">
                           &nbsp;
                        </div>
                    </form>                
                </div>
                
            </div><!-- /.box-body -->
        </div>
    <%if(eid!=null && eid.length()>0) {%>        
        <div class="box box-danger" style="width:820px;">
            <div class="box-header">
                <h3 class="box-title"><i class="fa fa-edit"></i>休暇追加</h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <form action="/wanwan/admin/vacation" method="post">
                        <input type="hidden" name="action" value="add" />
                        <input type="hidden" name="eid" value="<%=eid%>" />
                        <input type="hidden" name="did" value="<%=did%>" />
                        <div class="col-xs-4">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    休暇理由
                                </div>
                                <input type="text" class="form-control pull-right" name="title" placeholder="休暇理由">
                            </div>
                        </div>
                        <div class="col-xs-3">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" class="form-control pull-right datepicker" name="start_at" placeholder="開始日付">
                            </div>
                        </div>
                        <div class="col-xs-3">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" class="form-control pull-right datepicker" name="end_at" placeholder="終了日付">
                            </div>
                        </div>
                        <div class="col-xs-2" style="text-align:center">
                            <button type="submit" class="btn btn-primary" id="btn-add">追加する</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%}%>
    </section>

    <!-- Main content -->
    <section class="content">
        
        <div class="box box-primary">
            <div class="box-body no-padding">
                <!-- THE CALENDAR -->
                <div id="calendar"></div>
            </div><!-- /.box-body -->
        </div><!-- /. box -->
    </section><!-- /.content -->
</aside><!-- /.right-side -->
</div>



<%@ include file="parts/footer.jsp" %>	

<script type="text/javascript">
$(document).ready(function(){
    $("#formselect select").change(function(){
        $("#formselect").submit();
    });

   

    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)
    var date = new Date();
    var d = date.getDate(),
            m = date.getMonth(),
            y = date.getFullYear();

    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        buttonText: {//This is to add icons to the visible buttons
            prev: "<span class='fa fa-caret-left'></span>",
            next: "<span class='fa fa-caret-right'></span>",
            today: '今日',
            month: '月',
            week: '週',
            day: '日'
        },                  
        editable: false,
        droppable: false,
        events: {
            url:'/wanwan/admin/vacation/search?eid=<%=eid==null?"":eid%>',
            type:'GET'
        }
    });

});    
</script>
</body>
</html>
