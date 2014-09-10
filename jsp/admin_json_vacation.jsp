<%@ page import="javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpSession,javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.util.List,beans.*" %>
<%@ page contentType="text/x-json:in;charset=utf-8" %>
<%
List<VacationBean> vacationlist = (List<VacationBean>)request.getAttribute("vacationlist");
%>
[
<% if (vacationlist!=null) {
	
	for (int i =0 ;i<vacationlist.size();i++) {
	VacationBean bean = (VacationBean) vacationlist.get(i);
%>
{
	"title":"<%=bean.getTitle()%>[<%=bean.getEmployeName()%>]",
	"start":"<%=bean.getStartAt()%>",
	"end":"<%=bean.getEndAt()%>"
}
<%if (i < vacationlist.size() - 1) {%>
,	
<%}}}%>
]