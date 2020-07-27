# 目录
- [ServletConfig](#servletconfig)
    - [获取Servlet程序的别名servlet-name](#获取servlet程序的别名servlet-name)
    - [获取初始化参数init-param](#获取初始化参数init-param)
    - [获取ServletContext对象](#获取servletcontext对象)
- [ServletContext](#servletcontext)
    - [获取上下文参数context-param](#获取上下文参数context-param)
    - [获取当前的工程路径](#获取当前的工程路径)
    - [获取在硬盘上的绝对路径](#获取在硬盘上的绝对路径)
    - [像Map一样存取数据](#像map一样存取数据)
- [Servlet](#servlet)
    - [新建servlet](#新建servlet)
    - [生命周期](#生命周期)



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# ServletConfig
通过`init(ServletConfig config) {}`函数获取或`getServletConfig()`方法获取ServletConfig  
ServletConfig是一个接口, 每一个Servlet程序都对应一个ServletConfig实例  

### 获取Servlet程序的别名servlet-name
```java
public void init(ServletConfig config) throws ServletException {
    super.init(config);
    System.out.println(config.getServletName()); // MyServlet
}
```
```xml
<servlet>
    <servlet-name>MyServlet</servlet-name>
    <servlet-class>test.MyServlet</servlet-class>
</servlet>

<servlet-mapping>
    <servlet-name>MyServlet</servlet-name>
    <url-pattern>/hello</url-pattern>
</servlet-mapping>
```

### 获取初始化参数init-param
```java
public void init(ServletConfig config) throws ServletException {
    super.init(config);
    System.out.println(config.getInitParameter("username"));
    System.out.println(config.getInitParameter("url"));
}
```
```xml
<servlet>
    <servlet-name>MyServlet</servlet-name>
    <servlet-class>test.MyServlet</servlet-class>
    <!--初始化参数-->
    <init-param>
        <param-name>username</param-name>
        <param-value>test</param-value>
    </init-param>
    <init-param>
        <param-name>url</param-name>
        <param-value>test</param-value>
    </init-param>
</servlet>

<servlet-mapping>
    <servlet-name>MyServlet</servlet-name>
    <url-pattern>/hello</url-pattern>
</servlet-mapping>
```

### 获取ServletContext对象
```java
public void init(ServletConfig config) throws ServletException {
    super.init(config);
    System.out.println(config.getServletContext());
}
```



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# ServletContext
一个web工程只有一个ServletContext实例  
ServletContext在web工程部署的时候创建, 在web工程停止的时候销毁  
通过`getServletConfig().getServletContext()`方法或直接通过`getServletContext()`方法获取ServletContext  

### 获取上下文参数context-param
虽然ServletContext的`getInitParameter()`方法和ServletConfig中的`getInitParameter()`名字一样, 但是前者只能获取context-param参数, 后者只能获取init-param参数  
```java
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    super.doGet(req, resp);
    ServletContext context = getServletContext();
    String s = context.getInitParameter("param");
}
```
```xml
<context-param>
    <param-name>param</param-name>
    <param-value>ppp</param-value>
</context-param>

<servlet>
    <servlet-name>MyServlet</servlet-name>
    <servlet-class>test.MyServlet</servlet-class>
</servlet>

<servlet-mapping>
    <servlet-name>MyServlet</servlet-name>
    <url-pattern>/hello</url-pattern>
</servlet-mapping>
```

### 获取当前的工程路径
```java
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    super.doGet(req, resp);
    ServletContext context = getServletContext();
    String path = context.getContextPath(); // /test_explored_war
}
```

### 获取在硬盘上的绝对路径
```java
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    super.doGet(req, resp);
    ServletContext context = getServletContext();
    String path = context.getRealPath("/");
}
```

### 像Map一样存取数据
```java
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    super.doGet(req, resp);
    ServletContext context = getServletContext();
    context.setAttribute("key1", "value2");
    context.getContext("key1");
    context.removeAttribute("key1");
}
```



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# Servlet
### 新建servlet
在/src新建一个类, 并继承javax.servlet.http.HttpServlet类, 重写部分方法  
在/WEB_INF/web.xml中配置相关信息  
```xml
<servlet>
    <!--servlet-name标签给Servlet程序起一个别名, 一般是类名-->
    <servlet-name>MyServlet</servlet-name>
    <!--servlet-class标签是Servlet程序的全类名-->
    <servlet-class>com.test.MyServlet</servlet-class>
</servlet>

<servlet-mapping>
    <!--servlet-name标签告诉服务器当前配置的地址给哪个Servlet程序使用(与别名相对应)-->
    <servlet-name>MyServlet</servlet-name>
    <!--url-pattern标签配置访问地址, 一般与类名相同-->
    <url-pattern>/test</url-pattern>
</servlet-mapping>
```

### 生命周期
1. 执行servlet构造器
2. 执行`init()`方法
3. 执行`service()`方法(每次访问都会执行)
4. 执行`destroy()`方法
