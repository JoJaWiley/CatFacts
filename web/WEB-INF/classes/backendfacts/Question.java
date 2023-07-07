package backendfacts;

public class Question {
    private int questionID;
    private String title;
    private int userID;
    private String content;
    private int questionCatID;

    // Getter and Setter for questionID
    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    // Getter and Setter for title
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    // Getter and Setter for userID
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    // Getter and Setter for content
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    // Getter and Setter for questionCatID
    public int getQuestionCatID() {
        return questionCatID;
    }

    public void setQuestionCatID(int questionCatID) {
        this.questionCatID = questionCatID;
    }
}
