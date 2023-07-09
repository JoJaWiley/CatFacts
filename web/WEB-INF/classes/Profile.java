package backendfacts;


public class Profile {
    //attributes
    private int profileID;
    private int userID;
    private String bio;
    private String profilePic;
    
    public int getProfileID() {
        return profileID;
    }
    
    public void setProfileID(int profileID) {
        this.profileID = profileID;
    }
    
    public int getUserID() {
        return userID;
    }
    
    public void setUserID(int userID) {
        this.userID = userID;
    }
    
    public String getBio() {
        return bio;
    }
    
    public void setBio(String bio) {
        this.bio = bio;
    }
    
    public String getProfilePic() {
        return profilePic;
    }
    
    public void setProfilePic(String profilePic) {
        this.profilePic = profilePic;
    }
}
