<%@ page import="java.util.List,beans.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%

List<EmployeBean> employeList = (List<EmployeBean>)request.getAttribute("employeList");

%>

<html>
	<head>
		<title>input</title>
	</head>
	<body>
<%for(EmployeBean employe:employeList){%>
<%=employe.getJpName()%>
<%=employe.getEmail()%>
<% } %>
	</body>
</html>