package backendfacts;

import java.sql.*;
import java.util.ArrayList;

public class StrategyDAO {
    private Strategy extractStrategyFromResultSet(ResultSet rs) throws SQLException {
    Strategy sg = new Strategy();

    /* private string guideCatTitle;*/
    sg.setStratID(rs.getInt("stratID"));
    sg.setStratTitle(rs.getString("stratTitle"));
    sg.setGuideCategoryID(rs.getInt("guideCategoryID"));
    sg.setStratContent(rs.getString("stratContent"));



    return sg;
    }
    
    //query for the guide matching a given guideID. 
    public Strategy getStratID(int stratID) {
    Connection connection = ConnectionFactory.getConnection();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM strategies WHERE StratID=" + stratID);
            
            //If found, pull the record into a guide object.
            if(rs.next())
            {
                return extractStrategyFromResultSet(rs);
            }
        //if not, print stack trace and return null.
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
    return null;
    }
    
    public Strategy getStratTitle(String stratTitle) {
    Connection connection = ConnectionFactory.getConnection();
    try {
        PreparedStatement statement = connection.prepareStatement("SELECT * FROM strategies WHERE StratTitle = ?");
        statement.setString(1, stratTitle);
        ResultSet rs = statement.executeQuery();

        // If found, pull the record into a Strategy object
        if (rs.next()) {
            return extractStrategyFromResultSet(rs);
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    } finally {
        try {
            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    return null;
}
    
    public ArrayList<Strategy> getAllStrats() {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //query guide table for all records
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM strategies;");
            
            //create an arraylist to store all guide records
            ArrayList<Strategy> strats = new ArrayList<>();
            
            //pull each guide record into a guide object, and add that object to the arraylist
            while(rs.next())
            {
                Strategy sg = extractStrategyFromResultSet(rs);
                strats.add(sg);
            }
            
            //return the arraylist of all guide objects
            return strats;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return null;
    }
}
