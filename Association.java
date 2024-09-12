package uml;

class Person {
	String name;
	int getAge() {
		return 30;
	}
}

class Student extends Person {
	int sid;
	String getGrade() {
		return "A";
	}
}

class Professor extends Person {
	int pid;
	int getPayment() {
		return 1000;
	}
}

public class Association {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Professor p1 = new Professor();
		Student s1 = new Student();
	}

}
