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
List<AttendanceBean> attendancelist = (List<AttendanceBean>)request.getAttribute("attendancelist");

String did = (String)request.getAttribute("did");
String eid = (String)request.getAttribute("eid");
Integer currentYear = (Integer) request.getAttribute("currentYear");

%>
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="box box-danger" style="width:800px;">
            <div class="box-header">
                <h3 class="box-title"><i class="fa fa-edit"></i>出勤検索</h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <form action="/wanwan/admin/attendance" method="get" id="formselect">                       
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
                                <option value="">社員選択</option>
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
        <div class="box box-danger" style="width:800px;">
            <div class="box-header">
                <h3 class="box-title"><i class="fa fa-edit"></i>出勤追加</h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <form action="/wanwan/admin/attendance" method="post">
                        <input type="hidden" name="action" value="add" />
                        <input type="hidden" name="eid" value="<%=eid%>" />
                        <input type="hidden" name="did" value="<%=did%>" />
                        <div class="col-xs-3">
                             <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" class="form-control pull-right datepicker" name="date_at" placeholder="出勤日付">
                            </div>
                        </div>
                        <div class="col-xs-3">
                            <div class="input-group bootstrap-timepicker">
                                <div class="input-group-addon">
                                    <i class="fa fa-clock-o"></i>
                                </div>
                                <input type="text" class="form-control pull-right timepicker" name="start_at" placeholder="出勤時間">
                            </div>
                        </div>
                        <div class="col-xs-3">
                            <div class="input-group bootstrap-timepicker">
                                <div class="input-group-addon">
                                    <i class="fa fa-clock-o"></i>
                                </div>
                                <input type="text" class="form-control pull-right timepicker" name="end_at" placeholder="退社時間">
                            </div>
                        </div>
                        <div class="col-xs-3" style="text-align:center">
                            <button type="submit" class="btn btn-primary" id="btn-add">出勤</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%}%>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="box" style="width:800px;">
            <div class="box-header">
                <h3 class="box-title">出勤一覧<h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <th style="width: 10px">#</th>
                        <th>出勤日</th>
                        <th>出勤時間</th>
                        <th>退社時間</th>
                        <th style="width: 140px">Action</th>
                    </tr>
<%if (attendancelist!=null) for(AttendanceBean attendance:attendancelist){%>

                    <tr id="attendance<%=attendance.getId()%>">
                        <td><input type="hidden" name="aid" value="<%=attendance.getId()%>" /><%=attendance.getId()%></td>
                        
                        <td>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" class="form-control pull-right datepicker" name="date_at" value="<%=attendance.getDateAt()%>" />
                            </div>
                        </td>
                        <td>
                            <div class="input-group bootstrap-timepicker">
                                <div class="input-group-addon">
                                    <i class="fa fa-clock-o"></i>
                                </div>
                                <input type="text" class="form-control pull-right timepicker" name="start_at" value="<%=attendance.getStartAt()%>" />
                            </div>
                        </td>
                        <td>
                            <div class="input-group bootstrap-timepicker">
                                <div class="input-group-addon">
                                    <i class="fa fa-clock-o"></i>
                                </div>
                                <input type="text" class="form-control pull-right timepicker" name="end_at" value="<%=attendance.getEndAt()%>" />
                            </div>
                        </td>
                        <td>
                            <a href="javascript:void()" class="btn btn-small btn-primary a-edit" data-aid="<%=attendance.getId()%>" >修正</a>
                            <a href="javascript:void()" class="btn btn-small btn-primary a-del" data-aid="<%=attendance.getId()%>" >削除</a>
                        </td>
                    </tr>  

<%}%>
                                        
                    </tbody>
                </table>
                <form action="/wanwan/admin/attendance" method="post" id="a-target" style="display:none;">
                    <input type="hidden" name="action" value="update" />
                    <input type="hidden" name="eid" value="<%=eid%>" />
                    <input type="hidden" name="did" value="<%=did%>" />
                    <div >
                       
                    </div>

                </form>
            </div><!-- /.box-body -->
        </div>

    </section><!-- /.content -->
</aside><!-- /.right-side -->
</div>



<%@ include file="parts/footer.jsp" %>	

<script type="text/javascript">
$(document).ready(function(){
    $("#formselect select").change(function(){
        $("#formselect").submit();
    });

    $(".a-edit").click(function(){
        var id = $(this).attr("data-aid");
        $("#a-target div").empty();

        $("#attendance"+id + " input").each(function(){
            $("#a-target div").append('<input name="'+$(this).attr("name")+'" value="'+$(this).val()+'">');
        });

        $("#a-target input[name=action]").val("update");
        $("#a-target").submit();

    });
    $(".a-del").click(function(){
        var id = $(this).attr("data-aid");
        $("#a-target input[name=action]").val("del");
        $("#a-target div").empty();
        $("#a-target div").append('<input name="aid" value="'+id+'">');
        $("#a-target").submit();
    });

    
});    
</script>
</body>
</html>
