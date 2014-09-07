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

List<EmployeBean> employeList = (List<EmployeBean>)request.getAttribute("employeList");

%>
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
  <a href="/wanwan/admin/employe?eid=" class="btn btn-primary btn-sm">社員追加</a>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">社員一覧<h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <th style="width: 10px">#</th>
                        <th>名前</th>
                        <th>読み方</th>
                        <th>メール</th>
                        <th>所属</th>
                        <th>役職</th>
                        <th>住所</th>
                        <th>入社日</th>
                        <th>退社日</th>
                        <th style="width: 40px">Action</th>
                    </tr>
<% if (employeList!=null) for(EmployeBean employebean:employeList){%>
                    <tr>
                        <td><%=employebean.getId()%></td>
                        <td><%=employebean.getJpName()%></td>
                        <td><%=employebean.getEnName()%></td>
                        <td><%=employebean.getEmail()%></td>
                        <td><%=employebean.getDepartmentName()%></td>
                        <td><%=employebean.getPositionName()%></td>
                        <td><%=employebean.getAddress()%></td>
                        <td><%=employebean.getEnterDate()%></td>
                        <td><%=employebean.getLeaveDate()%></td>
                        <td>
                            <a href="/wanwan/admin/employe?eid=<%=employebean.getId()%>"><i class="fa fa-plus-square"></i> Edit</a>
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
