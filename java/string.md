# String 字符串常量
* 每次对 String 类型进行改变的时候其实都等同于生成了一个新的 String 对象，然后将指针指向新的 String 对象，所以经常改变内容的字符串最好不要用 String 

# StringBuffer 字符串变量（线程安全）
###### String -> StringBuffer
```java
StringBuffer stringBuffer = new StringBuffer(str);
```

###### StringBuffer -> String
```java
String string = stringBuffer.toString();
```

###### append() & insert()
```java
new StringBuffer("start").append("666"); // start666
new StringBuffer("start").insert(2, "666"); // st666art
```

###### 清空
```java
stringBuffer.setLength(0);
stringBuffer.delete(0, builder.length());
```

# StringBuilder 字符串变量（非线程安全）
###### String -> StringBuilder
```java
StringBuilder stringBuilder = new StringBuilder(string);
```

###### StringBuilder -> String
```java
String string = stringBuilder.toString();
```

###### append() & insert()
```java
new StringBuilder("start").append("666"); // start666
new StringBuilder("start").insert(3, "666"); // sta666rt
```

###### 清空
```java
stringBuilder.setLength(0);
stringBuilder.delete(0, builder.length());
```

