
package backendfacts;

import java.sql.*;
import java.util.ArrayList;

public class ThreadCategoryDAO {
    private ThreadCategory extractThreadCatFromResultSet(ResultSet rs) throws SQLException {
    ThreadCategory tc = new ThreadCategory();

    tc.setThreadCatID( rs.getInt("threadcatID") );
    tc.setTitle(rs.getString("title"));
    

    return tc;
    }

    //query for the post matching a given postID. 
    public ThreadCategory getThreadCat(int threadCatID) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM threadcat WHERE threadcatid=" + threadCatID);
            
            //If found, pull the record into a post object.
            if(rs.next())
            {
                return extractThreadCatFromResultSet(rs);
            }
        //if not, print stack trace and return null.
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
    return null;
    }
    
  
    public ArrayList<ThreadCategory> getAllThreadCats() throws ClassNotFoundException {
     Connection connection = ConnectionFactory.getConnection();
        try {
            //query post table for all records
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM threadcat;");
            
            //create an arraylist to store all post records
            ArrayList<ThreadCategory> tcs = new ArrayList<>();
            
            //pull each post record into a post object, and add that object to the arraylist
            while(rs.next())
            {
                ThreadCategory tc = extractThreadCatFromResultSet(rs);
                tcs.add(tc);
            }
            
            //return the arraylist of all post objects
            return tcs;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return null;
    }
    
    
    
    public boolean insertThreadCat(ThreadCategory threadCat) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //prepare and execute statement to insert post record with attributes matching those of given post object
            PreparedStatement ps = connection.prepareStatement("INSERT INTO threadcat VALUES (NULL, ?)");
            ps.setString(1, threadCat.getTitle());
            int i = ps.executeUpdate();

          if(i == 1) {
            return true;
          }
          connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return false;
    }
    
    
    public boolean updateThredCat(ThreadCategory tc) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //prepare and execute statement to update post record that matches the given post object's ID, giving post record 
            //new attributes that match the given post object's attributes
            PreparedStatement ps = connection.prepareStatement("UPDATE post SET title=? WHERE threadcatid=?");
            ps.setString(1, tc.getTitle());
            ps.setInt(2, tc.getThreadCatID());
            int i = ps.executeUpdate();

          if(i == 1) {
        return true;
          }
          connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return false;
    }
    
    public boolean deleteThreadCat(int threadcatID) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
    try {
        //create and execute an SQL query to delete the user record matching a given postID
        Statement stmt = connection.createStatement();
        int i = stmt.executeUpdate("DELETE FROM post WHERE threadcatid=" + threadcatID);

      if(i == 1) {
    return true;
      }
      
      connection.close();
    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return false;
}
}
