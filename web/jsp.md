# 目录
* 指令标识
    * page指令 `<%@ page %>`
    * include指令 `<%@ include %>`
    * taglib指令 `<%@ taglib %>`
* 脚本标识
    * JSP表达式 `<%= 表达式 %>`
    * 声明标识 `<%! 声明 %>`
    * 代码片段 `<% 代码片段 %>`
* 动作标识
    * 包含文件标识 `<jsp:include>`
    * 请求转发标识 `<jsp:forward>`
    * 传递参数标识 `<jsp:param>`


****************************************************************************************



# 指令标识 [顶部](#目录)
> 指令名包括page include taglib三个指令  
```
<%@ 指令名 属性1="属性值1" 属性2="属性值2" %>
```

### 1. page指令 [顶部](#目录)
> page是JSP页面最常用的指令, 用于定义整个JSP页面的相关属性, 这些属性在JSP中被服务器解析成Servlet时会转换为相应的Java程序代码  

1. language属性
    > 用于设置JSP页面使用的语言, 目前只支持Java语言  
    ```jsp
    <%@ page language="java" %>
    ```
2. extends属性
    > 用于设置JSP页面继承的Java类, 所有JSP页面在执行之前都会被服务器解析成Servlet, 而ServIet是由Java类定义的, 所以JSP和ServIet都可以继承指定的父类  
3. import属性
    > 用于设置JSP导入的类包. JSP页面可以嵌入Java代码片段, 这些Java代码在调用API时需要导入相应的类包  
    ```jsp
    <%@ page import="java.util.Date"%>
    ```
4. pageEncoding属性
    > 用于定义JSP页面的编码格式, 也就是指定文件编码  
    ```jsp
    <%@ page pageEncoding="UTF-8"%>
    ```
5. contentType属性
    > 用于设置JSP页面的MIME类型和字符编码, 浏览器会据此显示网页内容  
    ```jsp
    <%@ page contentType="text/html; charset=UTF-8" %>
    ```
6. session属性
    > 指定JSP页面是否使用HTTP的session会话对象. 其属性值是boolean类型, 默认值为true, 表示可以使用session会话对象  
    ```jsp
    <%@ page session="true" %>
    ```
7. buffer属性
    > 用于设置JSP的out输出对象使用的缓冲区大小, 默认大小为8KB, 且单位只能使用KB. 建议使用8的倍数16、32、64、128等  
    ```jsp
    <%@ page buffer="128KB" %>
    ```
8. autoFlush属性
    > 用于设置JSP页面缓存满时, 是否自动刷新缓存  
    > 默认值为true, 如果设置为false, 则缓存被填满时将抛出异常  
    ```jsp
    <%@ page autOFlush="false" %>
    ```
9. isErrorPage属性
    > 可以将当前JSP页而设置成错误处理页面, 以处理另一个JSP页面的错误, 也就是异常处理  
    ```jsp
    <%@ page isErrorPage="true" %>
    ```
10. errorPage属性
    > 用于指定处理当前JSP页面异常错误的另一个JSP页面, 指定的JSP错误处理页面必须设置isErrorPage属性为true  
    > errorPage属性的属性值是一个url字符串  
    > 如果设置该属性, 那么在web.xml文件中定义的任何错误页面都将被忽略, 而优先使用该属性定义的错误处理页面  
    ```jsp
    <%@ page errorPage="error/login/ErrorPage.jsp" %>
    ```

### 2. include指令 [顶部](#目录)
> 文件包含指令include是JSP的另一条指令标识, 通过该指令可以在一个JSP贞面中包含另一个JSP页面  
> 该指令是**静态包含**, 也就是说被包含文件中所有内容会被原样包含到该JSP页面中, 即使被包含文件中有JSP代码, 在包含时也不会被编译执行  
> 使用include指令, 最终将生成一个文件, 所以在被包含和包含的文件中, 不能有相同名称的变量  
> 该指令只有一个file属性, 用于指定要包含文件的路径. 不可以是通过<%=%>表达式所代表的文件  
```jsp
<%@ include file="path" %>
```

### 3. taglib指令 [顶部](#目录)
> 通过taglib指令标识声明该页面中所使用的标签库, 同时引用标签库, 并指定标签的前缀  
> 在页面中引用标签库后, 就可以通过前缀来引用标签库中的标签  
* prefix: 用于指定标签的前缀。该前缀不能命名为jsp、jspx、java、javax、sun、servlet和sun
* uri: 用于指定标签库文件的存放位置
```jsp
<%@ taglib prefix="tagPrefix" uri="tagURI" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
```



****************************************************************************************



# 脚本标识 [顶部](#目录)
> 脚本标识分为三部分: JSP表达式(Expression), 声明标识(Deceleration), 脚本程序(Scriptlet)

### 1. JSP表达式 [顶部](#目录)
> JSP表达式用于向页面中输出信息  
> JSP表达式可以实任意的Java表达式, 该表达式的最终运算结果被转为字符串  
> JSP表达式不仅可以插入到网页文本中, 也可以插入到HTML标签内  
```
<%= 表达式 %>
```
```jsp
<img src="images/<%=url%>">

<%= 5+6 %>
```

