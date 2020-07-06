# 目录
- [String](#string)
- [StringBuffer](#stringbuffer)
- [StringBuilder](#stringbuilder)
- [string内存分配](#string内存分配)



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# String
* 字符串常量
* 每次对 String 类型进行改变的时候其实都等同于生成了一个新的 String 对象，然后将指针指向新的 String 对象，所以经常改变内容的字符串最好不要用 String 



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# StringBuffer
* 字符串变量（线程安全）
### String -> StringBuffer
```java
StringBuffer stringBuffer = new StringBuffer(str);
```

### StringBuffer -> String
```java
String string = stringBuffer.toString();
```

### append() & insert()
```java
new StringBuffer("start").append("666"); // start666
new StringBuffer("start").insert(2, "666"); // st666art
```

### 清空
```java
stringBuffer.setLength(0);
stringBuffer.delete(0, builder.length());
```



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# StringBuilder
* 字符串变量（非线程安全）
### String -> StringBuilder
```java
StringBuilder stringBuilder = new StringBuilder(string);
```

### StringBuilder -> String
```java
String string = stringBuilder.toString();
```

### append() & insert()
```java
new StringBuilder("start").append("666"); // start666
new StringBuilder("start").insert(3, "666"); // sta666rt
```

### 清空
```java
stringBuilder.setLength(0);
stringBuilder.delete(0, builder.length());
```



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



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
