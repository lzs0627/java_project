<%@ page import="javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpSession,javax.servlet.http.HttpServletResponse" %>
<%
           HttpSession sn = request.getSession();
           
           Object employe = sn.getAttribute("employe");
           //session.setAttribute("admin","admin");
           if (employe == null) {
               response.sendRedirect("/employe_login.jsp");
           }
%>