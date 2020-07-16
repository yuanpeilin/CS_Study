# 目录
- [使用css](#使用css)
    - [行内样式](#行内样式)
    - [style标签](#style标签)
    - [link标签链接](#link标签链接)
- [选择器](#选择器)
    - [标签选择器](#标签选择器)
    - [ID选择器](#id选择器)
    - [Class选择器](#class选择器)
    - [组合选择器](#组合选择器)
- [常用样式](#常用样式)



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 使用css
### 行内样式
```html
<p style="border: 1px yellow solid;"></p>
```

### style标签
在`<head>`标签中嵌入`<style>`标签  
```html
<style type='text/css'>
    a {}
</style>
```

### link标签链接
```html
<link rel="stylesheet" type="text/css" href=" ">
```



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 选择器
### 标签选择器
会应用到页面中的所有标签  
```css
a {
    font-size: 9px;
    color: #700DDA;
}
```

### ID选择器
定义以`#`开头, 通过`id`属性使用
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

### Class选择器
定义以`.`开头, 通过`class`属性使用
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

### 组合选择器
```css
.class01 , #id01{
    color: blue;
    font-size: 20px;
    border:  yellow 1px solid;
}
```



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 常用样式
* `border: 1px yellow solid;` 设置边框的粗细, 颜色, 样式
* `margin-left: auto; margin-right: auto;` div居中
* `text-decoration: none;` 超链接去掉下划线
* `border-collapse: collapse;` 表格合并边框
