# 目录



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 核心函数$()
### 传入参数为 函数
表示页面加载完成之后, 相当于`window.onload = function(){}`  
```html
<title>Insert title here</title>
	<script type="text/javascript" src="jquery-1.7.2.js"></script>
	<script type="text/javascript">
		$(function () {
			var $btnObj = $("#btnId");
			$btnObj.click(function () {
				alert("jQuery 的单击事件");
			});
		});
	</script>
</head>
<body>
	<button id="btnId">SayHello</button>
</body>
```

### 传入参数为 HTML字符串
会创建这个html标签对象  
```html
<head>
    <script type="text/javascript" src="jquery-1.7.2.js"></script>
    <script type="text/javascript">
        $(function () {
            $("<div> <span>div-span1</span> <span>div-span2</span> </div>").appendTo("body");
        });
    </script>
</head>
<body>
</body>
```

### 传入参数为 选择器字符串
* `$("#id属性值");` id选择器, 根据id属性查询标签对象  
* `$("标签名");` 标签名选择器, 根据指定的标签名查询标签对象  
* `$(".class属性值");` 类型选择器, 根据class属性查询标签对象  

### 传入参数为 DOM对象
会把这个dom对象转换为jQuery对象  
```html
<head>
    <script type="text/javascript" src="jquery-1.7.2.js"></script>
    <script type="text/javascript">
        $(function () {
            var btnObj = document.getElementById("btn01");
            alert( $(btnObj) );
        });
    </script>
</head>
<body>
    <button id="btn01">按钮1</button>
</body>
```



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 选择器
### 基本选择器

SELECTOR  | DESCRIPTION
:-------- | :----------
`#id`     | 根据id属性匹配
`标签名`  | 根据标签名匹配
`.class`  | 根据class属性匹配
`*`       | 所有标签

### 层级选择器

SELECTOR              | DESCRIPTION
:-------------------- | :----------
`ancestor descendant` | 在给定的祖先标签下匹配所有的后代标签
`parent > child`      | 在给定的父标签下匹配所有的子标签(父子即相邻一代)
`prev + next`         | 匹配紧跟在prev标签后所有的next标签
`prev ~ siblings`     | 匹配所有在prev标签后所有的siblings标签

```js
$("body div");
$("body > div");
$("#one + div");
$("#two ~ div");
```
 
### 基本过滤选择器

SELECTOR         | DESCRIPTION
:--------------- | :----------
`:first`         | 获取第一个元素
`:last`          | 获取匹配的最后一个元素
`:not(selector)` | 去除所有与给定选择器匹配的元素
`:even`          | 匹配所有索引值为偶数的元素, 从0开始计数
`:odd`           | 匹配所有索引值为奇数的元素, 从0开始计数
`:eq(index)`     | 匹配一个给定索引值的元素
`:gt(index)`     | 匹配所有大于给定索引值的元素
`:lt(index)`     | 匹配所有小于给定索引值的元素
`:header`        | 匹配如 h1, h2, h3之类的标题元素
`:animated`      | 匹配所有正在执行动画效果的元素
`:focus`         | 触发每一个匹配元素的focus事件

```js
$("div:first");
$("div:last");
$("div:not(.one)");
$("div:even");
$("div:odd");
$("div:gt(3)");
$("div:eq(3)");
$("div:lt(3)");
$(":header");
$(":animated");
$("div:not(:animated):last");
```

### 内容过滤选择器

SELECTOR          | DESCRIPTION
:---------------- | :----------
`:contains(text)` | 匹配包含给定文本的元素
`:empty`          | 匹配所有不包含子元素或者文本的空元素
`:has(selector)`  | 匹配含有选择器所匹配的元素的元素
`:parent`         | 匹配含有子元素或者文本的元素

```js
$("div:contains('di')");
$("div:empty");
$("div:has(.mini)");
$("div:parent");
```

### 属性过滤选择器

SELECTOR                  | DESCRIPTION
:------------------------ | :----------
`[attribute]`             | 匹配包含给定属性的元素
`[attribute=value]`       | 匹配给定的属性是某个特定值的元素
`[attribute!=value]`      | 匹配所有不含有指定的属性, 或者属性不等于特定值的元素
`[attribute^=value]`      | 匹配给定的属性是以某些值开始的元素
`[attribute$=value]`      | 匹配给定的属性是以某些值结尾的元素
`[attribute*=value]`      | 匹配给定的属性是以包含某些值的元素
`[attrSel1]...[attrSelN]` | 复合属性选择器, 需要同时满足多个条件时使用

```js
$("div[title]");
$("div[title='test']");
$("div[title!='test']");
$("div[title^='te']");
$("div[title$='est']");
$("div[title*='es']");
$("div[id][title*='es']");
```

### 表单过滤选择器