### 2. 声明标识 [顶部](#目录)
> 声明标识用于在JSP页面中定义全局的变量或方法  
> 通过声明标识定义的变量和方法可以被整个JSP页面访问, 所以通常使用该标识定义整个JSP页面需要引用的变量或方法  
> 服务器执行JSP页面时, 会将JSP页面转化为Servlet类, 在该类中会把使用JSP声明标识定义的变量和方法转换为类的成员变量和方法  
```
<%! 声明的变量或方法 %>
```
```jsp
<%!
    int number = 0;
    int count() {
        number++;
        return number;
    }
%>
```

### 3. 代码片段 [顶部](#目录)
> 代码片段, 就是在JSP页面中嵌入的Java代码或是脚本代码  
> 代码片段将在页面请求的处理期间被执行, 通过Java代码可以定义变量或是流程控制语句等
> 而通过脚本代码可以应用JSP的内置对象在页面输出内容、处理请求和响应、访问session会话等
```
<% Java代码或是脚本代码 %> 
```
* 代码片段与声明标识的区别: 
    * 通过**声明标识**创建的变量和方法在当前JSP页面中有效, 它的生命周期是**从创建开始到服务器关闭**结束
    * **代码片段**创建的变量或方法, 也是在当前JSP页面中有效, 但它的生命周期是**页面关闭**后就会被销毁



****************************************************************************************



# 动作标识 [顶部](#目录)
### 1. 包含文件标识\<jsp:include\> [顶部](#目录)
> JSP的动作标识用于向当前页面中包含其他的文件  
> 被包含的文件可以是动态文件, 也可以是静态文件  

<br>

\<jsp:include\>标识对包含的动态文件和静态文件的处理方式是不同的
* 如畏被包含的是静态文件, 则页面执行后, 在使用了该标识的位置将会输出这个文件的内容
* 如果包含的是一个动态文件, 那么JSP编译器将编译并执行这个文件．\<jsp:include\>标识会识别出文件的类 型, 而不是通过文件的名称来判断该文件是静态的还是动态的

<br>

* **page**: 用于指定被包含文件的相对路径。例如, 指定属性值为top.jsp.则表示包含的是与当前JSP文件相同文件夹中的top.jsp文件包含到当前JSP页面中
* **flush**: 可选属性, 用于设置是否刷新缓冲区。默认值为false, 如果设置为true, 在当前页面输出使用了缓冲区的情况下, 先刷新缓冲区, 然后再执行包含工作
* **子动作标识\<jsp:param\>**: 用于向被包含的动态页面中传递参数
```
<jsp:include page="url" flush="true|false" />
```
```
<jsp:include page="url" flush="true|false">
    子动作标识<jsp:param>
</jsp:include>
```

<br>

include指令与文件标识\<jsp:include\>的区别
* **include指令**通过file属性指定被包含的文件, 且file属性不支持任何表达式. **文件标识\<jsp:include\>** 通过page属性指定被包含的文件, 且page属性支持JSP表达式
* 使用**include指令**时, 被包含的文件内容会原封不动地插人到包含页中, 然后JSP编译器再将合成后的文件最终编译成一个Java文件. 使用 **\<jsp:include\>** 动作标识包含文件时, 当该标识被执行时, 程序会将请求**转发**到被包含的页面, 并将执行结果输出到浏览器中, 然后返回包含页, 继续执行后面的代码. 因为服务器执行的是多个文件, 所以JSP编译器会分别对这些文件进行编译 
* **include指令**包含文件时, 由于被包含的文件最终会生成一个文件, 所以在被包含文件、包含文件中不能有重名的变量或方法. 而在使用 **\<jsp:include\>** 动作标识包含文件时, 由于每个文件是单独编泽的, 所以在被包含文件和包含文件中重名的变量和方法是不相冲突的

### 2. 请求转发标识\<jsp:forward\> [顶部](#目录)
> \<jsp:forward\>动作标识可以将请求转发到其他的Web资源. 例如，另一个JSP页面、HTML 页面、servlet等  
> 执行请求转发后，当前页面将不再被执行，而是去执行该标识指定的目标页面  
```
<jsp:forward page="url"/>
```
```
<jsp:forwardpage="url">
    子动作标识<jsp:param>
</jsp:forward>
```

### 3. 传递参数标识\<jsp:forward\> [顶部](#目录)
> 动作标识\<jsp: param\>可以作为其他标识的子标识，用于为其他标识传递参数
> 通过\<jsp: param\>动作标识指定的参数，将以"参数名=值"的形式加入到请求中，它的功能与在文件名后面直接加"？参数名: 参数值"是相同的
```
<jsp:param name="参数名" value="参数值" />
```
通过\<jsp: param\>标识为\<jsp: param\>标识指定参数，实现了在请求转发到modify.jsp页面的同时，传递了参数userld,其参数值为7, 可以使用下面的代码: 
```jsp
<jsp:forward page="modify.jsp">
    <jsp:paramname="userld" value="7"/>
</jspforward>
```