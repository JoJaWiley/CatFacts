package backendfacts;

public class Answer {
    private int answerID;
    private String content;
    private int userID;
    private int questionID;

    // Getter and Setter for answerID
    public int getAnswerID() {
        return answerID;
    }

    public void setAnswerID(int answerID) {
        this.answerID = answerID;
    }

    // Getter and Setter for content
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    // Getter and Setter for userID
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    // Getter and Setter for questionID
    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }
}
