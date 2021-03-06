### 主要组件
* 一个强大的python交互式shell 
* 供Jupyter notebooks使用的一个Jupyter内核(IPython notebook)

### 基本用法
* 使用 **`%run`** 命令运行脚本
* 使用 **`%timeit`** 命令快速测量时间
* 使用 **`%pdb`**命令快速debug

### Tab键自动补全
在shell中输入表达式时, 只要按下**Tab**, 当前命名空间中任何与输入的字符串相匹配的变量(对象或者函数等)就会被找出来

### 内省
* 在变量的前面或者后面加上一个问号 **`?`**, 就可以将有关该对象的一些**通用信息**显示出来, 这就叫做对象的内省
* 如果使用两个问号 **`??`** , 那么还可以显示出该方法的**源代码**
* 使用通配符字符串查找出所有与该通配符字符串相匹配的名称, 比如我们查找re模块下所有的包含find的函数
```py
In [6]: import re

In [7]: re.*find*?
re.findall 
re.finditer 
```

### %run
在ipython会话环境中, 所有文件都可以通过 **`%run`** 命令当做Python程序来**运行**, 输入`%run路径+python文件名`称即可

### 系统调用
* 调用系统**Shell命令**, 只需要在命令前加 **`!`** 即可

### 历史记录
* IPython把输入的历史记录存放在个人配置目录下的**history.sqlite**文件中

### 魔法函数 Magic Functions
* magic函数分两种: 一种是面向行的, 另一种是面向单元型的
* **行magic函数**是用前缀 **`%`** 标注的
* **单元型magic函数**是由两个 **`%%`** 做前缀的, 它的参数不仅是当前`%%`行后面的内容, 也包括了在当前行以下的行
