import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.List;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;


import beans.*;
import dao.*;

public class FindPassword extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{

    getServletConfig()
        .getServletContext()
        .getRequestDispatcher("/jsp/find_password.jsp" )
        .forward(request, response);
    

  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{

        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");

        AdminDao adminDao = new AdminDao();

        String password = adminDao.find_password(username);
        String to = adminDao.find_email(username);
        String result;
        if (password!=null && to!=null) {
          try{
              Properties property = new Properties();

              property.put("mail.smtp.host","news56.sakura.ne.jp");

              //GmailのSMTPを使う場合
              property.put("mail.smtp.auth", "true");
              property.put("mail.smtp.starttls.enable", "true");
              property.put("mail.smtp.host", "news56.sakura.ne.jp");
              property.put("mail.smtp.port", "587");
              property.put("mail.smtp.debug", "true");
              property.put("mail.smtp.timeout", 10000);
              Session session = Session.getInstance(property, new javax.mail.Authenticator(){
                  protected PasswordAuthentication getPasswordAuthentication(){
                      return new PasswordAuthentication("agri_tester@news56.sakura.ne.jp", "agri@1234");
                  }
              });

              /*
              //一般的なSMTPを使う場合

              //ポートが25の場合は省略可能
              property.put("mail.smtp.port", 25);

              Session session = 
                      Session.getDefaultInstance(property, null);
              */

              MimeMessage mimeMessage = new MimeMessage(session);

              InternetAddress toAddress = 
                      new InternetAddress(to, username);

              mimeMessage.setRecipient(Message.RecipientType.TO, toAddress);

              InternetAddress fromAddress = 
                      new InternetAddress("agri_tester@news56.sakura.ne.jp","パスワード探す");

              mimeMessage.setFrom(fromAddress);

              mimeMessage.setSubject("パスワード探す", "UTF-8");

              mimeMessage.setText("password:" + password, "UTF-8");

              Transport.send(mimeMessage);

              result = "パスワードを" + to + "に送信しました。";
            }catch (Exception e) {
              result = "Error: unable to send message...." + e;
            }
        } else {
            result = "Error: ＩＤが見つけません";
        }

        
        request.setAttribute("msg", result);  

        getServletConfig()
        .getServletContext()
        .getRequestDispatcher("/jsp/find_password.jsp" )
        .forward( request, response );
  }
}