# 目录
* 1



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->

# 分支控制循环
### if
`if`和`then`在同一行的话, 判断条件后要加一个分号

##### 语法
```sh
if condition1 then
    command1
elif condition2 then
    command2
else
    commandN
fi
```
##### 例子
```sh
#!/bin/bash
read -p "input number " input
if [ $input -lt 0 ]; then
    echo 'Positive number'
elif [ $input -gt 0 ]; then
    echo 'negative number'
else
    echo 'zero'
fi
```

### for
##### 语法
```sh
for var in item1 item2 ... itemN
do
    command1
    command2
    ...
    commandN
done
```

##### 例子
```sh
#!/bin/bash
for TIME in "Morning" "Noon" "Evening"
do
    echo "The $TIME of the day."
done
```

### while
##### 语法
```sh
while condition
do
    command
done
```

##### 例子
```sh
#!/bin/bash
num=1
while [ $num -lt 10 ]
do
    echo $num
    num=`expr $num + 1`
done
```
```sh
#!/bin/bash
# 批量增加20个用户并设置密码
declare –i num=1
while [ $num -le 20 ]
do
    useradd stu$num
    echo "123456" | passwd --stdin stu$num &> /dev/null
    num=`expr $num + 1`
done
```

### case
##### 语法
```sh
case variable in
pattern1)
    command1
    command2
    ...
    commandN
    ;;
pattern2）
    command1
    command2
    ...
    commandN
    ;;
*)
    command
    ;;
esac
```

##### 例子
```sh
#!/bin/bash
read -p "Press a character " KEY
case $KEY in
[a-z]|[A-Z])
    echo "It's a letter."
    ;;
[0-9])
    echo "It's a digit."
    ;;
*)
    echo "It's a symbol."
esac
```

### select
##### 语法
```sh
select variable in [list]
do
    command
done
```

##### 例子
```sh
#!/bin/bash
select var in "dog" "cat" "bee"
do
    echo "you like $var"
    break
done
```



# 存在性测试

表达式           | 存在且非null | 值为null             | 不存在               | 意图
:--             | :--        | :--                 | :--                  | :-- 
${var-value}    | 返回var     | 返回var              | 返回value            | 测存在性, 不测空值
${var:-value}   | 返回var     | 返回value            | 返回value            | 变量未定义或不存在, 则返回一个默认值
${var:=value}   | 返回var     | 将var值置为value且返回 | 将var值置为value且返回 | 变量未定义或不存在, 则为变量设置默认值
${var:?message} | 返回var     | 返回message并退出脚本  | 返回message并退出脚本  | 捕获未定义变量造成的异常
${var:+value}   | 返回value   | 返回null             | 返回null             | 修改一个已存在变量的值

```sh
# !/bin/bash

name=${ 1:? requires an argument }
echo Hello $name
```
```sh
[root@localhost ~]# checker
requires an argument
[root@localhost ~]# checker  jerry
Hello jerry
```

# 切割字符串

表达式 | 说明
:--  | :--
${string:offset} | 初始位置为0, 从offset开始切割, 直至字符串结束
${string:offset:length} | 从offset开始, 长度为length

```sh
filename=/etc/apache2
echo ${filename:1:3} # etc
echo ${filename:5} # apache2
```

# 模式匹配

