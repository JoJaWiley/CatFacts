package backendfacts;

public class Guide {
    private int guideID;
    private String guideTitle;
    private String guideInfo;
    private String guidePage;
    private int gameID;
    private int infoID;
    private int stratID;
    private int userID;
    private int guideCatID;
    
    public Guide(){
        
    }
    

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
    
    public String getGuideTitle(){
        return guideTitle;
    }
    
    public String getGuideInfo(){
        return guideInfo;
    }
    
    public String getGuidePage(){
        return guidePage;
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
    
    public void setGuideTitle(String guideTitle) {
        this.guideTitle = guideTitle;
    }
    
    public void setGuideInfo(String guideInfo) {
        this.guideInfo = guideInfo;
    }
    
    public void setGuidePage(String guidePage) {
        this.guidePage = guidePage;
    }
}
