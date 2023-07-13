package backendfacts;

public class GuideCategory {
    
    private int guideCategoryID;
    private String guideCategoryTitle;
    
    public GuideCategory(){
        
    }
    

    // Getters
    
    public int getGuideCategoryID(){
        return guideCategoryID;
    }
    public String getGuideCategoryTitle() {
        return guideCategoryTitle;
    }
    
    public void setGuideCategoryID(int guideCategoryID){
        this.guideCategoryID = guideCategoryID;
    }
    
    public void setGuideCategoryTitle(String guideCategoryTitle) {
        this.guideCategoryTitle = guideCategoryTitle;
    }

}