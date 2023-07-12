package backendfacts;

public class Guide {
    private int guideID;
    private int gameID;
    private String info;
    private String strat;
    private int userID;
    private int guideCatID;
    

    // Getters
    public int getGameID() {
        return gameID;
    }

    public String getInfo() {
        return info;
    }

    public String getStrat() {
        return strat;
    }

    public int getUserID() {
        return userID;
    }

    public int getGuideCatID() {
        return guideCatID;
    }

    public int getGuideID() {
        return guideID;
    }

    // Setters
    public void setGameID(int gameID) {
        this.gameID = gameID;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public void setStrat(String strat) {
        this.strat = strat;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public void setGuideCatID(int guideCatID) {
        this.guideCatID = guideCatID;
    }

    public void setGuideID(int guideID) {
        this.guideID = guideID;
    }
}
