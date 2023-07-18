
@WebServlet("/CreateTeamServlet")
public class CreateTeamServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String teamName = request.getParameter("teamName");
        int slots = Integer.parseInt(request.getParameter("slots"));

        Team team = new Team();
        team.setTeamName(teamName);
        team.setSlots(slots);

        TeamDAO teamDAO = new TeamDAO();
        try {
            teamDAO.insertTeam(team);
            response.sendRedirect("teams.jsp"); // Redirect to the teams page
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            // Handle the exception
        }
    }
}