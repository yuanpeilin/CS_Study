- [语法](#语法)
- [内置变量](#内置变量)
- [函数](#函数)
- [文件](#文件)
- [例子](#例子)



****************************************************************************************************



# 语法
- `-F` 指定字段分隔符, 不指定则默认空格或tab为分隔符

# 内置变量
假如一行有六个字段, `NF`结果为6, `$NF`才表示最后一个字段

变量     | 说明
-------- | ----
FILENAME | 当前输入文件的名字
$0       | 当前记录的内容
$1~$n    | 当前记录的第n个字段
FS       | 输入字段分隔符, 默认是空格或Tab
RS       | 输入的记录分隔符, 默认为换行符
OFS      | 输出字段分隔符, 默认也是空格
ORS      | 输出的记录分隔符, 默认为换行符
NF       | 当前记录中的字段个数, 就是有多少列
NR       | 已经读出的记录数, 就是行号
FNR      | 当前记录数, 与NR不同的是, 这个值会是各个文件自己的行号

# 函数
* **`toupper()`** 字符转为大写
* **`tolower()`** 字符转为小写
* **`length()`** 返回字符串长度
* **`substr()`** 返回子字符串
* **`sin()`** 正弦
* **`cos()`** 余弦
* **`sqrt()`** 平方根
* **`rand()`** 随机数

# 文件
```
cat file.txt
Proto Recv-Q Send-Q Local_Address           Foreign_Address         State
tcp        1      0 0.0.0.0:4369            0.1.0.0:*               LISTEN
tcp        2      0 127.0.0.1:5939          0.2.0.0:*               LISTEN
tcp        3      0 127.0.0.53:53           0.3.0.0:*               LISTEN
tcp        4      0 0.0.0.0:22              0.4.0.0:*               LISTEN
tcp        5      0 127.0.0.1:631           0.5.0.0:*               LISTEN
tcp        6      0 127.0.0.1:1080          0.6.0.0:*               LISTEN
tcp        7      0 0.0.0.0:25672           0.7.0.0:*               LISTEN
tcp        8      0 127.0.0.1:27017         0.8.0.0:*               LISTEN
```

# 例子
* 显示指定行和列
```sh
# 显示第一行
awk 'NR==1{print $0}' file.txt
awk 'NR==1' file.txt

# 不显示第一行
awk 'NR!=1{print $0}' file.txt
awk 'NR!=1' file.txt

# 只显示第二个字段大于3的行
awk '$2>3' file.txt

# 加上表头
awk '$2>3 || NR==1' file.txt

# 显示行号
awk '$2>3{print NR,$0}' file.txt
awk '{print NR ") " $0}' file.txt #原样输出要加双引号

# 显示最后一行
awk 'END{print $0}' file.txt

# 显示第一和第四列
awk '{print $1, $4}' file.txt

# 只显示最后一列
awk '{print $NF}' file.txt

# 只显示倒数第二列
awk '{print $(NF-1)}' file.txt
```

* 指定分隔符
```sh
# 输出前两列并以--连接
awk -F ' ' 'BEGIN{OFS="--"}{print $1,$2}' file.txt

# 以|做行分隔符
awk -F ' ' 'BEGIN{OFS="-";ORS="|"}{print $1,$2,$3}' file.txt
```

* 循环
```sh
# 不显示最后一列
awk 'BEGIN{OFS="";ORS=""}{ for(i=1;i<NF;i++){print $i" "}{print "\n"} }' file.txt
```

* 函数
```sh
awk -F ':' '{ print toupper($1) }' file.txt  
```

* 条件
```sh
# print命令前面是一个正则表达式, 只输出包含usr的行
awk  -F  ':'  '/usr/ {print $1}'  file.txt

# 输出奇数行
awk -F ':' 'NR % 2 == 1 {print $1}' file.txt

# 输出第三行以后的行
awk -F ':' 'NR >3 {print $1}' file.txt

# 下面的例子输出第一个字段等于指定值的行
awk -F ':' '$1 == "root" {print $1}' file.txt
awk -F ':' '$1 == "root" || $1 == "bin" {print $1}' file.txt
```

* if语句
```sh
# 输出第一个字段的第一个字符大于m的行
awk -F ':' '{if ($1 > "m") print $1; else print "---"}' file.txt
```

* 使用shell变量
```sh
# 将shell变量变成了awk变量
line=2
awk -v aline="$line" 'NR==aline{print $0}' file.txt
awk 'NR=="'$line'"{print $0}' file.txt
```
