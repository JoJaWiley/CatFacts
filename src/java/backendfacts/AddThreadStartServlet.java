
package backendfacts;

import java.io.IOException;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AddThreadStartServlet", urlPatterns = {"/AddThreadStartServlet"})
public class AddThreadStartServlet extends HttpServlet {

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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTimeInMillis());
            
            int threadCatID = Integer.parseInt(request.getParameter("threadCatID"));
            String title = request.getParameter("threadTitle");
            String content = request.getParameter("postText");
            
            User myuser = (User)request.getSession().getAttribute("myuser");
            
            String string = "sboard.jsp" + "?threadCatID=" + threadCatID;
            
            ThreadDAO td = new ThreadDAO();
            backendfacts.Thread thread = new backendfacts.Thread();
            
            thread.setCategoryID(threadCatID);
            thread.setCreated(date);
            thread.setTitle(title);
            
            td.insertThread(thread);
            
            int threadID = td.getMaxThreadID();
            
            PostDAO pd = new PostDAO();
            
            Post post = new Post();
            post.setThreadID(threadID);
            post.setUserID(myuser.getUserID());
            post.setTitle("blah");
            post.setCreated(date);
            post.setContent(content);
            
            pd.insertPost(post);
            
            response.sendRedirect(string);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
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
