import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class FileReaderCSV {
    BufferedReader reader;
    public void startTest(String fileName) {
        Scanner answer;
        try {
            reader = new BufferedReader(new FileReader(fileName));
            String output;
            System.out.println("\n   HTML Questions.");
            while ((output = reader.readLine()) != null) {
                String[] data = output.split(",");
                System.out.printf("%s", data[0]);
                System.out.println();
                String A = data[1];
                String B = data[2];
                String C = data[3];
                String D = data[4];;
                String correctAnswer = data[5];

                System.out.format("  A. %s \n  B. %s \n  C. %s \n  D. %s \n", A, B, C, D);
                System.out.println("\n");
                answer = new Scanner(System.in);
                System.out.print("Enter your Answer: ");
                String getAnswer = answer.nextLine();
                System.out.println();
                if (getAnswer.equalsIgnoreCase(correctAnswer)) {
                    System.out.println("Your Answer is Correct.");
                    Student.score++;
                    Student.correctAns++;

                } else {
                    Student.wrongAns++;
                    System.out.println("Your Answer is Wrong ,The correct Answer is: " + correctAnswer + ". " );
                    System.out.println();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}


