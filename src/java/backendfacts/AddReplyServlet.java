
package backendfacts;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AddReplyServlet", urlPatterns = {"/AddReplyServlet"})
public class AddReplyServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    //using post to get info from a form and put it into database
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try {
            
            //get the current date in sql format
            java.sql.Date date = new Date(Calendar.getInstance().getTimeInMillis());
            
            //get the post content from the reply form
            String content = request.getParameter("postText");
            
            //get the user object from the session attributes
            User myuser = (User)request.getSession().getAttribute("myuser");
            //get the threadID from the URL query on the way here
            int threadID = Integer.parseInt(request.getParameter("threadID"));
            
            //Netbeans was giving me errors when I tried redirecting to this link, so I did this
            String string = "thread.jsp" + "?threadID=" + threadID;
            
            //we're gonna access post in the database
            PostDAO pd = new PostDAO();
            
            //create a new post object, and fill it with info from session attributes, URL query, current date, and form parameter
            Post post = new Post();
            post.setThreadID(threadID);
            post.setUserID(myuser.getUserID());
            post.setTitle("blah");
            post.setCreated(date);
            post.setContent(content);
            
            //insert the newly created post object
            pd.insertPost(post);
            //see string comment above
            response.sendRedirect(string);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddReplyServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
