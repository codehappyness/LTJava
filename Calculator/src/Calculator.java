import java.util.Scanner;

public class Calculator {
    public static void main(String[] args) {
        int a, b;
        Scanner sc = new Scanner(System.in);

        System.out.println("Nhap vao a = ");
        a = sc.nextInt();
        System.out.println("Nhap vao b = ");
        b = sc.nextInt();

        System.out.println(a + " + " + b + " = " + (a + b));
        System.out.println(a + " - " + b + " = " + (a - b));
        System.out.println(a + " * " + b + " = " + (a * b));
        System.out.println(a + " / " + b + " = " + ((float) a / b));
        System.out.println(a + " % " + b + " = " + (a % b));
    }
}
