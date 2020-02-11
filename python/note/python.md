# 目录
* [Hello World](#user-content-hello-world-顶部)
* [标识符](#user-content-标识符-顶部)
* [多行语句](#user-content-多行语句-顶部)
* [关键字](#user-content-关键字-顶部)
* [注释](#user-content-注释-顶部)
* [输入](#user-content-输入-顶部)
* [输出](#user-content-输出-顶部)
* 数据类型
    * [数字](#user-content-数字-顶部)
    * [字符串](#user-content-字符串-顶部)
    * [列表](#user-content-列表-顶部)
    * [元组](#user-content-元组-顶部)
    * [字典](#user-content-字典-顶部)
* [进制](#user-content-进制-顶部)
* [类型转化](#user-content-类型转化-顶部)
* [类型判断](#user-content-类型判断-顶部)
* [运算符](#user-content-运算符-顶部)
* 分支控制
    * [if](#user-content-if-顶部)
    * [while](#user-content-while-顶部)
    * [for](#user-content-for-顶部)
* [函数](#user-content-函数-顶部)

# 正文
### Hello World [`顶部`](#user-content-目录)
* **`#!/usr/bin/python`** 告诉操作系统执行脚本调用/usr/bin下的python解释器, 相当于写死了 python 路径
* **`#!/usr/bin/env python`** 为了防止用户没有将python装在默认的/usr/bin路径里. 首先会到env设置里查找python的安装路径, 再调用对应路径下的解释器程序完成操作, 可以增强代码的可移植性
```py
#!/usr/bin/python3

print("Hello, World!")
```

### 标识符 [`顶部`](#user-content-目录)
* 以单下划线开头 **`_foo`** 的代表不能直接访问的类属性, 需通过类提供的接口进行访问, 不能用`from xxx import *`而导入
* 以双下划线开头的 **`__foo`** 代表类的私有成员
* 以双下划线开头和结尾的 **`__foo__`** 代表Python里特殊方法专用的标识, 如`__init__()`代表类的构造函数

### 多行语句 [`顶部`](#user-content-目录)
* Python语句中一般以新行作为语句的结束符, 但是可以使用斜杠 **`\`** 将一行的语句分为多行显示
```py
total = item_one + \
        item_two + \
        item_three
```
* 语句中包含 **`[]`** **`{}`** **`()`** 括号就不需要使用多行连接符
```py
days = ['Monday', 'Tuesday', 'Wednesday',
        'Thursday', 'Friday']
```
* Python可以使用引号 **`'`** , 双引号 **`"`** , 三引号 **`'''`** 或 **`"""`** 来表示字符串. 其中三引号可以由多行组成
```py
word = 'word'
sentence = "这是一个句子。"
paragraph = """这是一个段落。
包含了多个语句"""
```

### 关键字 [`顶部`](#user-content-目录)
* 所有 Python 的关键字只包含小写字母
-|-|- 
 :--: | :--: | :--:
and | exec | not
assert | finally | or
break | for | pass
class | from | print
continue | global | raise
def | if | return
del | import | try
elif | in | while
else | is | with
except | lambda | yield

### 注释 [`顶部`](#user-content-目录)
* python中单行注释采用 **`#`** 开头, 注释可以在语句或表达式行末
```py
#!/usr/bin/python

# 第一个注释
print "Hello, Python!"  # 第二个注释
```
* 多行注释使用三个单引号 **`'''`** 或三个双引号 **`"""`**
```py
#!/usr/bin/python

'''
这是多行注释，使用单引号。
这是多行注释，使用单引号。
这是多行注释，使用单引号。
'''

"""
这是多行注释，使用双引号。
这是多行注释，使用双引号。
这是多行注释，使用双引号。
"""
```

### 输入 [`顶部`](#user-content-目录)
* 执行后就会等待用户输入, 按回车键后就会退出
```py
#!/usr/bin/python

raw_input("按下 enter 键退出，其他任意键显示...\n")
```

### 输出 [`顶部`](#user-content-目录)
* **`print`** 默认输出是换行的, 如果要实现不换行需要在变量末尾加上逗号
```py
#!/usr/bin/python

x="a"
y="b"

# 换行输出
print x
print y

# 不换行输出
print x,
print y,

# 不换行输出
print x,y
```

### 数字 [`顶部`](#user-content-目录)
* Python支持四种不同的数字类型
	* int 有符号整型, 也可以代表八进制和十六进制
	* long 长整型, 长整型可以使用小写 **`l`** 和大写 **`L`** 
	* float 浮点型
	* complex 复数, 复数由实数部分和虚数部分构成, 可以用 **`a + bj`** , 或者 **`complex(a,b)`** 表示, 复数的实部a和虚部b都是浮点型
* 一些整形的实例: `10` `0x69` `-0x260` `0122L` `15.20 ` `-90.` `70.2E-12` `3.14j` `9.322e-36j`

### 字符串 [`顶部`](#user-content-目录)
* 从左到右索引默认0开始的, 最大范围是字符串长度少1
* 从右到左索引默认-1开始的, 最大范围是字符串开头

    s  |  t |  r |  i |  n |  g
    :--: | :--: | :--: | :--: | :--: | :--: 
    0  |  1 |  2 |  3 |  4 |  5 
    -6 | -5 | -4 | -3 | -2 | -1

* 如果要从字符串中 **截取子字符串** 的话, 可以使用 **`[头下标:尾下标]`** 来截取相应的字符串
* 获取的子字符串 **包含** 头下标的字符, 但 **不包含** 尾下标的字符
* 下标可以是正数或负数
* 下标可以为空表示取到头或尾
* 只用一个下标表示第i个字符
```py
str="string"
print(str[1:3]) # tr
print(str[-3:-1]) # in
print(str[1:]) # tring
print(str[:3]) # str
print(str[1]) # t
```

### 列表 [`顶部`](#user-content-目录)
* 列表支持字符, 数字, 字符串甚至可以包含列表(即嵌套)
* 列表用 **`[ ]`** 标识, 是python最通用的复合数据类型
* 列表中值的切割也可以用到变量`[头下标:尾下标]`就可以截取相应的列表
```py
list=['a','b','c','d','e']
print(list[1:3]) # ['b', 'c']
print(list[1:]) # ['b', 'c', 'd', 'e']
print(list[:3]) # ['a', 'b', 'c']
print(list[:]) # ['a', 'b', 'c', 'd', 'e']
print(list[0]) # a
```
* 用 **`append()`** 方法来添加列表项. 用 **`del`** 语句来删除列表的元素
```py
list=[]
list.append('Google')
list.append('Runoob')
print(list) # ['Google', 'Runoob']

del list[1]
print(list) # ['Google']
```

函数 | 功能
:--: | :--:
**`len(list)`** | 列表元素个数
**`max(list)`** | 返回列表元素最大值
**`min(list)`** | 返回列表元素最小值
**`list(seq)`** | 将元组转换为列表
**`list.append(obj)`** | 在列表末尾添加新的对象
**`list.count(obj)`** | 统计某个元素在列表中出现的次数
**`list.index(obj)`** | 从列表中找出某个值第一个匹配项的索引位置
**`list.remove(obj)`** | 移除列表中某个值的第一个匹配项

### 元组 [`顶部`](#user-content-目录)
* 元组用 **`()`** 标识. 内部元素用逗号隔开. 但是元组不能二次赋值, 相当于只读列表
```py
tuple = ( 'runoob', 786 , 2.23, 'john', 70.2 )
tinytuple = (123, 'john')
```
```py
#!/usr/bin/python
 
tuple = ( 'runoob', 786 , 2.23, 'john', 70.2 )
list = [ 'runoob', 786 , 2.23, 'john', 70.2 ]
tuple[2] = 1000    # 元组中是非法应用
list[2] = 1000     # 列表中是合法应用
```

函数 | 功能
:--: | :--:
**`len(tuple)`** | 计算元组元素个数
**`max(tuple)`** | 返回元组中元素最大值
**`min(tuple)`** | 返回元组中元素最小值
**`tuple(seq)`** | 将列表转换为元组

### 字典 [`顶部`](#user-content-目录)
* 列表是有序的对象集合，字典是无序的对象集合. 两者之间的区别在于: 字典当中的元素是通过键来存取的, 而不是通过偏移存取
* 字典用 **`{ }`** 标识. 字典由索引key和它对应的值value组成
```py
dict = {'name': 'john', 'code': 6734, 'dept': 'sales'}
```
```py
dictionary = {}
dictionary['one'] = "this is one"
dictionary[2] = "this is two"

print(dictionary) # {'one': 'this is one', 2: 'this is two'}
print(dictionary.keys()) # dict_keys(['one', 2])
print(dictionary.values()) # dict_values(['this is one', 'this is two'])
print(dictionary["one"]) # this is one
print(dictionary[2]) # this is two
```

### 进制 [`顶部`](#user-content-目录)
* **binary** 二进制 
* **octal** 八进制
* **decimal** 十进制
* **hexadecimal** 十六进制

### 类型转化 [`顶部`](#user-content-目录)
函数 | 描述 
:--: | :--: 
int(x [,base])        | 将base进制的x转换为一个整数
float(x)              | 将x转换到一个浮点数
bin(x)                | 将一个整数转换为一个二进制字符串
oct(x)                | 将一个整数转换为一个八进制字符串
hex(x)                | 将一个整数转换为一个十六进制字符串
complex(real [,imag]) | 创建一个复数
str(x)                | 将对象 x 转换为字符串
repr(x)               | 将对象 x 转换为表达式字符串
eval(str)             | 用来计算在字符串中的有效Python表达式,并返回一个对象
tuple(s)              | 将序列 s 转换为一个元组
list(s)               | 将序列 s 转换为一个列表
set(s)                | 转换为可变集合
dict(d)               | 创建一个字典。d 必须是一个序列 (key,value)元组。
frozenset(s)          | 转换为不可变集合
chr(x)                | 将一个整数转换为一个字符
unichr(x)             | 将一个整数转换为Unicode字符
ord(x)                | 将一个字符转换为它的整数值

```py
print(int(3.6)) #3
print(int('1000',2)) #8
print(int('1a',16)) #26
print(bin(1024)) #0b1000000000
print(oct(1024)) #0o2000
print(hex(1024)) #0x400
```

### 类型判断 [`顶部`](#user-content-目录)
* python的所有数据类型都是类, 可以通过 **`type()`** 查看该变量的数据类型
```py
n=1
print(type(n)) # <class 'int'>
str='123'
print(type(str)) # <class 'str'>
```

### 运算符 [`顶部`](#user-content-目录)
* **`<>`** 不等于
* **`//`** 向下取整
* **`**`** 幂运算
* **`and`** 与
* **`or`** 或
* **`not`** 非
* **`in`** 在字符串, 元组, 列表中
```py
a=1
b=10
list=[10,20,30]
if b in list :
    print('in')
else:
    print('not in')
```
* **`is`** 判断两个变量是否在同一块内存空间
* **`==`** 判断两个变量值是否相等


### if [`顶部`](#user-content-目录)
```py
if 判断条件：
    执行语句……
else：
    执行语句……
#################################################
if 判断条件1:
    执行语句1……
elif 判断条件2:
    执行语句2……
......
else:
    执行语句3……
```

### while [`顶部`](#user-content-目录)
```py
while 判断条件：
    执行语句……
```
```py
count = 0
while count < 5:
   print count, " is  less than 5"
   count = count + 1
else:
   print count, " is not less than 5"
```

### for [`顶部`](#user-content-目录)
```py
for iterating_var in sequence:
   statements(s)
```
```py
for letter in 'Python':
    print '当前字母 :', letter
##################################################### 
fruits = ['banana', 'apple',  'mango']
for fruit in fruits:        # 第二个实例
    print '当前水果 :', fruit
#####################################################
fruits = ['banana', 'apple',  'mango']
for index in range(len(fruits)):
    print(fruits[index], index)
```

### 函数 [`顶部`](#user-content-目录)
* 函数代码块以 **`def`** 关键词开头, 后接函数标识符名称和圆括号()
* 函数内容以冒号起始, 并且缩进
* **`return [表达式]`** 结束函数, 选择性地返回一个值给调用方. 不带表达式的return相当于返回`None`
```py
def printme( str ):
   print (str)
   return

print(printme("test"),'test')
# test
# None test
```
* **不定长参数:**加了星号`*`的变量名会存放所有未命名的变量参数
```py
def printinfo( arg1, *vartuple ):
   print arg1
   for var in vartuple:
      print var
   return;

printinfo( 10 ); # 10
printinfo( 70, 60, 50 ); # 70 60 50
```

