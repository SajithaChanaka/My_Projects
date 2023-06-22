import java.util.Scanner;

public class Main {
    static Scanner sc;
    static Scanner sc1 = new Scanner(System.in);
    public static Student s;
    static int i;
    public static void main(String[] args) {
        fillYourName();
        selectYourMCQ();
        showResult();
    }
    private static void showResult() {
        double finalScore = Student.getScore();
        String name = s.name;
        System.out.println("Name: " + name + " Score: " + finalScore/(Student.correctAns + Student.wrongAns) * 100 + "%");
        System.out.println("You have Answered " + Student.correctAns + " Questions Correctly.");
        System.out.println("You have Answered " + Student.wrongAns + " Questions wrongly.");
    }
    private static void selectYourMCQ() {
        StartTest test = new StartTest();
        test.chooseTheTest();
    }
    public static void fillYourName() {
        sc = new Scanner(System.in);
        System.out.print("Welcome to MCQ Test! \n\nEnter your Name: ");
        String name = sc.nextLine();
        Student students = new Student(name);
        students.setName(name);
        System.out.println("Hi " + students.name + " Hope you will do the Exam well. \n");

    }
}