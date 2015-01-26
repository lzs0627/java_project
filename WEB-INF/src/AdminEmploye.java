import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.List;


import beans.*;
import dao.*;

public class AdminEmploye extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{

    request.setAttribute("menuid", "employe");
    String action = request.getParameter("action");
   
    String id = request.getParameter("eid");
    
    EmployeDao employeDao = new EmployeDao();

    if (id == null) {

        List<EmployeBean> ls = employeDao.getAllEmployes("550","0");
        request.setAttribute("employeList", ls);  

        getServletConfig()
        .getServletContext()
        .getRequestDispatcher("/jsp/admin_employe.jsp" )
        .forward( request, response );

    } else {

        if (id.length() == 0) {
            request.setAttribute("action", "add");
            EmployeBean bean = new  EmployeBean();
            request.setAttribute("employe", bean);
        } else {
            request.setAttribute("action", "update");
            EmployeBean bean = employeDao.getDetail(id);
            if (bean == null) {
                getServletConfig()
                    .getServletContext()
                    .getRequestDispatcher("/jsp/404.jsp" )
                    .forward( request, response );
                    return ;
            }
            request.setAttribute("employe", bean);
        }

        PositionDao positionDao = new PositionDao();
        DepartmentDao departmentDao = new DepartmentDao();
        List<PositionBean> positions = positionDao.getAllPositions("50","0");
        List<DepartmentBean> departments = departmentDao.getAllDepartments("50","0");

        request.setAttribute("positions", positions);
        request.setAttribute("departments", departments);


        getServletConfig()
        .getServletContext()
        .getRequestDispatcher("/jsp/admin_edit_employe.jsp" )
        .forward( request, response );

    }


  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{

        request.setCharacterEncoding("UTF-8");
        request.setAttribute("menuid", "employe");

        String action = request.getParameter("action");
        EmployeBean bean = new EmployeBean();
        EmployeDao employeDao = new EmployeDao();
        String id = request.getParameter("e_id");

        if (action.equals("del")) {
           employeDao.deleteEmploye(id);

        } else {


            bean.setId(request.getParameter("e_id"));
            bean.setJpName(request.getParameter("e_name"));
            bean.setEnName(request.getParameter("e_en_name"));
            bean.setPassword(request.getParameter("e_password"));
            bean.setDepartmentId(request.getParameter("e_department"));
            bean.setPositionId(request.getParameter("e_position"));
            bean.setEmail(request.getParameter("e_email"));
            bean.setAddress(request.getParameter("e_address"));
            bean.setEnterDate(request.getParameter("e_enterdate"));
            bean.setLeaveDate(request.getParameter("e_leavedate"));
            bean.setBirthday(request.getParameter("e_birthday"));
            employeDao.addEmploye(bean);
        }
        
       response.sendRedirect("/wanwan/admin/employe");
        

  }
}