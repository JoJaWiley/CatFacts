package backendfacts;

import java.util.Date;

public class Thread {
    private int threadID;
    private int categoryID;
    private Date created;
    private String title;
    
    public int getThreadID() {
        return threadID;
    }
    
    public void setThreadID(int threadID) {
        this.threadID = threadID;
    }
    
    public int getCategoryID() {
        return categoryID;
    }
    
    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }
    
    public Date getCreated() {
        return created;
    }
    
    public void setCreated(Date created) {
        this.created = created;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
}
