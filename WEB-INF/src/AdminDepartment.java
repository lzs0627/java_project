import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.List;

import beans.*;
import dao.*;

public class AdminDepartment extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{


    request.setAttribute("menuid", "department");

    DepartmentDao departmentDao = new DepartmentDao();

    String id = request.getParameter("pid");

    List<DepartmentBean> ls = departmentDao.getAllDepartments("50","0");

    request.setAttribute("departmentList", ls);  
     
    if (id == null || id.length() == 0) {
         

        getServletConfig()
        .getServletContext()
        .getRequestDispatcher("/jsp/admin_department.jsp" )
        .forward( request, response );
    } else {
        DepartmentBean bean = departmentDao.getDetail(id);

        request.setAttribute("department", bean);    

        getServletConfig()
        .getServletContext()
        .getRequestDispatcher("/jsp/admin_edit_department.jsp" )
        .forward( request, response );
    }

    

  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{

        request.setCharacterEncoding("UTF-8");
        request.setAttribute("menuid", "department");
        String action = request.getParameter("action");
        String id = request.getParameter("pid");
        String name = request.getParameter("pname");
        String desc = request.getParameter("pdesc");
        DepartmentBean bean = new DepartmentBean();
        DepartmentDao departmentDao = new DepartmentDao();
  
        if (action.equals("add")) {
            bean.setName(name);
            bean.setDescription(desc);
            departmentDao.addDepartment(bean);
        } else if (action.equals("update")) {
            bean.setId(id);
            bean.setName(name);
            bean.setDescription(desc);
            departmentDao.addDepartment(bean);
        } else if (action.equals("del")) {
            departmentDao.deleteDepartment(id);
        }
        
       response.sendRedirect("/wanwan/admin/department");

  }
}