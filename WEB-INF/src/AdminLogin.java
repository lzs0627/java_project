import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.List;

import beans.*;
import dao.*;

public class AdminLogin extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{

    getServletConfig()
    .getServletContext()
    .getRequestDispatcher("/jsp/admin_login.jsp" )
    .forward( request, response );

  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{

    String name = request.getParameter("username");
    String password = request.getParameter("password");
    
    AdminDao adminDao = new AdminDao();

    if (adminDao.is_admin(name, password)) {
    	HttpSession sn = request.getSession();
        sn.setAttribute("admin", name);
        response.sendRedirect("/wanwan/admin/");
    } else {

    	request.setAttribute("error", "ユーザー名かパスワードが間違っています");

    	getServletConfig()
		    .getServletContext()
		    .getRequestDispatcher("/jsp/admin_login.jsp" )
		    .forward( request, response );

    }

  }
}