import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.List;
import javax.servlet.*;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import beans.*;
import dao.*;


public class AdminUploadFaceImg extends HttpServlet {

    private static final long serialVersionUID = 1L;
    // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "img/faces";

    // upload settings
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB

  
  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{

        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        PrintWriter pw = response.getWriter();

        if (!ServletFileUpload.isMultipartContent(request)) {
            // if not, we stop here
            pw.println("{\"result\":\"err\"}");
            pw.flush();
            pw.close();
            return;
        }


        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // sets memory threshold - beyond which files are stored in disk
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // sets temporary location to store files
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
 
        ServletFileUpload upload = new ServletFileUpload(factory);
         
        // sets maximum size of upload file
        upload.setFileSizeMax(MAX_FILE_SIZE);
         
        // sets maximum size of request (include file + form data)
        upload.setSizeMax(MAX_REQUEST_SIZE);
 
        // constructs the directory path to store upload file
        // this path is relative to application's directory
        String uploadPath = getServletContext().getRealPath("")
                + File.separator + UPLOAD_DIRECTORY;
         
        // creates the directory if it does not exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String eid = request.getParameter("eid");
        EmployeDao employeDao = new EmployeDao();



        try {
            // parses the request's content to extract file data
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
 
            if (formItems != null && formItems.size() > 0) {
                // iterates over form's fields
                for (FileItem item : formItems) {
                    // processes only fields that are not form fields
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        String filePath = uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);

                        if (eid == null || eid.length() < 1) {
                            eid = employeDao.addFaceImg(null, fileName);
                        } else {
                            employeDao.addFaceImg(eid, fileName);
                        }
                        // saves the file on disk
                        item.write(storeFile);
                        pw.println("{\"result\":\"ok\",\"eid\":\""+eid+"\",\"file\":\""+fileName+"\"}");
                    }
                }
            }
        } catch (Exception ex) {
            pw.println("{\"result\":\"err\"}");
        }
        pw.flush();
        pw.close();
        
  }

}