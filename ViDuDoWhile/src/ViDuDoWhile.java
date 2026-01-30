import java.util.Scanner;

public class ViDuDoWhile {
    public static void main(String[] args) {
        int n;
        Scanner sc = new Scanner(System.in);

        do {
            System.out.println("Nhap n > 0:");
            n = sc.nextInt();
        } while (n <= 0);
    }
}
