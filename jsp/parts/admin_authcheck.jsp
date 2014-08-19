<%
           HttpSession sn = request.getSession();
           
           String admin = (String)sn.getAttribute("admin");
           //session.setAttribute("admin","admin");
           if (admin == null) {
               response.sendRedirect("/wanwan/admin/login");
           }
%>