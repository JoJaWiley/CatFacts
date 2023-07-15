
package backendfacts;

public class TeamUser {
    private int teamUserID;
    private int teamID;
    private int userID;

    public int getTeamID() {
        return teamID;
    }

    public void setTeamID(int teamID) {
        this.teamID = teamID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }
    
    public int getTeamUserID() {
        return teamUserID;
    }
    
    public void setTeamUserID(int teamUserID) {
        this.teamUserID = teamUserID;
    }
}
