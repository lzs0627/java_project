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

List<DepartmentBean> departmentList = (List<DepartmentBean>)request.getAttribute("departmentList");

%>
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="box box-danger">
            <div class="box-header">
                <h3 class="box-title"><i class="fa fa-edit"></i>部門追加</h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <form action="" method="post">
                        <input type="hidden" name="action" value="add"/>
                    <div class="col-xs-3">
                        <input type="text" class="form-control" placeholder="役職名" name="pname">
                    </div>
                    <div class="col-xs-6">
                        <input type="text" class="form-control" placeholder="備考" name="pdesc">
                    </div>
                    <div class="col-xs-3">
                        <button type="submit" class="btn btn-primary" id="btn-add">追加する</button>
                    </div>
                </form>
                </div>
            </div><!-- /.box-body -->
        </div>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">部門情報一覧<h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <th style="width: 10px">#</th>
                        <th>部門名</th>
                        <th>備考</th>
                        <th style="width: 40px">Action</th>
                    </tr>
<%for(DepartmentBean department:departmentList){%>
                    <tr>
                        <td><%=department.getId()%></td>
                        <td><%=department.getName()%></td>
                        <td>
                            <%=department.getDescription()%>
                        </td>
                        <td>
                            <a href="/wanwan/admin/department?pid=<%=department.getId()%>"><i class="fa fa-plus-square"></i> Edit</a>
                        </td>
                    </tr>
<% } %>                                        
                    </tbody>
                </table>
            </div><!-- /.box-body -->
        </div>

    </section><!-- /.content -->
</aside><!-- /.right-side -->
</div>


<%@ include file="parts/footer.jsp" %>	
</body>
</html>
