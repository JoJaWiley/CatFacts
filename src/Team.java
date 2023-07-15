package backendfacts;

public class Team {
    
    private int teamID;
    
    private String teamName;

    private int userID;

    private String requirements;

    private int slots;



    // Constructors
    
    public Team() {
        
    }

    public Team(String teamName, int userID, String requirements, int slots) {

        this.teamName = teamName;

        this.userID = userID;

        this.requirements = requirements;

        this.slots = slots;

    }
    
    public int getTeamID() {
        return teamID;
    }

    public void setTeamID(int teamID) {
        this.teamID = teamID;
    }



    // Getters

    public String getTeamName() {

        return teamName;

    }



    public int getUserID() {

        return userID;

    }



    public String getRequirements() {

        return requirements;

    }



    public int getSlots() {

        return slots;

    }



    // Setters

    public void setTeamName(String teamName) {

        this.teamName = teamName;

    }



    public void setUserID(int userID) {

        this.userID = userID;

    }



    public void setRequirements(String requirements) {

        this.requirements = requirements;

    }



    public void setSlots(int slots) {

        this.slots = slots;

    }
}
