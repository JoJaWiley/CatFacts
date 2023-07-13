package backendfacts;

import java.sql.*;
import java.util.ArrayList;

public class GuideCategoryDAO {
    private GuideCategory extractGuideCategoryFromResultSet(ResultSet rs) throws SQLException {
    GuideCategory gc = new GuideCategory();

    /* private string guideCatTitle;*/
    gc.setGuideCategoryID(rs.getInt("guideCategoryID"));
    gc.setGuideCategoryTitle(rs.getString("guideCategoryTitle"));



    return gc;
    }
    
    //query for the guide matching a given guideID. 
    public GuideCategory getGuideCategoryID(int guideCategoryID) {
    Connection connection = ConnectionFactory.getConnection();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM guidecategories WHERE guideCategoryID=" + guideCategoryID);
            
            //If found, pull the record into a guide object.
            if(rs.next())
            {
                return extractGuideCategoryFromResultSet(rs);
            }
        //if not, print stack trace and return null.
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
    return null;
    }
    
    public ArrayList<GuideCategory> getAllGuideCats() {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //query guide table for all records
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM guidecategories;");
            
            //create an arraylist to store all guide records
            ArrayList<GuideCategory> guideCats = new ArrayList<>();
            
            //pull each guide record into a guide object, and add that object to the arraylist
            while(rs.next())
            {
                GuideCategory guideCat = extractGuideCategoryFromResultSet(rs);
                guideCats.add(guideCat);
            }
            
            //return the arraylist of all guide objects
            return guideCats;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return null;
    }
}