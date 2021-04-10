import java.util.Scanner;

public class Library {
    static {
        System.loadLibrary("calc");
    }

    public static void main(String[] args) {

        try (var scanner = new Scanner(System.in)) {
            System.out.println("enter a string in format <a + b>");
            var exprParts = scanner.nextLine().split("\\s\\+\\s");
            int a = Integer.parseInt(exprParts[0]);
            int b = Integer.parseInt(exprParts[1]);
            int res = addHs(a, b);
            System.out.println("Result is: " + res);
        }
    }

    /**
     * This is implemented 
     * @param a
     * @param b
     * @return
     */
    public static native int addHs(int a, int b);
}