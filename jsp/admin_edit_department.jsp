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
DepartmentBean departmentbean = (DepartmentBean)request.getAttribute("department");

%>
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="box box-danger">
            <div class="box-header">
                
                <div class="col-xs-4">
                    <h3 class="box-title"><i class="fa fa-edit"></i>部門情報修正
                    
                    </h3>
                </div>
            </div>
            <div class="box-body">
                <div class="row">
                    <form action="" method="post">
                        <input type="hidden" name="action" value="update"/>
                        <input type="hidden" name="pid" value="<%=departmentbean.getId()%>"/>
                    <div class="col-xs-3">
                        <input type="text" class="form-control" placeholder="役職名" name="pname" value="<%=departmentbean.getName()%>">
                    </div>
                    <div class="col-xs-6">
                        <input type="text" class="form-control" placeholder="備考" name="pdesc" value="<%=departmentbean.getDescription()%>">
                    </div>
                    <div class="col-xs-3">
                        <button type="submit" class="btn btn-primary" id="btn-add">修正する</button>
                        <a href="/wanwan/admin/department"　 class="btn btn-primary" >キャンセルする</a>
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
                <h3 class="box-title">部門一覧<h3>
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
                            <form action="" method="post" style="float:right;margin-left:20px;" onsubmit="return confirm('削除してもOKですか？')">
                        <input type="hidden" name="action" value="del"/>
                        <input type="hidden" name="pid" value="<%=departmentbean.getId()%>"/>
                        <button type="submit" class="btn btn-primary  btn-sm" id="btn-add">削除する</button>
                    </form>
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