表达式                | 说明
:--                  | :--
${variable#pattern}  | 从变量头部开始, 删除最短的匹配部分, 并返回其余部分
${variable##pattern} | 从变量头部开始, 删除最长的匹配部分, 并返回其余部分
${variable%pattern}  | 从变量尾部开始, 删除最短的匹配部分, 并返回其余部分
${variable%%pattern} | 从变量尾部开始, 删除最长的匹配部分, 并返回其余部分





Shell变量的种类
用户自定义变量:由用户自己定义、修改和使用
环境变量:由系统维护, 用于设置用户的Shell工作环境, 只有极少数的变量用户可以修改
预定义变量:Bash预定义的特殊变量, 不能直接修改
位置变量:通过命令行给程序传递执行参数

变量的赋值与引用
使用双引号时, 允许在双引号的范围内使用“$”符号引用其他变量的值（变量引用） 
使用单引号时, 将不允许在单引号的范围内引用其他变量的值, “$”符号或者其他任何符号将作为普通字符看待
使用反撇号时, 允许将执行特定命令的输出结果赋值给变量（命令替换）
反撇号中的内容要求是可执行的命令, 需要嵌套使用时, 可以将反撇号改为 $( ... ) 的形式

双引号 “ ” :允许通过$符号引用其他变量值. 除 ' \ $ 外
单引号 ‘ ’ :禁止引用其他变量值, $视为普通字符
反撇号 \` \` :将命令执行的结果输出给变量

单引号
被单引号引用的任何字符都不会被shell解释. 
不管引号中包含了多少空格, shell都将它们保留.  
即使是回车键, 如果把它括在单引号内, shell也会把它忽略

可以用双引号来对shell隐藏单引号, 反之亦然

```sh
$ echo "<<< echo \$x >>> displays the value of x, which is $x”
$ echo '<<< echo $x >>> displays the value of x, which is' $x
$ echo ‘<<< echo $x >>> displays the value of x, which is’ “$x”
```

设置变量的作用范围 export  变量名=变量值  
清除用户定义的变量
格式:unset   变量名

计算整数表达式的运算结果
格式:expr  变量1   运算符  变量2  ...[运算符 变量n]
expr的常用运算符
加法运算:+
减法运算: -
乘法运算: \*
除法运算: /
求模（取余）%

位置变量
表示为 $n, n为1\~9之间的数字
当执行“service network restart”命令行时, 第1个位置参数用“$1”表示, 对应的值为“network”, 第2个位置参数用“$2”表示, 对应的值为“restart”
当用户输入的位置参数超过9个时, 位置变量 $9 将自动包含最后部分的所有字符串（即使有空格分隔）

特殊变量 作用说明
$0 获取当前执行的Shell脚本的文件名, 如果执行脚本包含了路径, 那么就包括脚本路径
$n 获取当前执行的Shell脚本的第n个参数值, n=1..9, 当n为0时表示脚本的文件名；如果n大于9, 则用大括号括起来, 例如${10}, 接的参数以空格隔开
$# 获取当前执行的Shell脚本后面接的参数的总个数
$\* 获取当前Shell脚本所有传参的参数, 不加引号和$@相同；如果给$\*加上双引号, 例如:”$\*”, 则表示将所有的参数视为单个字符串, 相当于”$1 $2 $3”
$@ 获取当前Shell脚本所有传参的参数, 不加引号和$\*相同；如果给$@加上双引号, 例如:”$@”, 则表示将所有的参数视为不同的独立字符串, 相当于”$1” “$2” “$3” “…”. 这是将多参数传递给其他程序的最佳方式, 因为它会保留所有的内嵌在每个参数里的任何空白. 当”$@”和”$\*”都加双引号, 两者是有区别的；都不加双引号时, 两者无区别
$#:命令行中位置参数的个数
$\*:所有位置参数的内容
$?:上一条命令执行后返回的状态, 当返回状态值为0时表示执行正常, 非0值表示执行异常或出错
$$:当前所在进程的进程号
$!:后台运行的最后一个进程号

# shift
若脚本参数多于9个, 就需要通过shift函数, 让第一个参数出队, 队列中顺序左移, 第10个参数入队到$9中, 因此shift可以处理脚本超过10个参数的情况
例如:
```sh
COUNT = 0
NUMBER = $1
while [ $COUNT –lt  $NUMBER ]
do
	COUNT=`expr $COUNT + 1`
	TOKEN=‘$’ $COUNT

	shift # $2 become $1
done 
```

* 文件名最前面的圆点 “.” 和路经名中的斜杠“/”必须显式匹配。例如 “\*” 不能匹配 “.bashrc”, 而  “.\*”  才可以匹配“.bashrc”。
* 连字符 - 仅在方括号内有效, 表示字符范围。如果在方括号外面就成为普通字符了
* 而 \* 和 ? 在方括号外面是通配符, 若出现在方括号之内, 它们也失去通配符的能力, 成为普通字符了。

通配符 | 匹配 | 例子
:--: | :--: | :--:
? | 匹配单个字符  | `$ ls test?5.dat` 将列出以test开头, 中间是一个字符, 并以5.dat结尾的文件
\* | 任意字符字符串 | `$ ls t*` 将列出的所有以t开头的文件, 
[set] | Set中的任意字符 | `$ ls [e,m,t] *` 列出以e,m,或t开头的的所有文件 
[!set] | 不在Set中的任意字符 | `$ ls [!0-9] *` 列出所有不以数字开头的的文件


Linux 系统中的全局 bash 启动脚本, 任何用户登录系统时/etc/profile 都会被执行。通常用来设置标准 bash 环境, 但修改该文件需 root 权限。
读取 /etc/profile 文件后, bash 将在用户主目录中按顺序查找以下文件, 并执行第一个找到的文件:
\~/.bash_profile
\~/.bash_login
\~/.profile
在这些文件中, 用户可以定义自己的环境变量, 而且能够覆盖在 /etc/profile 中定义的设置。

\#!/bin/bash 
使用指定的解释器程序执行脚本内容
 例如:bash  repboot.sh、sh  repboot.sh
通过source命令（或 . ）读取脚本内容执行
 例如:souce  repboot.sh  或  .   hello.sh 

# 条件测试
测试特定的表达式是否成立, 当条件成立时, 命令执行后的返回值为0, 否则为其他数值 (注意第二种写法要有空格)
主要的条件测试包括: 字符串比较  文件属性检查  整数条件
条件测试语法 | 说明
:-- | :--
test <测试表达式> | 这是利用test命令进行条件测试表达式的方法。test命令和“<测试表达式>”之间至少有一个空格。
[<测试表示式>] | 这是通过[ ]进行条件测试表达式的方法, 和test命令的用法相同, 推荐使用这种方法。[  ]的边界和内容之间至少有一个空格。
[[<测试表达式>]] | 这是通过[[  ]]进行条件测试表达式的方法, 是比test和[  ]更新的语法格式。[[  ]]的边界和内容之间至少有一个空格。
((<测试表达式>)) | 这是通过(( ))进行条件测试表达式的方法, 一般用于if语句里。((  ))（双小括号）两端不需要有空格。

测试表达式符号 | [ ] | test | [[ ]] | (( ))
:-- | :-- | :-- | :-- | :--
边界为是否需要空格 | 需要 | 需要 | 需要 | 不需要
逻辑操作符 | !、-a、-o | !、-a、-o | !、&&、|| | !、&&、||
整数比较操作符 | -eq、-gt、-lt、-ge、-le | -eq、-gt、-lt、-ge、-le | -eq、-gt、-lt、-ge、-le或=、>、<、>=、<= | =、>、<、>=、<=
字符串比较操作符 | =、==、!= | =、==、!= | =、==、!= | =、==、!=
是否支持通配符匹配 | 不支持 | 不支持 | 支持 | 不支持

整数值比较
-eq:等于（Equal）
-ne:不等于（Not Equal）
-gt:大于（Greater Than）
-lt:小于（Lesser Than）
-le:小于或等于（Lesser or Equal）
-ge:大于或等于（Greater or Equal）


文件属性检查
-c file 字符专用文件
-d file file存在并且是一个目录
-b file 块专用文件
-L file 文件是一个符号链接
-p file 文件是一个命名管道
 
-r file 对file有读权限
-w file 对file有写权限
-x file 对file有可执行权限, 如果为目录, 则用目录搜索权限
 
-f file file存在并且为正规文件（亦即不是一个目录或其他特殊类型文件）
-e file / -a file file存在
-s file 文件存在且非空
 
-O file 你是file的所有者
-G file 文件存在且属于有效组ID （如果你在多个组中, 则匹配其中一个）
file1-nt file2 file比file2新  (文件修改时间)
file1-ot file2 file比file2旧  (文件修改时间)
-g file set –group – ID被设置
-k file sticky位被设置
-t file 如果fd（文件描述符）被一个终端打开则为真
-u file set – user – ID 位被设置
[ file1 –ef file2 ]  如果文件file1与file2有相同大小（设备数或i结点数）, 则为真




# getopts 不支持长选项
while getopts :xyn:name
x、y和n是选项。在本例中, 第一个选项由一个冒号引导, 表示getopts不报告错误信息。如果选项后有一个冒号, 表示该选项需要一个参数。参数是一个不用短划线引导的词。-n选项需要一个参数。
在命令行键入选项时前面都要加一个短划线。
遇到不含短划线的选项时, getopts就认为选项列表已结束。
每次被调用时, getopts都将找到的下一个选项放到变量name 中（这个变量名可由你任意选择）。如果遇到非法变量, getopots就将name的值设为问号。

getopts函数提供两个变量来保持参数的记录:OPTIND和OPTARG。
OPTIND是一个专用变量, 初始化为1, 每次getopts处理完一个命令行参数后, OPTIND就增加为getopts下一个要处理的参数的序号。
OPTARG变量包含了合法参数的值
```
#!/bin/bash  #test.sh
while getopts "a:bc" arg   #选项后面的冒号表示该选项需要参数
do
        case $arg in
             a)
                echo "a's arg:$OPTARG”        #参数存在$OPTARG中
                ;;
             b)
                echo "b"
                ;;
             c)
                echo "c"
                ;;
             ?)      #当有不认识的选项的时候arg为?
            echo "unkonw argument"
        exit 1
        ;;
        esac
