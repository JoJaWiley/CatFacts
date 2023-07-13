package backendfacts;

import java.sql.*;
import java.util.ArrayList;
import java.util.Objects;

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
    public Profile getProfile(int profileID) throws ClassNotFoundException {
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
    
    public Profile getProfileByUserID(int userID) throws ClassNotFoundException {
        Connection connection = ConnectionFactory.getConnection();
        
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM profile WHERE userid=" + userID + ";");

            if(rs.next())
            {
                return extractProfileFromResultSet(rs);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } //end try catch
    return null;
    } //end getProfileByUserID()
    
    public ArrayList<Profile> getAllProfiles() throws ClassNotFoundException {
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

    public boolean insertProfile(User user) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO profile VALUES (NULL, ?, ?, 'defaultprofilepic.jpg')");
            ps.setInt(1, user.getUserID());
            ps.setString(2, "Add a bio!");
            int i = ps.executeUpdate();

            if(i == 1) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } //end try catch

    return false;
    } //end insert profile
   
    
    public boolean updateProfile(Profile profile) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE profile SET bio=? WHERE profileid=?");
            ps.setString(1, profile.getBio());
            ps.setInt(2, profile.getProfileID());
            int i = ps.executeUpdate();

          if(i == 1) {
        return true;
          }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return false;
    }
    
    public boolean deleteProfile(int profileID) throws ClassNotFoundException {
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
    
    
    public static void main(String[] args) throws ClassNotFoundException {
        // TODO code application logic here
        ProfileDAO pd = new ProfileDAO();
        
        Profile myprofile = pd.getProfileByUserID(1);
        
        if (Objects.isNull(myprofile))
            System.out.println("AGH");
    }
    
} //end ProfileDAO
