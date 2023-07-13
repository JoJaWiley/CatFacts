
package backendfacts;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
    public static final String URL = "jdbc:mysql://localhost:3306/catfact";
    public static final String USER = "root";
    public static final String PASS = "admin";

    /**
      Get a connection to database
      @return Connection object
     * @throws java.lang.ClassNotFoundException
      * 
     */
    public static Connection getConnection() throws ClassNotFoundException
    {
      try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          return DriverManager.getConnection(URL, USER, PASS);
      } catch (SQLException ex) {
          throw new RuntimeException("Error connecting to the database", ex);
      }
    
    }
}
