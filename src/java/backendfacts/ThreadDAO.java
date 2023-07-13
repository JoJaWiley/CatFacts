package backendfacts;

import java.sql.*;
import java.util.*;

public class ThreadDAO {
    
//piece together a thread object from the resultset of an SQL query of the profile table
    private Thread extractThreadFromResultSet(ResultSet rs) throws SQLException {
        Thread thread = new Thread();
        
        thread.setThreadID(rs.getInt("threadid"));
        thread.setCategoryID(rs.getInt("categoryid"));
        thread.setCreated(rs.getDate("created"));
        thread.setTitle(rs.getString("title"));
        
        return thread;
    }
    
    //query for the thread matching a given threadID. 
    public Thread getThread(int threadID) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM thread WHERE threadid=" + threadID);
            
            //If found, pull the record into a thread object.
            if(rs.next())
            {
                return extractThreadFromResultSet(rs);
            }
        //if not, print stack trace and return null.
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
    return null;
    }
    
    public ArrayList<Thread> getAllThreads() throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //query thread table for all records
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM thread;");
            
            //create an arraylist to store all thread records
            ArrayList<Thread> threads = new ArrayList<>();
            
            //pull each thread record into a thread object, and add that object to the arraylist
            while(rs.next())
            {
                Thread thread = extractThreadFromResultSet(rs);
                threads.add(thread);
            }
            
            //return the arraylist of all thread objects
            return threads;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return null;
    }
    
    public ArrayList<Thread> getAllThreadsByCat(int threadCatID) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //query thread table for all records
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM thread WHERE threadcatid=" + threadCatID + "ORDER BY threadid;");
            
            //create an arraylist to store all thread records
            ArrayList<Thread> threads = new ArrayList<>();
            
            //pull each thread record into a thread object, and add that object to the arraylist
            while(rs.next())
            {
                Thread thread = extractThreadFromResultSet(rs);
                threads.add(thread);
            }
            connection.close();
            //return the arraylist of all thread objects
            return threads;
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return null;
    }
    
    //returns 4 threads by latest post, ordered from most recent - I think?
    public ArrayList<Thread> getLatestThreads() throws ClassNotFoundException {
        Connection connection = ConnectionFactory.getConnection();
        try {
          
            String sql = "Select t.* FROM thread as t JOIN post as p on p.postid = (SELECT pi.postid FROM post as pi WHERE pi.threadid = t.threadid ORDER BY pi.created DESC LIMIT 1) ORDER BY p.created DESC LIMIT 4;";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            ArrayList<Thread> threads = new ArrayList<>();
            
            while(rs.next())
            {
                Thread thread = extractThreadFromResultSet(rs);
                threads.add(thread);
            }
            
            //return the arraylist of all thread objects
            return threads;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean insertThread(Thread thread) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //prepare and execute statement to insert thread record with attributes matching those of given thread object
            PreparedStatement ps = connection.prepareStatement("INSERT INTO thread VALUES (NULL, ?, ?, ?)");
            ps.setInt(1, thread.getCategoryID());
            ps.setDate(2, (java.sql.Date)thread.getCreated());
            ps.setString(3, thread.getTitle());
            int i = ps.executeUpdate();

          if(i == 1) {
            return true;
          }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return false;
    }
    
    public boolean updateThread(Thread thread) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //prepare and execute statement to update thread record that matches the given thread object's ID, giving thread record 
            //new attributes that match the given thread object's attributes
            PreparedStatement ps = connection.prepareStatement("UPDATE thread SET categoryid=?, created=?, title=? WHERE threadid=?");
            ps.setInt(1, thread.getCategoryID());
            ps.setDate(2, (java.sql.Date)thread.getCreated());
            ps.setString(3, thread.getTitle());
            ps.setInt(4, thread.getThreadID());
            int i = ps.executeUpdate();

          if(i == 1) {
        return true;
          }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return false;
    }
    
    public boolean deletePost(int threadID) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
    try {
        //create and execute an SQL query to delete the user record matching a given threadID
        Statement stmt = connection.createStatement();
        int i = stmt.executeUpdate("DELETE FROM thread WHERE threadid=" + threadID);

      if(i == 1) {
    return true;
      }

    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return false;
}
}