SELECTOR    | DESCRIPTION
:---------- | :----------
`:input`    | 匹配所有 input, textarea, select 和 button 元素
`:text`     | 匹配所有的单行文本框
`:password` | 匹配所有密码框
`:radio`    | 匹配所有单选按钮
`:checkbox` | 匹配所有复选框
`:submit`   | 匹配所有提交按钮
`:image`    | 匹配所有图像域
`:reset`    | 匹配所有重置按钮
`:button`   | 匹配所有按钮
`:file`     | 匹配所有文件域
`:hidden`   | 匹配所有不可见元素, 或者type为hidden的元素

### 表单对象过滤选择器

SELECTOR    | DESCRIPTION
:---------- | :----------
`:enabled`  | 匹配所有可用元素
`:disabled` | 匹配所有不可用元素
`:checked`  | 匹配所有选中的被选中元素(复选框、单选框等, 不包括select中的option)
`:selected` | 匹配所有选中的option元素

```js
$(":text:enabled");
$(":text:disabled");
$(":checkbox:checked");
$(":checkbox:checked");
$("select option:selected");
```



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 元素筛选
### 过滤

FUNCTION        | DESCRIPTION
:-------------- | :----------
eq(index)       | 获取第N个元素
first()         | 获取第一个元素
last()          | 获取最后一个元素
filter(exp)     | 留下匹配的元素
is(exp)         | 判断是否匹配给定的选择器, 只要有一个匹配就返回true
has(exp)        | 返回包含有匹配选择器的元素的元素
not(exp)        | 删除匹配选择器的元素

```js
$("div").eq(3);
$("div").first();
$("div").last();
$("div").filter(":even");
$("#one").is(":empty");
$("div").has(".mini");
$("div").not('.one');
```

### 查找

FUNCTION       | DESCRIPTION
:------------- | :----------
children(exp)  | 返回匹配给定选择器的子元素
find(exp)      | 返回匹配给定选择器的后代元素
next(exp)      | 返回当前元素的下一个兄弟元素
nextall(exp)   | 返回当前元素后面所有的兄弟元素
nextUntil(exp) | 返回当前元素到指定匹配的元素为止的后面元素
parent()       | 返回父元素
prev(exp)      | 返回当前元素的上一个兄弟元素
prevall(exp)   | 返回当前元素的上一个兄弟元素
prevUntil(exp) | 返回当前元素到指定匹配的元素为止的前面元素
siblings(exp)  | 返回所有兄弟元素

```js
$("body").children("div.one");
$("body").find("div.mini");
$("#one").next("div");
$("#one").nextAll("span");
$("#one").nextUntil("span");
$(".mini").parent();
$("#two").prev("div");
$("span").prevAll("div");
$("span").prevUntil("#one");
$("#two").siblings();
```

### 串联

FUNCTION | DESCRIPTION
:------- | :----------
add()    | 把 add 匹配的选择器的元素添加到当前 jquery 对象中

```js
$("span").add("#two").add("#one");
```



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 属性
`html()` | 设置和获取起始标签和结束标签中的内容. 跟dom对象的innerHTML属性一样
`text()` | 设置和获取起始标签和结束标签中的文本. 跟dom对象的innerText属性一样
`val()`  | 设置和获取表单项的value属性值. 跟dom属性value一样
`attr()` | 设置和获取属性的值, 不推荐操作checked、readOnly、selected、disabled
`prop()` | 设置和获取属性的值, 只推荐操作checked、readOnly、selected、disabled

```js
// 不传参数是获取; 传递参数是设置
$("div").html();
$("div").html("<h1>我是div中的标题 1</h1>");
$("div").text();
$("div").text("<h1>我是div中的标题 1</h1>");
$("#username").val();
$("#username").val("超级程序猿");

// 批量操作单选
$(":radio").val(["radio2"]);
$(":checkbox").val(["checkbox3","checkbox2"]);
$("#multiple").val(["mul2","mul3","mul4"]);
$("#single").prop();
```



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# crud操作

FUNCTION            | DESCRIPTION
:------------------ | :----------
`a.appendTo(b)`     | 把a插入到b子元素末尾, 成为最后一个子元素(a为b子元素)
`a.prependTo(b)`    | 把a插到b所有子元素前面, 成为第一个子元素(a为b子元素)
`a.insertAfter(b)`  | 把a插入到b元素后面(ab为同级)
`a.insertBefore(b)` | 把a插到b元素前面(ab为同级)
`a.replaceWith(b)`  | 用b替换掉 a
`a.replaceAll(b)`   | 用a替换掉所有b
`a.remove()`        | 删除a标签
`a.empty()`         | 清空a标签里的内容

```js
$("<h1>标题</h1>").prependTo( $("div") );
$("<h1>标题</h1>").insertAfter("div");
$("<h1>标题</h1>").insertBefore( $("div") );
$("div").replaceWith( $("<h1>标题</h1>") );
$("<h1>标题</h1>").replaceAll( "div" );
$("div").empty();
```
