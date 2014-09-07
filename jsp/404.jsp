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

<!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        404 Error Page
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Examples</a></li>
                        <li class="active">404 error</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">

                    <div class="error-page">
                        <h2 class="headline text-info"> 404</h2>
                        <div class="error-content">
                            <h3><i class="fa fa-warning text-yellow"></i> Oops! Page not found.</h3>
                            <p>
                                
                            </p>

                        </div><!-- /.error-content -->
                    </div><!-- /.error-page -->

                </section><!-- /.content -->
            </aside><!-- /.right-side -->
</div>


<%@ include file="parts/footer.jsp" %>	
</body>
</html>
