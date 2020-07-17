# 目录
- [document对象的三个方法](#document对象的三个方法)
    - [getElementById()](#getelementbyid)
    - [getElementsByName()](#getelementsbyname)
    - [getElementsByTagName()](#getelementsbytagname)
- [DOM对象的常用方法与属性](#dom对象的常用方法与属性)



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# document对象的三个方法
### getElementById()
`document.getElementById()` 通过标签的 **id** 属性获取对象  
`DOM对象.innerHTML` 表示DOM元素闭包之间的内容  
```html
<head>
    <script type="text/javascript" >
        function onclickFun() {
            var usernameObj = document.getElementById("username");
            var usernameText = usernameObj.value;
            var patt = /^\w{5,12}$/;
            var usernameSpanObj = document.getElementById("usernameSpan");
            if (patt.test(usernameText)) {
                usernameSpanObj.innerHTML = "用户名合法！";
            } else {
                usernameSpanObj.innerHTML = "用户名不合法！";
            }
        }
    </script>
</head>
<body>
    用户名：<input type="text" id="username" value="wzg"/>
    <span id="usernameSpan" style="color:red;">

    </span>
    <button onclick="onclickFun()">较验</button>
</body>
```

### getElementsByName()
`document.getElementsByName()` 通过标签的 **name** 属性获取对象数组  
```html
<head>
    <script type="text/javascript">
        function checkAll() {
            var hobbies = document.getElementsByName("hobby");
            for (var i = 0; i < hobbies.length; i++){
                hobbies[i].checked = true;
            }
        }
        function checkNo() {
            var hobbies = document.getElementsByName("hobby");
            for (var i = 0; i < hobbies.length; i++){
                hobbies[i].checked = false;
            }
        }
        function checkReverse() {
            var hobbies = document.getElementsByName("hobby");
            for (var i = 0; i < hobbies.length; i++) {
                hobbies[i].checked = !hobbies[i].checked;
            }
        }
    </script>
</head>
<body>
    <input type="checkbox" name="hobby" value="cpp" checked="checked">C++
    <input type="checkbox" name="hobby" value="java">Java
    <input type="checkbox" name="hobby" value="js">JavaScript
    <button onclick="checkAll()">全选</button>
    <button onclick="checkNo()">全不选</button>
    <button onclick="checkReverse()">反选</button>
</body>
```

### getElementsByTagName()
`document.getElementsByTagName()` 通过 **标签名** 属性获取对象数组  
```html
<head>
    <script type="text/javascript">
        function checkAll() {
            var inputs = document.getElementsByTagName("input");
            for (var i = 0; i < inputs.length; i++){
                inputs[i].checked = true;
            }
        }
    </script>
</head>
<body>
    兴趣爱好：
    <input type="checkbox" value="cpp" checked="checked">C++
    <input type="checkbox" value="java">Java
    <input type="checkbox" value="js">JavaScript
    <button onclick="checkAll()">全选</button>
</body>
```



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# DOM对象的常用方法与属性
* `DOM对象.appendChild(ChildNode)` 添加一个子节点
* `DOM对象.getElementsByTagName()` 获取当前节点的指定标签名孩子节点
* `DOM对象.childNodes` 获取当前节点的所有子节点
* `DOM对象.firstChild` 获取当前节点的第一个子节点
* `DOM对象.lastChild` 获取当前节点的最后一个子节点
* `DOM对象.parentNode` 获取当前节点的父节点
* `DOM对象.nextSibling` 获取当前节点的下一个节点
* `DOM对象.previousSibling` 获取当前节点的上一个节点
* `DOM对象.className` 用于获取标签的class属性的值
* `DOM对象.innerHTML` DOM对象表示的标签闭包之间的内容
* `DOM对象.innerText` DOM对象表示的标签闭包之间的文本