done
```

# shell基础

位置参数
位置变量 作用说明
$0        获取当前执行的Shell脚本的文件名, 如果执行脚本包含了路径, 那么就包括脚本路径
$n        获取当前执行的Shell脚本的第n个参数值, n=1..9, 当n为0时表示脚本的文件名       如果n大于9, 则用大括号括起来, 例如${10}, 接的参数以空格隔开
$#        获取当前执行的Shell脚本后面接的参数的总个数
$*        获取当前Shell脚本所有传参的参数, 不加引号和$@相同       如果给$*加上双引号, 例如:”$*”, 则表示将所有的参数视为单个字符串, 相当于”$1 $2 $3”
$@         获取当前Shell脚本所有传参的参数, 不加引号和$\*相同        如果给$@加上双引号, 例如:”$@”, 则表示将所有的参数视为不同的独立字符串, 相当于”$1” “$2” “$3” “…”。这是将多参数传递给其他程序的最佳方式, 因为它会保留所有的内嵌在每个参数里的任何空白。当”$@”和”$\*”都加双引号, 两者是有区别的；都不加双引号时, 两者无区别
$?        上一条命令执行后返回的状态, 当返回状态值为0时表示执行正常, 非0值表示执行异常或出错

${@:begin} 从begin开始, 取后面所有的位置参数
${@:begin:count} 从begin开始, 取后面count个的位置参数
```
[root@localhost~]# test.sh v1 v2 v3 v4 v5
echo ${@:3}   # v3 v4 v5
echo ${@:3:2}   # v3 v4
```

--------------------------------------------------------------------------------



--------------------------------------------------------------------------------

算数运算
名称 语法 范例
算术扩展 $((算术式)) r=$((2+5\*8))
使用外部程序expr expr算术式 r=`expr 4+5`
使用$[ ] $[算术式] r=$[4+5]
使用置命令declare declare -i 变量=算术式 Declare -i r=8+16
使用内置命令let let 算术式 let r=8+16
```
[root@localhost ~]#  $((${j:-8}+2))
```
自增
```
num=`expr $num + 1` # 加号左右必须得有空格
num=$((num+1))
let num++ 
let num=num+1
```

--------------------------------------------------------------------------------


变量赋值的时候等于号两边不能有空格