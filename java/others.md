# 目录
- [日期](#日期)
- [访问修饰符](#访问修饰符)
- [配置文件](#配置文件)



**************************************************************************************************************
**************************************************************************************************************



# 日期
`Date`和`SimpleDateFormat`是线程不安全的  

Code   | Description
------ | -----------
`yyyy` | 年份, 只能使用这个
`YYYY` | 年份, 使用这个会有bug
`mm`   | 分钟数
`MM`   | 月份数
`dd`   | 每个月的几号
`DD`   | 当前距离每年第一天的天数
`ss`   | 秒数

```java
Date date = new Date();
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
System.out.println(simpleDateFormat.format(date)); // 2020-01-13 13:28:09
```

# 访问修饰符

symbol    | 同类  | 同包 | 子类 | 外部包
--------- | ---   | ---- | ---- | ------ 
public    | √     | √    | √    | √ 
protected | √     | √    | √    | × 
default   | √     | √    | ×    | × 
private   | √     | ×    | ×    | × 

# 配置文件
```java
// 读取jar包外配置文件
InputStream inputStream = new FileInputStream(new File("/home/user/a.properties"));
Properties properties = new Properties();
properties.load(inputStream);
```

```java
// 读取jar包内配置文件
InputStream inputStream = PropertyUtil.class.getClassLoader().getResourceAsStream("system.properties");
Properties properties = new Properties();
properties.load(inputStream);
```
