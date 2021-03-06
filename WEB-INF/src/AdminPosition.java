import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.List;

import beans.*;
import dao.*;

public class AdminPosition extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{

    request.setAttribute("menuid", "position");   
    PositionDao positionDao = new PositionDao();

    String id = request.getParameter("pid");

    List<PositionBean> ls = positionDao.getAllPositions("50","0");

    request.setAttribute("positionList", ls);  
     
    if (id == null || id.length() == 0) {
         

        getServletConfig()
        .getServletContext()
        .getRequestDispatcher("/jsp/admin_position.jsp" )
        .forward( request, response );
    } else {
        PositionBean bean = positionDao.getDetail(id);

        request.setAttribute("position", bean);    

        getServletConfig()
        .getServletContext()
        .getRequestDispatcher("/jsp/admin_edit_position.jsp" )
        .forward( request, response );
    }

    

  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{

        request.setCharacterEncoding("UTF-8");
        request.setAttribute("menuid", "position");
        String action = request.getParameter("action");
        String id = request.getParameter("pid");
        String name = request.getParameter("pname");
        String desc = request.getParameter("pdesc");
        PositionBean bean = new PositionBean();
        PositionDao positionDao = new PositionDao();
  
        if (action.equals("add")) {
            bean.setName(name);
            bean.setDescription(desc);
            positionDao.addPosition(bean);
        } else if (action.equals("update")) {
            bean.setId(id);
            bean.setName(name);
            bean.setDescription(desc);
            positionDao.addPosition(bean);
        } else if (action.equals("del")) {
            positionDao.deletePosition(id);
        }
        
       response.sendRedirect("/wanwan/admin/position");

  }
}