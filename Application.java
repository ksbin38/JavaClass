package uml;

class Account {
	int balance;
	int deposit(int amount) {
		balance = balance + amount;
		return balance;
	}
}

public class Application {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Account account1 = new Account();
		account1.balance = 1000;
		account1.deposit(100);
		System.out.println(account1.balance);
	}

}
