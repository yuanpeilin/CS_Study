# [flex布局](http://www.ruanyifeng.com/blog/2015/07/flex-grammar.html)
- [设置为flex布局](#设置为flex布局)
- [容器和项目](#容器和项目)
- [容器的属性](#容器的属性)
    - [justify-content](#justify-content)
    - [align-items](#align-items)
    - [flex-direction](#flex-direction)
    - [flex-wrap属性](#flex-wrap属性)
    - [align-content](#align-content)
- [项目的属性](#项目的属性)
    - [order属性](#order属性)
    - [flex-grow属性](#flex-grow属性)
    - [flex-shrink属性](#flex-shrink属性)
    - [flex-basis属性](#flex-basis属性)
    - [flex属性](#flex属性)
    - [align-self属性](#align-self属性)



***********************************************************************
***********************************************************************



# 设置为flex布局
```css
.box {
    display: flex;
}
```

# 容器和项目
采用Flex布局的元素, 称为Flex容器(flex container), 简称容器  
它的所有子元素自动成为容器成员, 称为Flex项目(flex item), 简称项目  

# 容器的属性
以下6个属性设置在容器上  
* justify-content
* align-items
* flex-direction
* flex-wrap
* flex-flow
* align-content

### justify-content
`justify-content`属性定义了项目在主轴上的对齐方式, 即水平对齐方式. 具体对齐方式与轴的方向有关(假设主轴为从左到右)  
* flex-start(默认): 左对齐(主轴的起点对齐)
* flex-end: 右对齐
* center: 居中
* space-between: 两端对齐, 项目之间的间隔都相等(紧贴边框)
* space-around: 每个项目两侧的间隔相等, 所以, 项目之间的间隔比项目与边框的间隔大一倍

```css
.box {
    justify-content: flex-start | flex-end | center | space-between | space-around;
}
```
![flex_justify_content.png](src/flex_justify_content.png)

### align-items
`align-items`属性定义项目在交叉轴上如何对齐, 即垂直对齐方式. 具体的对齐方式与交叉轴的方向有关(假设交叉轴从上到下)  
* stretch(默认): 如果项目未设置高度或设为auto, 将占满整个容器的高度
* flex-start: 交叉轴的起点对齐
* flex-end: 交叉轴的终点对齐
* center: 交叉轴的中点对齐
* baseline: 项目的第一行文字的基线对齐

```css
.box {
    align-items: flex-start | flex-end | center | baseline | stretch;
}
```
![flex_align_items.png](src/flex_align_items.png)

### flex-direction
`flex-direction`属性决定主轴的方向, 即项目的排列方向  
* row(默认值): 主轴为水平方向, 起点在左端
* row-reverse: 主轴为水平方向, 起点在右端
* column: 主轴为垂直方向, 起点在上沿
* column-reverse: 主轴为垂直方向, 起点在下沿

```css
.box {
    flex-direction: row | row-reverse | column | column-reverse;
}
```
![flex_flex_direction.png](src/flex_flex_direction.png)

### flex-wrap属性
`flex-wrap`属性定义, 如果一条轴线排不下, 如何换行  
* nowrap(默认): 不换行
* wrap: 换行, 第一行在上方
* wrap-reverse: 换行, 第一行在下方

```css
.box{
    flex-wrap: nowrap | wrap | wrap-reverse;
}
```

### align-content
`align-content`属性定义了多根轴线的对齐方式. 如果项目只有一根轴线, 该属性不起作用  
* stretch(默认): 轴线占满整个交叉轴
* flex-start: 与交叉轴的起点对齐
* flex-end: 与交叉轴的终点对齐
* center: 与交叉轴的中点对齐
* space-between: 与交叉轴两端对齐, 轴线之间的间隔平均分布
* space-around: 每根轴线两侧的间隔都相等. 所以, 轴线之间的间隔比轴线与边框的间隔大一倍

```css
.box {
    align-content: flex-start | flex-end | center | space-between | space-around | stretch;
}
```
![flex_align_content.png](src/flex_align_content.png)

# 项目的属性
以下6个属性设置在项目上
* order
* flex-grow
* flex-shrink
* flex-basis
* flex
* align-self

### order属性
order属性定义项目的排列顺序. 数值越小, 排列越靠前, 默认为0  
```css
.item {
    order: <integer>;
}
```

### flex-grow属性
flex-grow属性定义项目的放大比例, 默认为0, 即如果存在剩余空间, 也不放大  
如果所有项目的flex-grow属性都为1, 则它们将等分剩余空间(如果有的话)  
如果一个项目的flex-grow属性为2, 其他项目都为1, 则前者占据的剩余空间将比其他项多一倍  
```css
.item {
    flex-grow: <number>;
}
```

### flex-shrink属性
flex-shrink属性定义了项目的缩小比例, 默认为1, 即如果空间不足, 该项目将缩小  
如果所有项目的flex-shrink属性都为1, 当空间不足时, 都将等比例缩小  
如果一个项目的flex-shrink属性为0, 其他项目都为1, 则空间不足时, 前者不缩小  
```css
.item {
    flex-shrink: <number>;
}
```

### flex-basis属性
flex-basis属性定义了在分配多余空间之前, 项目占据的主轴空间(main size)  
浏览器根据这个属性, 计算主轴是否有多余空间. 它的默认值为auto, 即项目的本来大小  
它可以设为跟width或height属性一样的值(比如350px), 则项目将占据固定空间  
```css
.item {
    flex-basis: <length> | auto;
}
```

### flex属性
flex属性是flex-grow, flex-shrink 和 flex-basis的简写, 默认值为0 1 auto, 后两个属性可选  
该属性有两个快捷值: auto (1 1 auto) 和 none (0 0 auto)  
```css
.item {
    flex: flex-grow flex-shrink flex-basis
}
```

### align-self属性
align-self属性允许单个项目有与其他项目不一样的对齐方式, 可覆盖align-items属性. 默认值为auto, 表示继承父元素的[align-items](#align-items)属性, 如果没有父元素, 则等同于stretch
```css
.item {
    align-self: auto | flex-start | flex-end | center | baseline | stretch;
}
```
