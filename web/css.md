* 常用样式
* 选择器

****************************************

# 常用样式
* **`border: 1px yellow solid;`** 设置边框的粗细, 颜色, 样式
* **`margin-left: auto; margin-right: auto;`** div居中
* **`text-decoration: none;`** 超链接去掉下划线
* **`border-collapse: collapse;`** 表格合并边框



# 选择器
#### 1. ID选择器
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
#### 2. Class选择器
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
#### 3. 组合选择器
```css
.class01 , #id01{
    color: blue;
    font-size: 20px;
    border:  yellow 1px solid;
}
```
