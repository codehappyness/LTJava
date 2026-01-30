import java.util.Scanner;

public class BaiTapGiaiPTBacNhat {
    public static void main(String[] args) {
        double a, b, x;
        Scanner sc = new Scanner(System.in);

        System.out.println("Nhap a = ");
        a = sc.nextDouble();
        System.out.println("Nhap b = ");
        b = sc.nextDouble();

        if (a == 0) {
            if (b == 0) {
                System.out.println("Phuong trinh vo so nghiem");
            } else {
                System.out.println("Phuong trinh vo nghiem");
            }
        } else {
            x = -b / a;
            System.out.println("Nghiem x = " + x);
        }
    }
}
