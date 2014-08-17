import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.List;

import beans.*;
import dao.*;

public class AdminMeun extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{

    getServletConfig()
    .getServletContext()
    .getRequestDispatcher("/jsp/admin_meun.jsp" )
    .forward( request, response );

  }

  
}