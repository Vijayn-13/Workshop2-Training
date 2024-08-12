import java.util.*;

public class java8_qn {
    public static Scanner sc=new Scanner(System.in);
    public static void create(List<String> ls){
        System.out.print("Enter list size: ");
        int n=sc.nextInt();
        String str;
        for(int i=0;i<n;i++){
            System.out.print("Enter string: ");
            str=sc.next();
            ls.add(str);
        }
    }
    public static void main(String[] args){
        List<String> ls=new ArrayList<>();
        create(ls);
        System.out.println("List of strings: "+ls);
        List<String> streamed_list=ls.stream().filter(l->l.length()>5).toList();
        System.out.println("Filtered list:-");
        streamed_list.forEach(System.out::println);
    }
}
