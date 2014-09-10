import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.List;
import java.util.Calendar;
import java.util.Date;

import beans.*;
import dao.*;

public class AdminVacation extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{

    request.setAttribute("menuid", "vacation");

    DepartmentDao departmentDao = new DepartmentDao();
    List<DepartmentBean> departmentlist = departmentDao.getAllDepartments("50","0");

    String did = request.getParameter("did");
    String eid = request.getParameter("eid");
    String start = request.getParameter("start");
    String end = request.getParameter("end");


    EmployeDao employeDao = new EmployeDao();
    VacationDao vacationDao = new VacationDao();

    List<EmployeBean> employelist = null;
    List<VacationBean> vacationlist = null;

    if (did != null && did.length() > 0) {
        employelist = employeDao.getEmployesByDid(did,"50","0");
    }

    if (eid != null && eid.length() > 0) {
        vacationlist = vacationDao.getListById(eid,start,end);
    }

    request.setAttribute("departmentlist", departmentlist);
    request.setAttribute("employelist", employelist);
    request.setAttribute("vacationlist", vacationlist);
    request.setAttribute("did", did);
    request.setAttribute("eid", eid);
        

    getServletConfig()
        .getServletContext()
        .getRequestDispatcher("/jsp/admin_vacation.jsp" )
        .forward(request, response);
    

  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        String aid = request.getParameter("aid");
        String did = request.getParameter("did");
        String eid = request.getParameter("eid");
       
        String days = request.getParameter("days");
        String start_at = request.getParameter("start_at");
        String end_at = request.getParameter("end_at");
        String title = request.getParameter("title");

        VacationDao vacationDao = new VacationDao();
        VacationBean vacationBean = new VacationBean();


        if (action.equals("add")) {

            vacationBean.setEmployeId(eid);
            vacationBean.setDays(days);
            vacationBean.setStartAt(start_at);
            vacationBean.setEndAt(end_at);
            vacationBean.setTitle(title);
            vacationDao.add(vacationBean);

        } else if (action.equals("update")) {

            vacationBean.setId(aid);
            vacationBean.setEmployeId(eid);
            vacationBean.setDays(days);
            vacationBean.setStartAt(start_at);
            vacationBean.setEndAt(end_at);
            vacationBean.setTitle(title);
            vacationDao.add(vacationBean);
            
        } else if (action.equals("del")) {
            vacationDao.delete(aid);
        }
        
       response.sendRedirect("/wanwan/admin/vacation?eid="+eid + "&did="+did +"&start_at="+start_at+"&end_at="+end_at);

  }
}