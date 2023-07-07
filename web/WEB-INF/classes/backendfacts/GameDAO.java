package backendfacts;

import java.sql.*;
import java.util.ArrayList;

public class GameDAO {
    
    private Game extractGameFromResultSet(ResultSet rs) throws SQLException {
    Game game = new Game();

    game.setGameID( rs.getInt("gameID") );
    game.setTitle( rs.getString("title"));
    game.setPrice( rs.getDouble("price"));
    game.setDate(rs.getString("date"));
    game.setGenre(rs.getString("genre"));
    game.setScore(rs.getInt("score"));
    game.setStudio(rs.getString("studio"));

    return game;
    }
    
    //query for the game matching a given gameID. 
    public Game getGame(int gameID) {
    Connection connection = ConnectionFactory.getConnection();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM games WHERE gameid=" + gameID);
            
            //If found, pull the record into a game object.
            if(rs.next())
            {
                return extractGameFromResultSet(rs);
            }
        //if not, print stack trace and return null.
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
    return null;
    }
    
    public ArrayList<Game> getAllGames() {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //query user table for all records
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM games;");
            
            //create an arraylist to store all user records
            ArrayList<Game> games = new ArrayList<>();
            
            //pull each user record into a user object, and add that object to the arraylist
            while(rs.next())
            {
                Game game = extractGameFromResultSet(rs);
                games.add(game);
            }
            
            //return the arraylist of all user objects (they're people, but our code treats them like objects)
            return games;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return null;
    }
    
    public Game getRandomGame() {
    
    int random = (int)Math.floor(Math.random()*25 + 1);
    
    ArrayList<Game> games = getAllGames();
    
    return games.get(random);
}
    
    public boolean insertGame(Game game) {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //prepare and execute statement to insert user record with attributes matching those of given user object
            PreparedStatement ps = connection.prepareStatement("INSERT INTO games VALUES (NULL, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, game.getTitle());
            ps.setDouble(2, game.getPrice());
            ps.setString(3, game.getDate());
            ps.setString(4, game.getGenre());
            ps.setInt(5, game.getScore());
            ps.setString(6, game.getStudio());
            int i = ps.executeUpdate();

          if(i == 1) {
            return true;
          }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return false;
    }
    
    
}
