
public class Library {
    static {
        System.loadLibrary("calc"); // Loads our JNI library
    }

    public static void main(String[] args) {
        var res = runHS();

        System.out.println("Result is: " + res);
    }

    // Native function that calls haskell function
    public static native String runHS();
}