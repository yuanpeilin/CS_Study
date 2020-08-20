
### 文件
```
$ cat netstat.txt
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 0.0.0.0: 139             0.0.0.0: *               LISTEN
tcp        0      0 127.0.0.53: 53           0.0.0.0: *               LISTEN
tcp        0      0 0.0.0.0: 22              0.0.0.0: *               LISTEN
tcp        0      0 127.0.0.1: 631           0.0.0.0: *               LISTEN
tcp        0      0 0.0.0.0: 445             0.0.0.0: *               LISTEN
tcp        0     36 192.168.226.131: 22      192.168.226.1: 50944     ESTABLISHED
tcp        0      0 192.168.226.131: 22      192.168.226.1: 50942     ESTABLISHED
```

### 内置变量

变量 | 说明
:-- | :--
$0 | 当前记录(这个变量中存放着整个行的内容)
$1\~$n | 当前记录的第n个字段, 字段间由FS分隔
FILENAME | 当前输入文件的名字
FS | 输入字段分隔符 默认是空格或Tab
OFS | 输出字段分隔符,  默认也是空格
RS | 输入的记录分隔符,  默认为换行符
ORS | 输出的记录分隔符, 默认为换行符
NF | 当前记录中的字段个数, 就是有多少列
NR | 已经读出的记录数, 就是行号, 从1开始, 如果有多个文件话, 这个值也是不断累加中. 
FNR | 当前记录数, 与NR不同的是, 这个值会是各个文件自己的行号

```sh
# 显示指定列
awk '{print $1, $4}' netstat.txt
# 只显示最后一列
awk -F' ' '{print $NF}' test1

# 显示第一行 
awk 'NR==1' <filename>
# 不显示第一行
awk 'NR!=1' <filename>
# 显示最后一行
awk 'END{print $0}' <filename>

# 记录过滤
awk '$3>0' netstat.txt
# 加上表头
awk '$3==0 && $6=="LISTEN" || NR==1 ' netstat.txt
# 显示行号
awk '$3==0{print NR,$0}' netstat.txt
```
```sh
# 不显示最后一列
awk 'BEGIN{OFS="";ORS=""}{ for(i=1;i<NF;i++){print $i" "}{print "\n"} }' test1

# 以|做分隔符
awk -F' ' 'BEGIN{OFS="-";ORS="|"}{print $1,$2,$3}' test1

# 输出前两列并以--连接
# OFS=Output Fields Operator 给输出结果指定分隔符
awk -F' ' 'BEGIN{OFS="--"}{print $1,$2}' test1
```

### 函数
* **`toupper()`** 字符转为大写
* **`tolower()`** 字符转为小写
* **`length()`** 返回字符串长度
* **`substr()`** 返回子字符串
* **`sin()`** 正弦
* **`cos()`** 余弦
* **`sqrt()`** 平方根
* **`rand()`** 随机数
```sh
$ awk -F ': ' '{ print toupper($1) }' demo.txt  
```

### 条件
```sh
$ awk  -F  ': '  '/usr/ {print $1}'  demo.txt
上面代码中, print命令前面是一个正则表达式, 只输出包含usr的行. 

# 输出奇数行
$ awk -F ': ' 'NR % 2 == 1 {print $1}' demo.txt

# 输出第三行以后的行
$ awk -F ': ' 'NR >3 {print $1}' demo.txt

下面的例子输出第一个字段等于指定值的行. 
$ awk -F ': ' '$1 == "root" {print $1}' demo.txt
$ awk -F ': ' '$1 == "root" || $1 == "bin" {print $1}' demo.txt
```

### if语句
```sh
if结构还可以指定else部分. 
$ awk -F ': ' '{if ($1 > "m") print $1; else print "---"}' demo.txt
```