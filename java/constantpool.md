# string内存分配
```java
private final char value[];
private final int count; 

String s0="kvill";
String s1="kvill";
String s2="kv" + "ill";
System.out.println( s0==s1 ); // true
System.out.println( s0==s2 ); // true

String s0="kvill";
String s1=new String("kvill");
String s2="kv" + new String("ill");
System.out.println( s0==s1 ); // false
System.out.println( s0==s2 ); // false
System.out.println( s1==s2 ); // false


// 知乎
public static void test1() {
    String str1 = new String("hell") + new String("o");
    String str2 = str1.intern();
    String str3 = "hello";

    System.out.println(str1 == str2);// true
    System.out.println(str2 == str3);// true
}


// 痴情研究
public static void test2() {
    System.err.println("****************string*********************");
    String s1 = "abc";
    String s2 = "abc";
    String s3 = new String("abc");
    String s4 = new String("abc");
    System.err.println(s1 == s2);//true      1(编号)
    System.err.println(s3 == s4);//false     2
    System.err.println(s1 == s3);//false     3

    String a = "abc";
    String b = "ab";
    String c = b + "c";
    System.err.println(a == c);//false       4

    String s5 = "123";
    final String s6 = "12";
    String s7 = s6 + "3";
    System.err.println(s5 == s7);//true      5
    System.err.println("****************string*********************");
}
```

