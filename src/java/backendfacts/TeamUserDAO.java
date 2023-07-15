
package backendfacts;
import java.sql.*;
import java.util.ArrayList;

public class TeamUserDAO {
   private TeamUser extractTeamUserFromResultset(ResultSet rs) throws SQLException {
   TeamUser tu = new TeamUser();
  
   
   tu.setTeamUserID(rs.getInt("teamUserID"));
   tu.setTeamID(rs.getInt("teamID"));
   tu.setUserID(rs.getInt("userID"));
     
    return tu;   
}

//query for the team matching a given teamID
    public TeamUser getTeamUser(int teamUserID) throws ClassNotFoundException   {
        Connection connection = ConnectionFactory.getConnection();
       try {
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM teamuser WHERE TeamUserID=" + teamUserID);
            
            //if found, pull the record into a team object.
            if(rs.next() )            
            {
             return extractTeamUserFromResultset(rs);
            } 
        //if not, print stack trace and return null
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null; 
    }
    
    public ArrayList<TeamUser> getAllTeamUsers() throws ClassNotFoundException {
        Connection connection = ConnectionFactory.getConnection();
        try {
//query user table for all records
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM teamuser;");

//create an arraylist to store all user records
            ArrayList<TeamUser> teamUsers = new ArrayList<>();

//pull each user record into a user object, and add that object to the arraylist
            while (rs.next()) {
                TeamUser teamUser = extractTeamUserFromResultset(rs);
                teamUsers.add(teamUser);
            }

//return the arraylist of all user objects (they're people, but out our code treats them like objects)
            return teamUsers;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return null;
    }
    
    public ArrayList<TeamUser> getAllTeamMembers(int teamID) throws ClassNotFoundException {
        Connection connection = ConnectionFactory.getConnection();
        try {
//query user table for all records
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM teamuser WHERE teamID=" + teamID + ";");

//create an arraylist to store all user records
            ArrayList<TeamUser> teamUsers = new ArrayList<>();

//pull each user record into a user object, and add that object to the arraylist
            while (rs.next()) {
                TeamUser teamUser = extractTeamUserFromResultset(rs);
                teamUsers.add(teamUser);
            }

//return the arraylist of all user objects (they're people, but out our code treats them like objects)
            return teamUsers;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return null;
    }
    
    public boolean insertTeamUser(TeamUser teamUser) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //prepare and execute statement to insert user record with attributes matching those of given user object
            PreparedStatement ps = connection.prepareStatement("INSERT INTO teamuser VALUES (NULL, ?, ?)");
            ps.setInt(1, teamUser.getTeamID());
            ps.setInt(2,teamUser.getUserID());
            int i = ps.executeUpdate();

          if(i == 1) {
            return true;
          }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return false;
    }
    
    
   public boolean updateTeamUser(TeamUser teamUser) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //prepare and execute statement to update user record that matches the given user object's ID, giving user record 
            //new attributes that match the given user object's attributes
            PreparedStatement ps = connection.prepareStatement("UPDATE teamuser SET teamID=?, UserID=? WHERE teamID=?");
            ps.setInt(1, teamUser.getTeamID());
            ps.setInt(2, teamUser.getUserID());
            ps.setInt(3, teamUser.getTeamUserID());
            int i = ps.executeUpdate();

          if(i == 1) {
        return true;
          }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return false;
    }
    
     
    public boolean deleteTeamUser(int teamUserID) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
    try {
        //create and execute an SQL query to delete the user record matching a given userID
        Statement stmt = connection.createStatement();
        int i = stmt.executeUpdate("DELETE FROM teamuser WHERE teamuserid=" + teamUserID);

      if(i == 1) {
    return true;
      }

    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return false;
}
}
