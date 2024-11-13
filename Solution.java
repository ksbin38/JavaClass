package firstEdu;

import java.util.Scanner;

public class Solution
{
    public static void main(String args[]) throws Exception
    {
 
        Scanner sc = new Scanner(System.in);
        int T;
        T=sc.nextInt();
 
        for (int i = 1; i <= T; i++) {
            Scanner sc2 = new Scanner(System.in);
            int N;
            N=sc2.nextInt();
             
            int a = 0;
            int b = 0;
            int c = 0;
            int d = 0;
            int e = 0;
 
            if (N % 2 == 0) {
                while (N % 2 == 0) {
                    N = N / 2;
                    a++;
                }
            } 
            if (N % 3 == 0) {
                while (N % 3 == 0) {
                    N = N / 3;
                    b++;
                }
            } 
            if (N % 5 == 0) {
                while (N % 5 == 0) {
                    N = N / 5;
                    c++;
                }
            } 
            if (N % 7 == 0) {
                while (N % 7 == 0) {
                    N = N / 7;
                    d++;
                }
            }
            if (N % 11 == 0) {
                while (N % 11 == 0) {
                    N = N / 11;
                    e++;
                }
            }
            System.out.print("#" + i + " " + a + " " + b + " " + c + " " + d + " " + e);
            System.out.println("");
        }
        Runtime.getRuntime().gc();
        long usedMemory = Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
        System.out.print(usedMemory + " bytes");
    }
}
