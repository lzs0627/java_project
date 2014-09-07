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
EmployeBean employe = (EmployeBean)request.getAttribute("employe");
String action = (String)request.getAttribute("action");
List<DepartmentBean> departmentList = (List<DepartmentBean>)request.getAttribute("departments");
List<PositionBean> positionList = (List<PositionBean>)request.getAttribute("positions");



%>
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
<%if (action.equals("add")) {%>  
    <div class="box box-danger">
        <div class="box-header">
            <h3 class="box-title"><i class="fa fa-edit"></i>社員を追加</h3>
        </div>
    </div>
<%}else{%>
    <div class="box box-danger">
        <div class="box-header">
            <h3 class="box-title"><i class="fa fa-edit"></i>社員情報を修正</h3>
        </div>
    </div
<%}%>      
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="box box-primary">
                                <!-- form start -->
                                <form role="form" action="/wanwan/admin/employe" method="post">
                                    <input type="hidden" name="action" value="<%=action%>" />
                                    <input type="hidden" name="e_id" value="<%=employe.getId()%>" />
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="e_name">名前</label>
                                            <input type="text" class="form-control" id="e_name" name="e_name" value="<%=employe.getJpName()%>" placeholder="名前">
                                        </div>
                                        <div class="form-group">
                                            <label for="e_en_name">名前（読み方）</label>
                                            <input type="text" class="form-control" id="e_en_name" name="e_en_name" value="<%=employe.getEnName()%>" placeholder="名前（読み方）">
                                        </div>
                                        <div class="form-group">
                                            <label for="e_mail">メール</label>
                                            <input type="email" class="form-control" id="e_mail" name="e_email" value="<%=employe.getEmail()%>" placeholder="メール">
                                        </div>
                                        <div class="form-group">
                                            <label for="e_password">パスワード</label>
                                            <input type="password" class="form-control" id="e_password" name="e_password" value="<%=employe.getPassword()%>" placeholder="Password">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>所属</label>
                                            <select class="form-control" name="e_department">
                                                <%for(DepartmentBean department:departmentList){%>
                                                <option value="<%=department.getId()%>" <%=department.getId()==employe.getDepartmentId()?"selected":""%>><%=department.getName()%></option>
                                                <%}%>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label>職役</label>
                                            <select class="form-control" name="e_position">
                                                <%for(PositionBean position:positionList){%>
                                                <option value="<%=position.getId()%>" <%=position.getId()==employe.getPositionId()?"selected":""%>><%=position.getName()%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="e_address">住所</label>
                                            <input type="text" class="form-control" id="e_address" name="e_address" value="<%=employe.getAddress()%>" placeholder="住所">
                                        </div>
                                        <div class="form-group">
                                            <label for="e_enterdate">入社日</label>
                                            <input type="text" class="form-control" id="e_enterdate" name="e_enterdate" value="<%=employe.getEnterDate()%>"placeholder="入社日">
                                        </div>
                                        <div class="form-group">
                                            <label for="e_leavedate">退社日</label>
                                            <input type="text" class="form-control" id="e_leavedate" name="e_leavedate" value="<%=employe.getLeaveDate()%>" placeholder="退社日">
                                        </div>
                                    </div><!-- /.box-body -->

                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                            </div>

    </section><!-- /.content -->
</aside><!-- /.right-side -->
</div>


<%@ include file="parts/footer.jsp" %>	
</body>
</html>
