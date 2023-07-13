package backendfacts;

import java.sql.*;
import java.util.ArrayList;

public class PostDAO {
    private Post extractPostFromResultSet(ResultSet rs) throws SQLException {
    Post post = new Post();

    post.setPostID( rs.getInt("postID") );
    post.setThreadID( rs.getInt("threadID"));
    post.setUserID(rs.getInt("userID"));
    post.setTitle(rs.getString("title"));
    post.setCreated(rs.getDate("created"));
    post.setContent(rs.getString("content"));

    return post;
    }

    //query for the post matching a given postID. 
    public Post getPost(int postID) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM post WHERE postid=" + postID);
            
            //If found, pull the record into a post object.
            if(rs.next())
            {
                return extractPostFromResultSet(rs);
            }
        //if not, print stack trace and return null.
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
    return null;
    }
    
  
    public ArrayList<Post> getAllPosts() throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //query post table for all records
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM post;");
            
            //create an arraylist to store all post records
            ArrayList<Post> posts = new ArrayList<>();
            
            //pull each post record into a post object, and add that object to the arraylist
            while(rs.next())
            {
                Post post = extractPostFromResultSet(rs);
                posts.add(post);
            }
            connection.close();
            //return the arraylist of all post objects
            return posts;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    return null;
    }
    
    public ArrayList<Post> getAllPostsByThread(int threadID) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //query post table for all records
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM post WHERE threadID =" + threadID + " ORDER BY postid;");
            
            //create an arraylist to store all post records
            ArrayList<Post> posts = new ArrayList<>();
            
            //pull each user record into a user object, and add that object to the arraylist
            while(rs.next())
            {
                Post post = extractPostFromResultSet(rs);
                posts.add(post);
            }
            
            //return the arraylist of all post objects
            connection.close();
            return posts;
            
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        } 

    return null;
    }
    
    public Post getFirstPostByThread(int threadID) throws ClassNotFoundException {
        Connection connection = ConnectionFactory.getConnection();
        try {
            
            String sql = "Select * from post where threadid=" + threadID + " ORDER BY postid LIMIT 1;";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            if (rs.next())
            {
                return extractPostFromResultSet(rs);
            }
            
            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public Post getLatestPostByThread(int threadID) throws ClassNotFoundException {
        Connection connection = ConnectionFactory.getConnection();
        try {
            
            String sql = "Select * from post where threadid=" + threadID + " ORDER BY postid DESC LIMIT 1;";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            if (rs.next())
            {
                return extractPostFromResultSet(rs);
            }
            
            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean insertPost(Post post) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //prepare and execute statement to insert post record with attributes matching those of given post object
            PreparedStatement ps = connection.prepareStatement("INSERT INTO post VALUES (NULL, ?, ?, ?, ?, ?)");
            ps.setInt(1, post.getThreadID());
            ps.setInt(2, post.getUserID());
            ps.setString(3, post.getTitle());
            ps.setDate(4, (Date) post.getCreated());
            ps.setString(5, post.getContent());
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
    
    
    public boolean updatePost(Post post) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
        try {
            //prepare and execute statement to update post record that matches the given post object's ID, giving post record 
            //new attributes that match the given post object's attributes
            PreparedStatement ps = connection.prepareStatement("UPDATE post SET threadid=?, userid=?, title=?, created=?, content=? WHERE postid=?");
            ps.setInt(1, post.getThreadID());
            ps.setInt(2, post.getUserID());
            ps.setString(3, post.getTitle());
            ps.setDate(4, (Date) post.getCreated());
            ps.setString(5, post.getContent());
            ps.setInt(6, post.getPostID());
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
    
    public boolean deletePost(int postID) throws ClassNotFoundException {
    Connection connection = ConnectionFactory.getConnection();
    try {
        //create and execute an SQL query to delete the user record matching a given postID
        Statement stmt = connection.createStatement();
        int i = stmt.executeUpdate("DELETE FROM post WHERE postid=" + postID);

      if(i == 1) {
    return true;
      }

    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return false;
}
    public static void main(String[] args) throws ClassNotFoundException {
        PostDAO pd = new PostDAO();
        ArrayList<Post> posts = pd.getAllPosts();
        for(Post post : posts)
            System.out.println(post.getContent());
    }
}
