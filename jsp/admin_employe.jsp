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
        <a href="/wanwan/admin/employe?eid=" class="btn btn-primary btn-sm">社員追加</a>｜
        <a href="/wanwan/admin/department" class="btn btn-primary btn-sm">所属追加</a>｜
        <a href="/wanwan/admin/position" class="btn btn-primary btn-sm">役職追加</a>
    </section>

    <!-- Main content -->
    <section class="content">

<% if (employeList!=null) for(EmployeBean employebean:employeList){%>
    <div class="box" style="width:400px;float:left;overflow:auto;margin:5px;">
        <div class="box-header">
            <h3 class="box-title"><%=employebean.getJpName()%><small><%=employebean.getEnName()%></small><h3>
                
        </div><!-- /.box-header -->
        <div class="box-body">
            <table class="table table-bordered">
                <tbody>
                    <tr>
                        <td rowspan="5" style="width:150px;"><img src="/wanwan/img/faces/<%=employebean.getFaceImg()%>" width="150"/></td>
                        <td><label style="width:70px;">社員番号:</label><a href="/wanwan/admin/employe?eid=<%=employebean.getId()%>" alt="修正">E00<%=employebean.getId()%></a></td>                        
                    </tr>
                    <tr>
                        <td><label style="width:70px;">生年月日:</label><%=employebean.getBirthday()%></td>
                    </tr>
                    <tr>
                        <td><label style="width:70px;">メール:</label><%=employebean.getEmail()%></td>
                    </tr>
                    <tr>                        
                        <td><label style="width:70px;">入社日付:</label><%=employebean.getEnterDate()%></td>
                    </tr>
                    <tr> 
                        <td><label style="width:70px;">退社日付:</label><%=employebean.getLeaveDate()%></td>
                    </tr>
                    <tr>
                        <td colspan="2"><label style="width:40px;">住所:</label><%=employebean.getAddress()%></td>
                    </tr>
                    <tr>
                        <td><label style="width:40px;">所属:</label><%=employebean.getDepartmentName()%></td>
                        <td><label style="width:40px;">役職:</label><%=employebean.getPositionName()%></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
<% } %>

    </section><!-- /.content -->
</aside><!-- /.right-side -->
</div>


<%@ include file="parts/footer.jsp" %>	
</body>
</html>
