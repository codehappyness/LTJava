import java.util.Scanner;

public class HamToanHoc {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double a, b;

        System.out.println("Nhap a = ");
        a = sc.nextDouble();
        System.out.println("Nhap b = ");
        b = sc.nextDouble();

        System.out.println("|a| = " + Math.abs(a));
        System.out.println("min = " + Math.min(a, b));
        System.out.println("max = " + Math.max(a, b));
        System.out.println("ceil(a) = " + Math.ceil(a));
        System.out.println("floor(a) = " + Math.floor(a));
        System.out.println("sqrt(a) = " + Math.sqrt(a));
        System.out.println("a^b = " + Math.pow(a, b));
    }
}
