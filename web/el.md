# 目录




<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 输出域对象
### 基本用法
```jsp
<%
    request.setAttribute("key", "Hello World");
%>
JSP表达式: <%=request.getAttribute("key")%>
EL表达式: ${key}
```

### 空字符串  
```jsp
<%
    request.setAttribute("key", "Hello World");
%>
JSP表达式: <%=request.getAttribute("key1")%>
EL表达式: ${key1}
<!-- JSP表达式: null -->
<!-- EL表达式: -->
```

### 相同的key
域对象中都有同样的值的话, 按照范围从小到大取值  
```jsp
<%-- pageContext < request < session < application--%>
<%
    pageContext.setAttribute("key", "pageContext");
    request.setAttribute("key", "Hello World");
    session.setAttribute("key", "session");
    application.setAttribute("key", "application");
%>
${key}
```

### 输出ojbect
调用的是`.get()`方法, 并不是属性. 没有对应属性直接写`get()`方法也可行  
```jsp
<%
    Person person = new Person();
    person.setName("mmmmm");
    person.setPhone(new String[]{"13800000000", "13911111111"});
    List<String> list = new ArrayList();
    list.add("beijing");
    list.add("changsha");
    list.add("wuhan");
    person.setCities(list);
    Map<Object, Object> map = new HashMap();
    map.put("key1", "value1");
    map.put("key2", "value2");
    map.put("key3", "value3");
    map.put("key4", "value4");
    person.setMap(map);

    pageContext.setAttribute("key", person);
%>
person: ${key} <!-- com.sprn.pojo.Person@39a9444d -->
person.name: ${key.name} <!-- mmmmm -->
person.phone: ${key.phone} <!-- [Ljava.lang.String;@a3d898c -->
person.phone: ${key.phone[0]} <!-- 13800000000 -->
person.cities: ${key.cities} <!-- [beijing, changsha, wuhan] -->
person.cities: ${key.cities.get(0)} <!-- beijing -->
person.map: ${key.map} <!-- {key1=value1, key2=value2, key3=value3, key4=value4} -->
person.map: ${key.map.get("key1")} <!-- value1 -->
person.map: ${key.map.key3} <!-- value3 -->
````



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# empty运算
以下几种情况值为空, 使用`empty`运算会输出true  
* null
* 空串
* 长度为0的数组
* 没有元素的List对象
* 没有元素的Map对象
```jsp
<%
    request.setAttribute("key1", null);
    request.setAttribute("key2", new Object()); //false
    request.setAttribute("key3", "");
    request.setAttribute("key4", new String[]{});
    request.setAttribute("key5", new String[0]);
    request.setAttribute("key6", new String[1]); //false
    request.setAttribute("key7", new ArrayList());
    request.setAttribute("key8", new HashMap());
%>
${ empty key }
```



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 11个隐含对象

变量               | 类型                   | 作用
------------------ | ---------------------- | -----
`pageScope`        | `Map<String,Object>`   | 它可以获取 pageContext 域中的数据
`requestScope`     | `Map<String,Object>`   | 它可以获取 Request 域中的数据
`sessionScope`     | `Map<String,Object>`   | 它可以获取 Session 域中的数据
`applicationScope` | `Map<String,Object>`   | 它可以获取 ServletContext 域中的数据
`pageContext`      | `PageContextImpl`      | 它可以获取 jsp 中的九大内置对象
`param`            | `Map<String,String>`   | 它可以获取请求参数的值
`paramValues`      | `Map<String,String[]>` | 它也可以获取请求参数的值，获取多个值的时候使用。
`header`           | `Map<String,String>`   | 它可以获取请求头的信息
`headerValues`     | `Map<String,String[]>` | 它可以获取请求头的信息，它可以获取多个值的情况
`cookie`           | `Map<String,Cookie>`   | 它可以获取当前请求的 Cookie 信息
`initParam`        | `Map<String,String>`   | 它可以获取在 web.xml 中配置的`<context-param>`上下文参数

### 四个域对象
```jsp
<%
    pageContext.setAttribute("key", "pageContext");
    request.setAttribute("key", "request");
    session.setAttribute("key", "session");
    application.setAttribute("key", "application");
%>
${ sessionScope.key }
```

### pageContext对象
```jsp
<%=request.getServerPort()%>
${pageContext.request.serverPort}
```

<br>

实际用法:  
```jsp
<%
    pageContext.setAttribute("req", request);
%>
${ req.serverPort }
```
