import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.text.*;
import beans.*;
import dao.*;

public class AdminVacationSearch extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{

    request.setCharacterEncoding("utf-8");
    response.setContentType("application/json");
    String eid = request.getParameter("eid");
    long start = Long.parseLong(request.getParameter("start"));
    long end = Long.parseLong(request.getParameter("end"));

    Date date_start= new Date(start * 1000);
    Date date_end= new Date(end * 1000);
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");


    VacationDao vacationDao = new VacationDao();
    List<VacationBean> vacationlist = null;

    if (eid == null || eid.length() == 0) {
        vacationlist = vacationDao.getListByDate(dateFormat.format(date_start),dateFormat.format(date_end));
    } else {
        vacationlist = vacationDao.getListById(eid,dateFormat.format(date_start),dateFormat.format(date_end));        
    }
        
    request.setAttribute("vacationlist", vacationlist);

    getServletConfig()
        .getServletContext()
        .getRequestDispatcher("/jsp/admin_json_vacation.jsp" )
        .forward(request, response);
    
  }


}