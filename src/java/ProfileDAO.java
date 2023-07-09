import java.sql.*;
import java.util.ArrayList;

public class ProfileDAO {
    
    //piece together a profile object from the resultset of an SQL query of the profile table
    private Profile extractProfileFromResultSet(ResultSet rs) throws SQLException {
        Profile profile = new Profile();
        
        profile.setProfileID(rs.getInt("profileid"));
        profile.setUserID(rs.getInt("userid"));
        profile.setBio(rs.getString("bio"));
        profile.setProfilePic(rs.getString("profilepic"));
        
        return profile;
    }
    
    //query for the profile record matching a given profileID. return that profile if it exists. return null if not.
    public Profile getProfile(int profileID) {
        Connection connection = ConnectionFactory.getConnection();
        
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM profile WHERE profileid=" + profileID);

            if(rs.next())
            {
                return extractProfileFromResultSet(rs);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } //end try catch
    return null;
    } //end getProfile()
    
    public Profile getProfileByUserID(int userID) {
        Connection connection = ConnectionFactory.getConnection();
        
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM profile, user WHERE profile.userid = user.userID AND userid=" + userID);

            if(rs.next())
            {
                return extractProfileFromResultSet(rs);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } //end try catch
    return null;
    } //end getProfileByUserID()
    
    public ArrayList<Profile> getAllProfiles() {
    Connection connection = ConnectionFactory.getConnection();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM profile;");

            ArrayList<Profile> profiles = new ArrayList<>();

            while(rs.next())
            {
                Profile profile = extractProfileFromResultSet(rs);
                profiles.add(profile);
            }

            return profiles;

        } catch (SQLException ex) {
        ex.printStackTrace();
    } //end getAllProfiles()
        
    return null;
    }
    
    public boolean insertProfile(Profile profile) {
    Connection connection = ConnectionFactory.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO profile VALUES (NULL, ?, ?, ?)");
            ps.setInt(1, profile.getProfileID());
            ps.setString(2, profile.getBio());
            ps.setString(3, profile.getProfilePic());
            int i = ps.executeUpdate();

            if(i == 1) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } //end try catch

    return false;
    } //end insert profile
    
    public boolean updateProfile(Profile profile) {
    Connection connection = ConnectionFactory.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE profile SET bio=?, profilepic=? WHERE profileid=?");
            ps.setString(1, profile.getBio());
            ps.setString(2, profile.getProfilePic());
            ps.setInt(3, profile.getProfileID());
            int i = ps.executeUpdate();

          if(i == 1) {
        return true;
          }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return false;
    }
    
    public boolean deleteProfile(int profileID) {
    Connection connection = ConnectionFactory.getConnection();
    try {
        Statement stmt = connection.createStatement();
        int i = stmt.executeUpdate("DELETE FROM profile WHERE profileid=" + profileID);

      if(i == 1) {
    return true;
      }

    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return false;
}
    
    
    public static void main(String[] args) {
        // TODO code application logic here
    }
    
} //end ProfileDAO
