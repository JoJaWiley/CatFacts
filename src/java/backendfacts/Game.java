package backendfacts;

public class Game {
    
    public Game() {
        
    }
    
    public Game(String title, double price, String date, String genre, int score, String studio) {
        this.title = title;
        this.price = price;
        this.date = date;
        this.genre = genre;
        this.score = score;
        this.studio = studio;
    }
    
    private int gameID;
    private String title;
    private double price;
    private String date;
    private String genre;
    private int score;
    private String studio;

    public int getGameID() {
        return gameID;
    }

    public void setGameID(int gameID) {
        this.gameID = gameID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getStudio() {
        return studio;
    }

    public void setStudio(String studio) {
        this.studio = studio;
    }
    
    
}
