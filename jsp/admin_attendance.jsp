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
        <div class="box box-danger">
            <div class="box-header">
                <h3 class="box-title"><i class="fa fa-edit"></i>出勤検索</h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <form action="/wanwan/admin/attendance" method="get" id="formselect">                       
                        <div class="col-xs-2">
                            <select name="did">
                                <option>所属部門</option>
    <% if (departmentlist!=null) for(DepartmentBean department:departmentlist){%>
                                <option value="<%=department.getId()%>" <%=did!=null&&did.equals(department.getId())?"selected":""%>><%=department.getName()%></option>
    <% } %>
                            </select>
                        </div>
                        <div class="col-xs-2">
                            <select name="eid">
                                <option value="">社員選択</option>
    <% if (employelist!=null) for(EmployeBean employe:employelist){%>
                                <option value="<%=employe.getId()%>" <%=eid!=null&&eid.equals(employe.getId())?"selected":""%>><%=employe.getJpName()%></option>
    <% } %>
                            </select>                        
                        </div>
                        <div class="col-xs-8">
                           &nbsp;
                        </div>
                    </form>                
                </div>
                
            </div><!-- /.box-body -->
        </div>
<%if(eid!=null && eid.length()>0) {%>        
        <div class="box box-danger">
            <div class="box-header">
                <h3 class="box-title"><i class="fa fa-edit"></i>出勤追加</h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <form action="/wanwan/admin/attendance" method="post">
                        <input type="hidden" name="action" value="add" />
                        <input type="hidden" name="eid" value="<%=eid%>" />
                        <input type="hidden" name="did" value="<%=did%>" />
                        <div class="col-xs-2">
                            <select name="date_at_ym">
                                <option value="<%=currentYear%>01"><%=currentYear%>年01月</option>
                                <option value="<%=currentYear%>02"><%=currentYear%>年02月</option>
                                <option value="<%=currentYear%>03"><%=currentYear%>年03月</option>
                                <option value="<%=currentYear%>04"><%=currentYear%>年04月</option>
                                <option value="<%=currentYear%>05"><%=currentYear%>年05月</option>
                                <option value="<%=currentYear%>06"><%=currentYear%>年06月</option>
                                <option value="<%=currentYear%>07"><%=currentYear%>年07月</option>
                                <option value="<%=currentYear%>08"><%=currentYear%>年08月</option>
                                <option value="<%=currentYear%>09"><%=currentYear%>年09月</option>
                                <option value="<%=currentYear%>10"><%=currentYear%>年10月</option>
                                <option value="<%=currentYear%>11"><%=currentYear%>年11月</option>
                                <option value="<%=currentYear%>12"><%=currentYear%>年12月</option>
                            </select>
                            <select name="date_at_d">
                                <option value="01">01日</option>
                                <option value="02">02日</option>
                                <option value="03">03日</option>
                                <option value="04">04日</option>
                                <option value="05">05日</option>
                                <option value="06">06日</option>
                                <option value="07">07日</option>
                                <option value="08">08日</option>
                                <option value="09">09日</option>
                                <option value="10">10日</option>
                                <option value="11">11日</option>
                                <option value="12">12日</option>
                                <option value="13">13日</option>
                                <option value="14">14日</option>
                                <option value="15">15日</option>
                                <option value="16">16日</option>
                                <option value="17">17日</option>
                                <option value="18">18日</option>
                                <option value="19">19日</option>
                                <option value="20">20日</option>
                                <option value="21">21日</option>
                                <option value="22">22日</option>
                                <option value="23">23日</option>
                                <option value="24">24日</option>
                                <option value="25">25日</option>
                                <option value="26">26日</option>
                                <option value="27">27日</option>
                                <option value="28">28日</option>
                                <option value="29">29日</option>
                                <option value="30">30日</option>
                                <option value="31">31日</option>
                            </select>
                        </div>
                        <div class="col-xs-2">
                            <input type="text" name="start_at" placeholder="出勤時間"/>
                        </div>
                        <div class="col-xs-2">
                            <input type="text" name="end_at" placeholder="退社時間"/>
                        </div>
                        <div class="col-xs-4">
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
        <div class="box">
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
                        <td><input name="date_at" value="<%=attendance.getDateAt()%>" /></td>
                        <td><input name="start_at" value="<%=attendance.getStartAt()%>" /></td>
                        <td><input name="end_at" value="<%=attendance.getEndAt()%>" /></td>
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
