
package backendfacts;

import java.sql.*;
import java.util.ArrayList;
 
public class TeamDAO { 
    private Team extractTeamFromResultset(ResultSet rs) throws SQLException {
   Team team = new Team ();
  
   team.setTeamID(rs.getInt("teamID"));
   team.setTeamName(rs.getString("teamName"));
   team.setUserID(rs.getInt("userID"));
   team.setRequirements(rs.getString("requirements"));
   team.setSlots(rs.getInt("slots"));
   
    return team;   
}

//query for the team matching a given teamID
    public Team getTeam(int teamID) throws ClassNotFoundException   {
        Connection connection = ConnectionFactory.getConnection();
       try {
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM team WHERE TeamID=" + teamID);
            
            //if found, pull the record into a team object.
            if(rs.next() )            
            {
             return extractTeamFromResultset(rs);
            } 
        //if not, print stack trace and return null
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null; 
    }
    public ArrayList<Team> getAllTeam() throws ClassNotFoundException{
Connection connection = ConnectionFactory.getConnection();
try {
//query user table for all records
Statement stmt = connection.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM team;");

//create an arraylist to store all user records
ArrayList<Team> teams = new ArrayList<>();

//pull each user record into a user object, and add that object to the arraylist
while(rs.next())
{
Team team = extractTeamFromResultset(rs);
teams.add(team);
}

//return the arraylist of all user objects (they're people, but out our code treats them like objects)
return teams;

} catch (SQLException ex) {
ex.printStackTrace ();
}

return null;
}
    
    public boolean insertTeam(Team team) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //prepare and execute statement to insert user record with attributes matching those of given user object
            PreparedStatement ps = connection.prepareStatement("INSERT INTO team VALUES (NULL, ?, ?, ?)");
            ps.setString(1, team.getTeamName());
            ps.setInt(2, team.getUserID());
            ps.setString(3, team.getRequirements());
            ps.setInt(4,team.getSlots());
            int i = ps.executeUpdate();

          if(i == 1) {
            return true;
          }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return false;
    }
    
    
   public boolean updateTeam(Team team) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //prepare and execute statement to update user record that matches the given user object's ID, giving user record 
            //new attributes that match the given user object's attributes
            PreparedStatement ps = connection.prepareStatement("UPDATE team SET Teamname=?, UserID=?, Requirements=?, Slots=? WHERE teamID=?");
            ps.setString(1, team.getTeamName());
            ps.setInt(2, team.getUserID());
            ps.setString(3, team.getRequirements());
            ps.setInt(4, team.getSlots());
            ps.setInt(5, team.getTeamID());
            int i = ps.executeUpdate();

          if(i == 1) {
        return true;
          }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return false;
    }
    
     
    public boolean deleteTeam(int teamID) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
    try {
        //create and execute an SQL query to delete the user record matching a given userID
        Statement stmt = connection.createStatement();
        int i = stmt.executeUpdate("DELETE FROM team WHERE teamid=" + teamID);

      if(i == 1) {
    return true;
      }

    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return false;
}
    
}



    