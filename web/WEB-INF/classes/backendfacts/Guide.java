package backendfacts;

public class Guide {
    private int guideID;
    private int gameID;
    private int infoID;
    private int stratID;
    private int userID;
    private int guideCatID;
    

    // Getters
    public int getGameID() {
        return gameID;
    }

    public int getInfoID() {
        return infoID;
    }

    public int getStratID() {
        return stratID;
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

    public void setInfoID(int infoID) {
        this.infoID = infoID;
    }

    public void setStratID(int stratID) {
        this.stratID = stratID;
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
