
package backendfacts;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jojaw
 */
@WebServlet(name = "TeamApply", urlPatterns = {"/TeamApply"})
public class TeamApply extends HttpServlet {

    /**
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int teamID = Integer.parseInt(request.getParameter("teamID"));
            User myuser = (User)request.getSession().getAttribute("myuser");
            int myUserID = myuser.getUserID();
            
            TeamDAO td = new TeamDAO();
            Team team = td.getTeam(teamID);
            
            TeamUserDAO tud = new TeamUserDAO();
            ArrayList<TeamUser> teamMembers = tud.getAllTeamMembers(teamID);
            int slots = team.getSlots();
            int openSlots = slots - teamMembers.size();
            
            TeamUser teamUser = new TeamUser();
            teamUser.setTeamID(teamID);
            teamUser.setUserID(myUserID);
            
            if (openSlots > 0 && !teamMembers.contains(teamUser))
                tud.insertTeamUser(teamUser);
            
            String referer = request.getHeader("Referer");
            response.sendRedirect(referer);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TeamApply.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
