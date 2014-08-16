import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.List;

import beans.*;
import dao.*;

public class HelloWorld extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{

    EmployeDao employeDao = new EmployeDao();
    List<EmployeBean> ls = employeDao.getAllEmaployes("50","0");

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    out.println("<html>");
    out.println("<head>");
    out.println("<title>Hello World!</title>");
    out.println("</head>");
    out.println("<body>");

    for(EmployeBean item:ls) {
        out.println(item.getJpName());
        out.println(item.getEmail());
    }

    
    
    out.println("</body>");
    out.println("</html>");
  }
}