<%@ page contentType="text/html; charset=UTF-8" %>
<%
String menuid = (String)request.getAttribute("menuid");

if (menuid == null) {
    menuid = "none";
} 

%>
<!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left info">
                            <p>Hello, <%=admin%></p>
                        </div>
                    </div>

                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="<%=menuid.equals("employe")?"active":""%>">
                            <a href="/wanwan/admin/employe">
                                <i class="fa fa-dashboard"></i> <span>社員情報管理</span>
                            </a>
                        </li>
                        <li class="<%=menuid.equals("attendance")?"active":""%>">
                            <a href="/wanwan/admin/attendance">
                                <i class="fa fa-dashboard"></i> <span>出勤管理</span>
                            </a>
                        </li>
                        <li class="<%=menuid.equals("vacation")?"active":""%>">
                            <a href="/wanwan/admin/vacation">
                                <i class="fa fa-dashboard"></i> <span>休暇管理</span>
                            </a>
                        </li>
                        <li class="treeview active">
                            <a href="#">
                                <i class="fa fa-folder"></i> <span>システム設定</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li class="<%=menuid.equals("department")?"active":""%>"><a href="/wanwan/admin/department"><i class="fa fa-angle-double-right"></i> 部門管理</a></li>
                                <li class="<%=menuid.equals("position")?"active":""%>"><a href="/wanwan/admin/position"><i class="fa fa-angle-double-right"></i> 役職管理</a></li>
                            </ul>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>