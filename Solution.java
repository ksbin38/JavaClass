package firstEdu;

import java.util.Scanner;

public class Solution
{
	public boolean isSame(int[] arr) {
		boolean result = false;
		for(int i = 0; i < arr.length-1; i++) {
			if(arr[i] == arr[i+1]) {
				result = true;
			} else {
				result = false;
				break;
			}
		}
		return result;
	}
	
	public int move(int[] arr, int K) {
		int result = 0;
		Solution s = new Solution();
		
		int n = 0;
		System.out.println(s.isSame(arr));
		if(s.isSame(arr) == true) {
			return result;
		} else {
			while(n < arr.length) {
				int a = arr[K-1];
				for(int i = 0; i < arr.length-1; i++) {
					arr[i] = arr[i+1];
				}
				arr[arr.length-1] = a;
				result++;
				n++;
				if(s.isSame(arr) == true) {
					break;
				} else {
					continue;
				}
			}
		}
		if(s.isSame(arr) == true) {
			return result;
		} else {
			return result = -1;
		}
	}
	
    public static void main(String args[]) throws Exception
    {
 
        Scanner sc = new Scanner(System.in);
        Solution s = new Solution();
        int T;
        T=sc.nextInt();
 
        int N;
        int K;
        N = sc.nextInt();
        K = sc.nextInt();
        
        int[] arr = new int[N];
        for(int i = 0; i < N; i++) {
        	arr[i] = sc.nextInt();
        }
        for(int i = 0; i < T; i++) {
        	System.out.println("#" + T + " " + s.move(arr, K));
        }
        
        Runtime.getRuntime().gc();
        long usedMemory = Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
        System.out.print(usedMemory + " bytes");
    }
}
