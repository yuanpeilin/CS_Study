# 目录
- [使用js](#使用js)
    - [script标签定义js代码](#script标签定义js代码)
    - [script标签引入js文件](#script标签引入js文件)
- [函数](#函数)
    - [无参函数](#无参函数)
    - [有参函数](#有参函数)
    - [带返回值的函数](#带返回值的函数)
    - [隐形参数](#隐形参数)
- [自定义对象](#自定义对象)
- [事件](#事件)
- [事件注册](#事件注册)
    - [静态注册](#静态注册)
    - [动态注册](#动态注册)



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 使用js
### script标签定义js代码
```html
<script type="text/javascript">
    alert("hello javaScript!");
</script>
```

### script标签引入js文件
```html
<script type="text/javascript" src="1.js"></script>
```



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 函数
js中函数不允许重载  

### 无参函数
```js
function fun(){
    alert("无参函数");
}
```
```js
var fun = function () {
    alert("无参函数");
}
```

### 有参函数
```js
function fun(a ,b) {
    alert("有参函数");
}
```

### 带返回值的函数
```js
function sum(num1,num2) {
    var result = num1 + num2;
    return result;
}
```

### 隐形参数
```js
function fun() {
    for (var i = 0; i < arguments.length; i++){
        alert( arguments[i] );
    }
}
fun(1,"ad",true);
```



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 自定义对象
```js
var myobj = new myobject();
myobj.name = "Bob";
myobj.age = 18;
myobj.nameage = function () {
    alert("姓名: " + this.name + " 年龄: " + this.age);
}
// 对象的访问
myobj.fun();
```
  
```js
var myobj = {
    name:"Bob",
    age:18,
    nameage : function () {
        alert("姓名: " + this.name + " 年龄: " + this.age);
    }
};
```



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 事件

Function | Description
:------- | :----------
onload   | 加载完成事件(页面初始化)
onclick  | 单击事件
onblur   | 失去焦点事件
onchange | 内容发生改变事件(下拉列表和输入框内容改变)
onsubmit | 表单提交事件



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 事件注册
### 静态注册
通过 html 标签的事件属性直接赋于事件响应后的代码  
```html
<head>
    <script type="text/javascript">
        function onloadFun() {
            alert('静态注册onload事件，所有代码');
        }
    </script>
</head>
<body onload="onloadFun();">
```
```html
<head>
    <script type="text/javascript">
        function onclickFun() {
            alert("静态注册onclick事件");
        }
    </script>
</head>
<body>
    <button onclick="onclickFun();">按钮</button>
</body>
```
```html
<head>
    <script type="text/javascript">
        function onblurFun() {
            console.log("静态注册失去焦点事件");
        }
    </script>
</head>
<body>
    用户名:<input type="text" onblur="onblurFun();">
</body>
```
```html
<head>
    <script type="text/javascript" >
        function onsubmitFun(){
            alert("静态注册表单提交事件----发现不合法");

            return flase;
        }
    </script>
</head>
<body>
    <form action="http://localhost:8080" method="get" onsubmit="return onsubmitFun();">
        <input type="submit" value="静态注册"/>
    </form>
</body>
```

### 动态注册
先通过 js 代码得到标签的dom对象, 然后再通过`dom对象.事件名 = function(){}`赋于事件响应后的代码  
```html
<head>
    <script type="text/javascript">
        // onload事件动态注册是固定写法
        window.onload = function () {
            alert("动态注册的onload事件");
        }
    </script>
</head>
```
```html
<head>
    <script type="text/javascript">
        window.onload = function () {
            var btnObj = document.getElementById("btn");
            btnObj.onclick = function () {
                alert("动态注册的onclick事件");
            }
        }
    </script>
</head>
<body>
    <button id="btn">按钮</button>
</body>
```
```html
<head>
    <script type="text/javascript">
        window.onload = function () {
           var passwordObj = document.getElementById("password");
            passwordObj.onblur = function () {
                console.log("动态注册失去焦点事件");
            }
        }
    </script>
</head>
<body>
    密码:<input id="password" type="text">
</body>
```
```html
<head>
    <script type="text/javascript" >
        window.onload = function () {
            var formObj = document.getElementById("form");
            formObj.onsubmit = function () {
                alert("动态注册表单提交事件----发现不合法");
                return false;
            }
        }
    </script>
</head>
<body>
    <form action="http://localhost:8080" id="form">
        <input type="submit" value="动态注册"/>
    </form>
</body>
```
