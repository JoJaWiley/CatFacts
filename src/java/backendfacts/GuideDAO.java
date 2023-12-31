package backendfacts;

import java.sql.*;
import java.util.ArrayList;

public class GuideDAO {
    private Guide extractGuideFromResultSet(ResultSet rs) throws SQLException {
    Guide guide = new Guide();

    /* private int guideID;
    private int gameID;
    private int infoID;
    private int stratID;
    private int userID;
    private int guideCatID;*/
    
    guide.setGuideID(rs.getInt("guideID"));
    guide.setGuideTitle(rs.getString("guideTitle"));
    guide.setGuideInfo(rs.getString("guideInfo"));
    guide.setGuidePage(rs.getString("guidePage"));
    guide.setGameID(rs.getInt("gameID"));
    guide.setInfoID(rs.getInt("infoID"));
    guide.setStratID(rs.getInt("stratID"));
    guide.setUserID(rs.getInt("userID"));
    guide.setGuideCatID(rs.getInt("guideCatID"));

    return guide;
    }
    
    //query for the guide matching a given guideID. 
    public Guide getGuide(int guideID) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM guides WHERE guideid=" + guideID);
            
            //If found, pull the record into a guide object.
            if(rs.next())
            {
                return extractGuideFromResultSet(rs);
            }
        //if not, print stack trace and return null.
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
    return null;
    }
    
    public ArrayList<Guide> getAllGuides() throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //query guide table for all records
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM guides;");
            
            //create an arraylist to store all guide records
            ArrayList<Guide> guides = new ArrayList<>();
            
            //pull each guide record into a guide object, and add that object to the arraylist
            while(rs.next())
            {
                Guide guide = extractGuideFromResultSet(rs);
                guides.add(guide);
            }
            
            //return the arraylist of all guide objects
            return guides;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return null;
    }
}
