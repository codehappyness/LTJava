import java.util.Scanner;

public class ViDuTryCatch {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = 0;

        try {
            System.out.println("Nhap n: ");
            n = sc.nextInt();
        } catch (Exception e) {
            System.out.println("Nhap sai du lieu");
        } finally {
            System.out.println("Finally!");
        }

        System.out.println("Gia tri n = " + n);
    }
}
