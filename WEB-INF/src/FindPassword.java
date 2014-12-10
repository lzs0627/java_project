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

            
            // Sender's email ID needs to be mentioned
            String from = "system@system.com";

            // Assuming you are sending email from localhost
            String host = "localhost";

            // Get system properties object
            Properties properties = System.getProperties();

            // Setup mail server
            properties.setProperty("mail.smtp.host", host);

            // Get the default Session object.
            Session mailSession = Session.getDefaultInstance(properties);

            try{
              // Create a default MimeMessage object.
              MimeMessage message = new MimeMessage(mailSession);
              // Set From: header field of the header.
              message.setFrom(new InternetAddress(from));
              // Set To: header field of the header.
              message.addRecipient(Message.RecipientType.TO,
                                       new InternetAddress(to));
              // Set Subject: header field
              message.setSubject("Password Recovery!");
             
              // Send the actual HTML message, as big as you like
              message.setContent("<h1>password:"+password+"</h1>",
                                    "text/html" );
              // Send message
              Transport.send(message);
              result = "パスワードを" + to + "に送信しました。";
            }catch (MessagingException mex) {
              mex.printStackTrace();
              result = "Error: unable to send message....";
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