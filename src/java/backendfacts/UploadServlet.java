
package backendfacts;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/UploadServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB

public class UploadServlet extends HttpServlet {
    /**
     * Name of the directory where uploaded files will be saved, relative to
     * the web application directory.
     */
    private static final String SAVE_DIR = "uploadFiles";
     
    /**
     * handles file upload
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        
        User myuser = (User)request.getSession().getAttribute("myuser");
        // gets absolute path of the web application
        String appPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String savePath = appPath + File.separator + SAVE_DIR;
         
        // creates the save directory if it does not exists
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
         
        for (Part part : request.getParts()) {
            String fileName = extractFileName(myuser);
            // refines the fileName in case it is an absolute path
            fileName = new File(fileName).getName();
            part.write(savePath + File.separator + fileName);
        }
        String referer = request.getHeader("Referer");
        response.sendRedirect(referer);
        
        try {
            updateProfilePic(myuser);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UploadServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    /**
     * Extracts file name from user object
     */
    private String extractFileName(User user) {
        String fileName = user.getUserID() + ".jpg";
        return fileName;
    }
    
    private boolean updateProfilePic(User user) throws ClassNotFoundException {
        Connection connection = ConnectionFactory.getConnection();
        try {
            //prepare and execute statement to update user record that matches the given user object's ID, giving user record 
            //new attributes that match the given user object's attributes
            PreparedStatement ps = connection.prepareStatement("UPDATE profile SET profilepic=? WHERE userid=?");
            ps.setString(1, user.getUserID() + ".jpg");
            ps.setInt(2, user.getUserID());
            int i = ps.executeUpdate();

          if(i == 1) {
        return true;
          }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    return false;
    }
}