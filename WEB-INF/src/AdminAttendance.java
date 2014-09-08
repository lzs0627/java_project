import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.List;
import java.util.Calendar;
import java.util.Date;

import beans.*;
import dao.*;

public class AdminAttendance extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{


    request.setAttribute("menuid", "attendance");

    DepartmentDao departmentDao = new DepartmentDao();
    List<DepartmentBean> departmentlist = departmentDao.getAllDepartments("50","0");

    String did = request.getParameter("did");
    String eid = request.getParameter("eid");
    String date = request.getParameter("date");

    EmployeDao employeDao = new EmployeDao();
    AttendanceDao attendanceDao = new AttendanceDao();

    List<EmployeBean> employelist = null;
    List<AttendanceBean> attendancelist = null;

    if (did != null && did.length() > 0) {
        employelist = employeDao.getEmployesByDid(did,"50","0");
    }

    if (eid != null && eid.length() > 0) {
        attendancelist = attendanceDao.getListById(eid,date);
    }
    Calendar cal = Calendar.getInstance();
    request.setAttribute("departmentlist", departmentlist);
    request.setAttribute("employelist", employelist);
    request.setAttribute("attendancelist", attendancelist);
    request.setAttribute("did", did);
    request.setAttribute("eid", eid);
    request.setAttribute("currentYear", cal.get(Calendar.YEAR));
        

    getServletConfig()
        .getServletContext()
        .getRequestDispatcher("/jsp/admin_attendance.jsp" )
        .forward(request, response);
    

  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{

        request.setCharacterEncoding("UTF-8");
        request.setAttribute("menuid", "attendance");
        String action = request.getParameter("action");
        String aid = request.getParameter("aid");
        String did = request.getParameter("did");
        String eid = request.getParameter("eid");
        String date_at_ym = request.getParameter("date_at_ym");
        String date_at_d = request.getParameter("date_at_d");
        String date_at = request.getParameter("date_at");
        String start_at = request.getParameter("start_at");
        String end_at = request.getParameter("end_at");

        AttendanceDao attendanceDao = new AttendanceDao();
        AttendanceBean attendanceBean = new AttendanceBean();


        if (action.equals("add")) {

            attendanceBean.setEmployeId(eid);
            attendanceBean.setDateAt(date_at_ym+date_at_d);
            attendanceBean.setStartAt(start_at);
            attendanceBean.setEndAt(end_at);
            attendanceDao.add(attendanceBean);

        } else if (action.equals("update")) {

            attendanceBean.setId(aid);
            attendanceBean.setEmployeId(eid);
            attendanceBean.setDateAt(date_at);
            attendanceBean.setStartAt(start_at);
            attendanceBean.setEndAt(end_at);
            attendanceDao.add(attendanceBean);
            
        } else if (action.equals("del")) {
            attendanceDao.delete(aid);
        }
        
       response.sendRedirect("/wanwan/admin/attendance?eid="+eid + "&did="+did);

  }
}