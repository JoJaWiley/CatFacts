
package backendfacts;

import java.sql.*;
import java.util.ArrayList;

//given a resultset from a query from user table, put together a user object by transferring the attributes from table to object
public class UserDAO {
    private User extractUserFromResultSet(ResultSet rs) throws SQLException {
    User user = new User();

    user.setUserID( rs.getInt("userID") );
    user.setUserName( rs.getString("username"));
    user.setPassword( rs.getString("password"));
    user.setEmail(rs.getString("email"));

    return user;
    }

    //query for the user matching a given uderID. 
    public User getUser(int userID) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM user WHERE userid=" + userID);
            
            //If found, pull the record into a user object.
            if(rs.next())
            {
                return extractUserFromResultSet(rs);
            }
        //if not, print stack trace and return null.
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
    return null;
    }
    
    public User getUserByUsernameAndPassword(String user, String pass) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //query for a user record matching the given username and password
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM user WHERE username=? AND password=?");
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();

            //if found, pull that user record into a user object
            if(rs.next())
            {
        return extractUserFromResultSet(rs);
            }
            
        //if not, print stack trace and return null
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return null;
    }
    
    public ArrayList<User> getAllUsers() throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //query user table for all records
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM user;");
            
            //create an arraylist to store all user records
            ArrayList<User> users = new ArrayList<>();
            
            //pull each user record into a user object, and add that object to the arraylist
            while(rs.next())
            {
                User user = extractUserFromResultSet(rs);
                users.add(user);
            }
            
            //return the arraylist of all user objects (they're people, but our code treats them like objects)
            return users;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return null;
    }
    
    public boolean insertUser(User user) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //prepare and execute statement to insert user record with attributes matching those of given user object
            PreparedStatement ps = connection.prepareStatement("INSERT INTO user VALUES (NULL, ?, ?, ?)");
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            int i = ps.executeUpdate();

          if(i == 1) {
            return true;
          }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return false;
    }
    
    
    public boolean updateUser(User user) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //prepare and execute statement to update user record that matches the given user object's ID, giving user record 
            //new attributes that match the given user object's attributes
            PreparedStatement ps = connection.prepareStatement("UPDATE user SET username=?, password=?, email=? WHERE userid=?");
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setInt(4, user.getUserID());
            int i = ps.executeUpdate();

          if(i == 1) {
        return true;
          }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return false;
    }
    
    public boolean deleteUser(int userID) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
    try {
        //create and execute an SQL query to delete the user record matching a given userID
        Statement stmt = connection.createStatement();
        int i = stmt.executeUpdate("DELETE FROM user WHERE userid=" + userID);

      if(i == 1) {
    return true;
      }

    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return false;
}
    
}
