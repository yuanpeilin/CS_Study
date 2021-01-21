# 目录
- [Debug](#debug)
- [if](#if)
- [for](#for)
- [while](#while)
- [case](#case)
- [select](#select)
- [存在性测试](#存在性测试)
- [切割字符串](#切割字符串)
- [模式匹配](#模式匹配)
- [引号](#引号)
- [整数运算](#整数运算)
- [特殊变量](#特殊变量)
- [位置参数](#位置参数)
- [shift](#shift)
- [条件测试](#条件测试)
    - [条件测试表达式](#条件测试表达式)
    - [整数值比较操作符含义](#整数值比较操作符含义)
    - [文件属性检查](#文件属性检查)
- [getopts](#getopts)



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# Debug
```sh
bash -x ./<shell script>
```

# if
`if`和`then`在同一行的话, 判断条件后要加一个分号

### 语法
```sh
if condition1; then
    command1
elif condition2; then
    command2
else
    commandN
fi
```

### 例子
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

# for
### 语法
```sh
for var in item1 item2 ... itemN; do
    command1
    command2
    ...
    commandN
done
```

### 例子
```sh
#!/bin/bash
for TIME in "Morning" "Noon" "Evening"; do
    echo "The $TIME of the day."
done
```

# while
### 语法
```sh
while condition; do
    command
done
```

### 例子
```sh
#!/bin/bash
num=1
while [ $num -lt 10 ]; do
    echo $num
    num=`expr $num + 1`
done
```

```sh
#!/bin/bash
# 批量增加20个用户并设置密码
declare –i num=1
while [ $num -le 20 ]; do
    useradd stu$num
    echo "123456" | passwd --stdin stu$num &> /dev/null
    num=`expr $num + 1`
done
```

```sh
while read -r line; do
    echo $line
done < ~/.todo
```

# case
### 语法
```sh
case variable in
    pattern1)
        command1
        command2
        ...
        commandN
        ;;
    pattern2)
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

### 例子
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

# select
### 语法
```sh
select variable in [list]; do
    command
done
```

### 例子
```sh
#!/bin/bash
select var in "dog" "cat" "bee"; do
    echo "you like $var"
    break
done
```

# 存在性测试
大括号里面直接写变量名或数字, 括号外面已经有`$`符号了无需再添加

表达式          | 存在且非null | 值为null               | 不存在                 | 意图
--------------- | ------------ | ---------------------- | ---------------------- | ----
${var-value}    | 返回var      | 返回var                | 返回value              | 测存在性, 不测空值
${var:-value}   | 返回var      | 返回value              | 返回value              | 变量未定义或不存在, 则返回一个默认值
${var:=value}   | 返回var      | 将var值置为value且返回 | 将var值置为value且返回 | 变量未定义或不存在, 则为变量设置默认值
${var:?message} | 返回var      | 返回message并退出脚本  | 返回message并退出脚本  | 捕获未定义变量造成的异常
${var:+value}   | 返回value    | 返回null               | 返回null               | 修改一个已存在变量的值

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

表达式                  | 说明
----------------------- | ----
${string:offset}        | 初始位置为0, 从offset开始切割, 直至字符串结束
${string:offset:length} | 从offset开始, 长度为length

```sh
filename=/etc/apache2
echo ${filename:1:3} # etc
echo ${filename:5} # apache2
```

# 模式匹配

表达式               | 说明
-------------------- | ----
${variable#pattern}  | 从变量头部开始, 删除最短的匹配部分, 并返回其余部分
${variable##pattern} | 从变量头部开始, 删除最长的匹配部分, 并返回其余部分
${variable%pattern}  | 从变量尾部开始, 删除最短的匹配部分, 并返回其余部分
${variable%%pattern} | 从变量尾部开始, 删除最长的匹配部分, 并返回其余部分

# 引号
* 使用 **单引号** 时, 将不允许在单引号的范围内引用其他变量的值, $符号或者其他任何符号将作为普通字符看待
* 使用 **双引号** 时, 允许在双引号的范围内使用$符号引用其他变量的值(变量引用)
* 使用 **反撇号** 时, 允许将执行特定命令的输出结果赋值给变量, 反撇号中的内容要求是可执行的命令, 需要嵌套使用时, 可以将反撇号改为`$(...)`的形式
```sh
echo "<<< echo \$x >>> displays the value of x, which is $x"
echo '<<< echo $x >>> displays the value of x, which is' $x
echo '<<< echo $x >>> displays the value of x, which is' "$x"
```

# 整数运算

Expression             | Example                           | increase                     | Comment
---------------------- | --------------------------------- | ---------------------------- | -------
$((算术式))            | r=$((2+5\*8)) <br> $((${j:-8}+2)) | num=$((num+1))               | -
expr 算术式            | r=\`expr 4+5\`                    | num=\`expr $num + 1\`        | 加号左右必须得有空格
$[算术式]              | r=$[4+5]                          | -                            | -
declare -i 变量=算术式 | declare -i r=8+16                 | -                            | -
let 算术式             | let r=8+16                        | let num++ <br> let num=num+1 | -

# 特殊变量
变量 | 作用说明
---- | --------
$0   | 获取当前执行的Shell脚本的文件名, 如果执行脚本包含了路径, 那么就包括脚本路径
$n   | 获取当前执行的Shell脚本的第n个参数值, n=1..9, 当n为0时表示脚本的文件名; 如果n大于9, 则用大括号括起来, 例如${10}, 接的参数以空格隔开
$#   | 获取当前执行的Shell脚本后面接的参数的总个数
$*   | 获取当前Shell脚本所有参数, 不加引号和$@相同; 如果给$*加上双引号, 例如`"$*"`, 则表示将所有的参数视为 **单个字符串** , 相当于`"$1 $2 $3"`
$@   | 获取当前Shell脚本所有参数, 不加引号和$*相同; 如果给$@加上双引号, 例如`"$@"`, 则表示将所有的参数视为 **不同的独立字符串**, 相当于`"$1" "$2" "$3" "…"`. 这是将多参数传递给其他程序的最佳方式, 因为它会保留所有的内嵌在每个参数里的任何空白
$?   | 上一条命令执行后返回的状态, 当返回状态值为0时表示执行正常, 非0值表示执行异常或出错
$$   | 当前所在进程的进程号
$!   | 后台运行的最后一个进程号

# 位置参数
* `${@:begin}` 从begin开始, 取后面所有的位置参数
* `${@:begin:count}` 从begin开始, 取后面count个的位置参数
```sh
test.sh v1 v2 v3 v4 v5
echo ${@:3}   # v3 v4 v5
echo ${@:3:2}   # v3 v4
```

# shift
若脚本参数多于9个, 就需要通过shift函数, 让第一个参数出队, 队列中顺序左移, 第10个参数入队到$9中, 因此shift可以处理脚本超过10个参数的情况
例如:
```sh
COUNT = 0
NUMBER = $1
while [ $COUNT –lt  $NUMBER ]; do
    COUNT=`expr $COUNT + 1`
    TOKEN='$' $COUNT

    shift # $2 become $1
done
```

# 条件测试
测试特定的表达式是否成立, 当条件成立时, 命令执行后的返回值为0, 否则为其他数值

### 条件测试表达式
表达式 | 是否需要空格 | 逻辑操作符       | 整数比较操作符                                      | 字符串比较操作符 | 是否支持通配符
------ | ------------ | ---------------- | --------------------------------------------------- | ---------------- | --------------
test   | 需要         | `!` `-a` `-o`    | `-eq` `-gt` `-lt` `-ge` `-le`                       | `=` `==` `!=`    | 不支持
[ ]    | 需要         | `!` `-a` `-o`    | `-eq` `-gt` `-lt` `-ge` `-le `                      | `=` `==` `!=`    | 不支持
[[ ]]  | 需要         | `!` `&&` `\|\|`  | `-eq` `-gt` `-lt` `-ge` `-le` `=` `>` `<` `>=` `<=` | `=` `==` `!=`    | 支持
(( ))  | 不需要       | `!` `&&` `\|\|`  | `=` `>` `<` `>=` `<=`                               | `=` `==` `!=`    | 不支持

### 整数值比较操作符含义
* -eq: 等于(Equal)
* -ne: 不等于(Not Equal)
* -gt: 大于(Greater Than)
* -lt: 小于(Lesser Than)
* -le: 小于或等于(Lesser or Equal)
* -ge: 大于或等于(Greater or Equal)

### 文件属性检查
* `-c file` 字符专用文件
* `-d file` file存在并且是一个目录
* `-b file` 块专用文件
* `-L file` 文件是一个符号链接
* `-p file` 文件是一个命名管道

<br>

* `-r file` 对file有读权限
* `-w file` 对file有写权限
* `-x file` 对file有可执行权限, 如果为目录, 则用目录搜索权限

<br>

* `-f file` file存在并且为正规文件(亦即不是一个目录或其他特殊类型文件)
* `-e file` file存在
* `-a file` file存在
* `-s file` 文件存在且非空

<br>

* `-O file` 你是file的所有者
* `-G file` 文件存在且属于有效组ID (如果你在多个组中, 则匹配其中一个)
* `file1 -nt file2` file比file2新  (文件修改时间)
* `file1 -ot file2` file比file2旧  (文件修改时间)
* `-t file` 如果fd(文件描述符)被一个终端打开则为真

# getopts
`while getopts :xyn: name`
x、y和n是选项. 在本例中, 第一个选项由一个冒号引导, 表示getopts不报告错误信息. 如果选项后有一个冒号, 表示该选项需要一个参数. 参数是一个不用短划线引导的词. -n选项需要一个参数  
遇到不含短划线的选项时, getopts就认为选项列表已结束  
每次被调用时, getopts都将找到的下一个选项放到变量name中(这个变量名可任意选择). 如果遇到非法变量, getopots就将name的值设为问号  
getopts函数提供两个变量来保持参数的记录: `OPTIND`和`OPTARG`
* `OPTIND`是一个专用变量, 初始化为1, 每次getopts处理完一个命令行参数后, OPTIND就增加为getopts下一个要处理的参数的序号
* `OPTARG`变量包含了合法参数的值
```sh
#!/bin/bash  #test.sh
while getopts "a:bc" arg   #选项后面的冒号表示该选项需要参数
do
    case $arg in
        a)
            echo "a's arg:$OPTARG"        #参数存在$OPTARG中
            ;;
        b)
            echo "b"
            ;;
        c)
            echo "c"
            ;;
        ?)  #当有不认识的选项的时候arg为?
            echo "unkonw argument"
            exit 1
            ;;
    esac
done
```
