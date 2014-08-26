import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.List;

import beans.*;
import dao.*;

public class AdminPosition extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{


    PositionDao positionDao = new PositionDao();


    List<PositionBean> ls = positionDao.getAllPositions("50","0");

    request.setAttribute("positionList", ls);    

    getServletConfig()
    .getServletContext()
    .getRequestDispatcher("/jsp/admin_position.jsp" )
    .forward( request, response );

  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{


        String action = request.getParameter("action");
        String id = request.getParameter("pid");
        String name = request.getParameter("pname");
        String desc = request.getParameter("pdesc");
        PositionBean bean = new PositionBean();
        PositionDao positionDao = new PositionDao();
        if (action == "add") {
            bean.setName(name);
            bean.setDescription(desc);
            positionDao.addPosition(bean);
        } else if (action == "update" ) {
            bean.setId(id);
            bean.setName(name);
            bean.setDescription(desc);
            positionDao.addPosition(bean);
        } else if (action == "del" && id !="" ) {
            positionDao.deletePosition(id);
        }
        
       response.sendRedirect("/wanwan/admin/position");

  }
}