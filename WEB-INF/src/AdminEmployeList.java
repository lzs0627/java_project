import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.List;

import beans.*;
import dao.*;

public class AdminEmployeList extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{

    EmployeDao employeDao = new EmployeDao();
    List<EmployeBean> ls = employeDao.getAllEmaployes("50","0");

    request.setAttribute("employeList", ls);
    getServletConfig().getServletContext().getRequestDispatcher("/jsp/admin_employes.jsp" ).forward( request, response );

  }
}