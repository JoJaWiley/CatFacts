
package backendfacts;

import java.sql.*;
import java.util.ArrayList;

public class VideosDAO { private Videos extractVideosFromResultSet(ResultSet rs) throws SQLException {
    Videos video = new Videos();
    
    video.setVideoID(rs.getInt("videoID"));
    video.setVideoLink(rs.getString("videoLink"));
    video.setGameID(rs.getInt("gameID"));
    
    return video;
    
}
 //query for the videos matching a given videoID. 
    public Videos getVideo(int videoID) {
    Connection connection = ConnectionFactory.getConnection();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM videos WHERE videoid=" + videoID);
            
            //If found, pull the record into a video object.
            if(rs.next())
            {
                return extractVideosFromResultSet(rs);
            }
        //if not, print stack trace and return null.
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
    return null;
    }
    
    public ArrayList<Videos> getAllVideos() {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //query user table for all records
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM vodies;");
            
            //create an arraylist to store all user records
            ArrayList<Videos> videos = new ArrayList<>();
            
            //pull each user record into a user object, and add that object to the arraylist
            while(rs.next())
            {
                Videos video = extractVideosFromResultSet(rs);
                videos.add(video);
            }
            
//return the arraylist of all user objects (they're people, but our code treats them like objects)
            return videos;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return null;
    }
    
    
}
    
