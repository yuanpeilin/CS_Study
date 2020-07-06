# 目录
- [使用css](#使用css)
    - [1. 行内样式](#1-行内样式)
    - [2. 链接](#2-链接)
- [常用样式](#常用样式)
- [选择器](#选择器)
    - [1. 标记选择器](#1-标记选择器)
    - [2. ID选择器](#2-id选择器)
    - [3. Class选择器](#3-class选择器)
    - [4. 组合选择器](#4-组合选择器)



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 使用css
### 1. 行内样式
```html
<p style="color:#700DDA;font-size:14px;"></p>
```
### 2. 链接
```html
<link rel="stylesheet" type="text/css" href="  ">
```


<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->


# 常用样式
* **`border: 1px yellow solid;`** 设置边框的粗细, 颜色, 样式
* **`margin-left: ; margin-right: ;`** div居中
* **`text-decoration: none;`** 超链接去掉下划线
* **`border-collapse: collapse;`** 表格合并边框


<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->


# 选择器
### 1. 标记选择器
> 会应用到页面中的所有标记
```css
a {
    font-size: 9px;
    color: #700DDA;
}
```
### 2. ID选择器
> 定义以#开头  
> 通过id属性使用
```css
#id001{
    color: blue;
    font-size: 30px;
    border: 1px yellow solid;
}
```
```html
<div id="id001">div标签1</div>
```
### 3. Class选择器
> 定义以.开头  
> 通过class属性使用
```css
.class01{
    color: blue;
    font-size: 30px;
    border: 1px solid yellow;
}
```
```html
<div class="class01">div标签class</div>
```
### 4. 组合选择器
```css
.class01 , #id01{
    color: blue;
    font-size: 20px;
    border:  yellow 1px solid;
}
```
