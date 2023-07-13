package backendfacts;

public class Strategy {
    private int stratID;
    private String stratTitle;
    private int guideCategoryID;
    private String stratContent;
    
    public Strategy (){
        
    }

    // Getter and Setter for stratID
    public int getStratID() {
        return stratID;
    }

    public void setStratID(int stratID) {
        this.stratID = stratID;
    }
    
    public String getStratTitle() {
        return stratTitle;
    }
    
    public void setStratTitle(String stratTitle){
        this.stratTitle = stratTitle;
    }
    
    public int getGuideCategoryID(){
        return guideCategoryID;
    }
    
    public void setGuideCategoryID(int guideCategoryID) {
        this.guideCategoryID = guideCategoryID;
    }

    // Getter and Setter for stratContent
    public String getStratContent() {
        return stratContent;
    }

    public void setStratContent(String stratContent) {
        this.stratContent = stratContent;
    }
}
