import java.io.IOException;
import java.util.*;
import java.io.*;
class Custom_exception extends ArithmeticException{
    public Custom_exception(String msg){
        super(msg);
    }
}

public class exception_qn {
    public static Scanner sc=new Scanner(System.in);
    public static void add(){
        int num1,num2;
        try{
            System.out.print("Enter number1: ");
            num1=sc.nextInt();
            System.out.print("Enter number2: ");
            num2=sc.nextInt();
            int result=(num1+num2);
            System.out.println("Addition of "+num1+" and "+num2+" is "+ result);
        }
        catch(InputMismatchException ie){
            System.out.println("Input doesn't match the expected datatype");
            sc.next();
        }
    }

    public static void subtract(){
        int num1,num2;
        try{
            System.out.print("Enter number1: ");
            num1=sc.nextInt();
            System.out.print("Enter number2: ");
            num2=sc.nextInt();
            int result=num1-num2;
            System.out.println("Subtraction of "+num1+" and "+num2+" is "+result);
        }
        catch(InputMismatchException ie){
            System.out.println("Input doesn't match the expected datatype");
            sc.next();
        }
    }

    public static void multiply(){
        int num1,num2;
        try{
            System.out.print("Enter number1: ");
            num1=sc.nextInt();
            System.out.print("Enter number2: ");
            num2=sc.nextInt();
            int result=num1*num2;
            System.out.println("Multiplication of "+num1+" and "+num2+" is "+result);
        }
        catch(InputMismatchException ie){
            System.out.println("Input doesn't match the expected datatype");
            sc.next();
        }
    }

    public static void divide(){
        int num1,num2;
        try{
            System.out.print("Enter number1: ");
            num1=sc.nextInt();
            System.out.print("Enter number2: ");
            num2=sc.nextInt();
            if(num2==0){
                throw new Custom_exception("Cannot divide by zero");
            }
            else{
                int result=num1/num2;
                System.out.println("Division of "+num1+" and "+num2+" is "+result);
            }
        }
        catch(Custom_exception ae){
            System.out.println(ae.getMessage());
        }
//        catch(InputMismatchException ie){
//            System.out.println("Input doesn't match the expected datatype");
//            sc.next();
//        }
    }

    public static void main(String[] args){
        int op;
        try {
            do {
                System.out.println("\nArithmetic operations:-");
                System.out.println("1.Addition");
                System.out.println("2.Subtraction");
                System.out.println("3.Multiplication");
                System.out.println("4.Division");
                System.out.println("5.Exit");
                System.out.print("Enter option: ");
                op = sc.nextInt();
                switch (op) {
                    case 1:
                        add();
                        break;
                    case 2:
                        subtract();
                        break;
                    case 3:
                        multiply();
                        break;
                    case 4:
                        divide();
                        break;
                    case 5:
                        System.out.println("Program closed by the user....");
                        break;
                    default:
                        System.out.println("Select valid options only!!");
                }

            } while (op != 5);
        }
        catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
}
