import java.io.File;
import java.util.Scanner;

public class StartTest extends FileReaderCSV {
    FileReaderCSV reader = new FileReaderCSV();
    Scanner choice;
    File dir = new File("MCQ sets");
    String[] f = dir.list();


    // method
    public void chooseTheTest() {
        showFiles(dir.listFiles());
        choice = new Scanner(System.in);
        String[] f = dir.list();
        System.out.print("\nChoose your Test: ");
        int userChoice = choice.nextInt() - 1;
        String path = "MCQ sets/" + f[userChoice];
        reader.startTest(path);
    }
    public static void showFiles(File[] files) {
        for (int i = 0; i < files.length; i++) {
            System.out.println("Available MCQ sets: " + files[i].getName().replace(".csv", " ") + " (choose " + (i + 1) + ")");

        }
    }
}