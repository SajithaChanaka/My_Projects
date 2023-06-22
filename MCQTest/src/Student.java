public class Student {
    String name;
    static double score;
    static int correctAns;
    static int wrongAns;
    public Student(String input) {
        this.name = input;
        Main.s = this;
    }
    public static double getScore() {
        return score;
    }
    public void setName(String name) {
        this.name = name;
    }
}