import java.util.Scanner;

public class ViDuWhile {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int x = 1;

        while (x != 0) {
            System.out.println("Nhap 0 de thoat:");
            x = sc.nextInt();
        }

        int i = 0;
        while (true) {
            System.out.println(i);
            i++;
            if (i == 10) break;
        }
    }
}
