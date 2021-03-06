# 目录
* **a** [`at`](#at)
* **b** [`bg`](#bg)
* **c** [`case`](shell.md/#case) [`cat`](#cat) [`chattr`](#chattr) [`chgrp`](#chgrp) [`chkconfig`](#chkconfig) [`chmod`](#chmod) [`chown`](#chown) [`col`](#col) [`corntab`](#corntab) [`cp`](#cp) [`curl`](#curl) [`cut`](#cut)
* **d** [`declare`](#declare) [`df`](#df) [`disown`](#disown) [`du`](#du)
* **e** [`echo`](#echo) [`eval`](#eval) [`export`](#export)
* **f** [`fallocate`](#fallocate) [`fdisk`](#fdisk) [`ffmpeg`](#ffmpeg) [`fg`](#fg) [`file`](#file) [`fim`](#fim) [`find`](#find) [`finger`](user.md/#查看用户) [`for`](shell.md/#for) [`free`](#free)
* **g** [`getopt`](shell.md/#getopt) [`getopts`](shell.md/#getopts) [`grep`](#grep) [`groupadd`](user.md/#增加组) [`groupdel`](user.md/#删除组) [`groupmod`](user.md/#修改组) [`gpasswd`](user.md/#修改组) [`gzip`](#gzip)
* **h** [`hash`](#hash) [`head`](#head)
* **i** [`id`](user.md/#查看用户) [`if`](shell.md/#if) [`ifconfig`](#ifconfig) [`imagemagick`](#imagemagick)
* **j** [`jobs`](#jobs) [`join`](#join) [`journalctl`](systemd.md/#日志管理) [`jq`](#jq)
* **k** [`kill`](#kill)
* **l** [`less`](#less) [`ln`](#ln) [`local`](#local) [`localectl`](systemd.md/#localectl) [`locate`](#locate) [`loginctl`](systemd.md/#loginctl) [`ls`](#ls) [`lsattr`](#lsattr) [`lsblk`](#lsblk) [`lsof`](#lsof)
* **m** [`man`](#man) [`md5sum`](#md5sum) [`mkdir`](#mkdir) [`mkfs`](#mkfs) [`mount`](#mount)
* **n** [`ncdu`](#ncdu) [`netstat`](#netstat) [`nohub`](#nohub)
* **p** [`pandoc`](#pandoc) [`pgrep`](#pgrep) [`pkill`](#pkill) [`ps`](#ps) [`pstree`](#pstree)
* **r** [`rsync`](#rsync) [`runlevel`](#runlevel)
* **s** [`scp`](#scp) [`sed`](#sed) [`select`](shell.md/#select) [`shopt`](#shopt) [`sort`](#sort) [`source`](#source) [`ssh`](ssh.md/#ssh) [`ssh-keygen`](ssh.md/#sshkeygen) [`ssh-keyscan`](ssh.md/#sshkeyscan) [`systemd-analyze`](systemd.md/#systemd-analyze) [`systemctrl`](systemd.md/#unit)
* **t** [`tail`](#tail) [`tar`](#tar) [`tee`](#tee) [`timedatectl`](systemd.md/#timedatectl) [`top`](#top) [`tr`](#tr) [`trap`](#trap) [`tree`](#tree) [`truncate`](#truncate) [`type`](#type)
* **u** [`ufw`](#ufw) [`uniq`](#uniq) [`uptime`](#uptime) [`useradd`](user.md/#增加用户) [`userdel`](user.md/#删除用户) [`usermod`](user.md/#修改用户)
* **w** [`whereis`](#whereis) [`while`](shell.md/#while)
* **x** [`xargs`](#xargs) [`xmlstarlet`](#xmlstarlet)



*****************************************************************************
*****************************************************************************



# at
定时启动任务, 属于一次性计划任务, 位于 */etc/init.d/atd*

### 语法
**`at [HH:MM] [yyyy-mm-dd]`**
* `-c <number>` 显示任务详情
* `-d <number>` 删除一个任务, 相当于`atrm`
* `-l` 列出当前任务, 相当于`atq`

### 例子
```sh
# 命令输入完成后使用Ctrl+D提交任务
$ at 23:45
at 8:00 2020-01-01
at now + 1munites
```

# bg
将处于后台的进程放到后台继续运行, 需指定任务序号

# cat
### 语法
* `-b` 显示行号, 空行会显示但无行号
* `-n` 显示行号, 空行有行号
* `-A` 打印特殊字符, 例如`\r\n`为`^M$`

# chattr

# chgrp

# chkconfig
### 语法
* **`chkconfig [--add][--del][--list]<service_name>`**
    - `--add <service_name>` 增加httpd服务
    - `--del <service_name>` 删除httpd服务
    - `--list` 列出所有的系统服务
    - `--list <service_name` 列出服务设置情况
* **`chkconfig [--level <等级代号>][系统服务][on/off/reset]`**
    - `--level <service_name> <runlevel> <on|off>` 设置服务的运行级别为on或off

### 例子
```sh
$ chkconfig --list network
network         0:关闭  1:关闭  2:启用  3:启用  4:启用  5:启用  6:关闭

$ chkconfig --list
acpid           0:关闭  1:关闭  2:关闭  3:启用  4:启用  5:启用  6:关闭
anacron         0:关闭  1:关闭  2:启用  3:关闭  4:启用  5:关闭  6:关闭
apmd            0:关闭  1:关闭  2:启用  3:启用  4:启用  5:启用  6:关闭

$ chkconfig --level 35 mysqld on

$ chkconfig --level httpd 2345 on

$ chkconfig --add httpd
```

# chmod
### 语法
* `-R` 对目前目录下的所有文件与子目录进行相同的权限变更

# chown
新文件所有者和新文件所属组可以省略一个, 但是冒号不能省

### 语法
**`chown [新文件所有者]:[新文件所属组] FILE_NAME`**
* `-R` 递归

# col
过滤掉控制字符

### 语法
* `-b` 过滤掉所有的控制字符, 包括RLF和HRLF
* `-f` 只滤除RLF字符

### 例子
```sh
$ man man | col-b > man_help
```

# corntab
配置文件位于 */etc/init.d/crond*, RHEL将任务存储在 */var/spool/cron/用户名* , Debian将任务存储在 */var/spool/cron/crontabs/用户名*  
日志存储在 */var/log/cron*

### 说明
* `*` 表示该范围内的任意时间, 表示间隔的多个不连续时间点
* `-` 表示一个连续的时间范围, 如`1-4`表示整数1,2,3,4
* `/` 指定间隔的时间频率, 如在日期字段中的`*/3`表示每隔3天. 不使用`*`则不会重复执行, 例如`1 * * * *`只会在每个小时的第一分钟执行, `1/* * * * *`才表示每分钟执行一次
* `@reboot` `@hourly` `@daily` `@weekly` `@monthly` `@yearly` 使用此项则不需要再指定时间频率, 后面直接加命令即可

```
分钟  小时   天    月  星期
0     17      *    *   1-5     周一到周五每天17: 00
30    8       *    *   1,3,5   每周一, 三, 五的8点30分
0     8-18/2  *    *   *       8点到18点之间每隔2小时
0     *       */3  *   *       每隔3天
```

### 语法
* `crontab  -e  [-u  用户名]` 编辑计划任务(会自动编辑 */var/spool/cron/用户名* 文件)
* `crontab  -l  [-u  用户名]` 查看计划任务
* `crontab  -r  [-u  用户名]` 删除计划任务

# cp
### 语法
* `-r` 复制该目录下所有的子目录和文件
* `-p` 原封不动的拷贝权限, 时间戳等, 前提是用户对文件有写权限
* `-d` 复制是链接文件的话, 复制此链接. 否则不加此参数的话, 复制的是链接指向的文件
* `-a` 相当与`-dpr`

# curl
### 例子
```sh
# 不带任何参数, 就是发送GET请求(即显示网页源代码)
$ curl www.baidu.com
$ curl example.com?data=xxx&time=xxx

# 将网页保存为文件
$ curl -o <file path> www.baidu.com

# 自动跳转
$ curl -L www.baidu.com

# 除了显示网页源代码, 显示HTTP请求头信息
$ curl -i www.baidu.com

# 显示HTTP通信整个过程
$ curl -v www.baidu.com

# 显示详细的HTTP通信整个过程
$ curl --trace output.txt www.baidu.com
$ curl --trace-ascii output.txt www.baidu.com

# 设置代理
$ curl -x socks5://localhost:1080 www.baidu.com
```

* 发送POST请求
```sh
$ curl -X POST -d "data=xxx" example.com
$ curl -X POST --data "data=xxx" example.com
$ curl -X POST -d "data=xxx" -d "data=xxx" example.com
$ curl -X POST -d "data=xxx&data=xxx" example.com

# 读取文件
$ curl -d '@data.txt' example.com

# 自动进行URL编码
$ curl -X POST --data-urlencode "date=xxx" example.com
```

# cut
### 语法
* `-d` 指定分隔符, 默认分隔符为tab键
* `-c 范围` 显示范围的字符
* `-f 范围` 显示范围的字段
* `--complement` 显示指定字段/字符/字节之外的列

### 例子
```sh
# 显示第2, 3列
$ cut -d " " -f 2,3 file

# 显示第2列及之后内容
$ cut -d " " -f 2- file

# 显示除了第2列及之后的内容(只显示第一列)
$ cut -d " " -f 2- --complement file
```

# declare
设置变量的值或属性, 参数中没有变量的话, 则会打印所有符合条件的变量

### 语法
**`declare [+/-][rxi] [variable[=value]]`**
* `-f` 限制为仅对函数起作用, 如`declare -fp PS1`不会有输出
* `-F` 仅显示函数名, 不显示具体内容
* `-g` 在函数中创建全局变量
* `-p` 显示变量

### 属性
`-`可用来指定变量的属性, `+`则是取消变量所设的属性
* `a` 声明一个数组
* `A` 声明一个map
* `i` 声明一个整数
* `l` 设置变量名为小写
* `n` 声明一个引用变量, 实际[例子](shell.md/#操作数组)
* `r` 将变量设置为只读
* `u` 设置变量名为大写
* `x` 指定的变量会成为环境变量, 等价于[export](#export)

### 例子
```sh
$ a=123
$ declare -p a
declare -- a="123"
$ declare -i a
$ declare -p a
declare -i a="123"
$ declare +i a
$ declare -p a
declare -- a="123"
```

# df
查看磁盘整体使用情况

### 语法
* `-a` 列出所有文件系统, 包含具有0 Blocks的文件系统
* `-h` 以KB, MB, GB为单位
* `-H` 同`-h`, 进制为1000
* `-i` 显示inode信息
* `-T` 显示文件系统类型

# disown
将指定任务从后台任务列表(jobs命令的返回结果)之中移除, 但任务还会继续执行

### 例子
```sh
# 移出最近一个正在执行的后台任务
$ disown

# 移出所有正在执行的后台任务
$ disown -r

# 移出所有后台任务
$ disown -a

# 不移出后台任务, 但是让它们不会收到SIGHUP信号
$ disown -h

# 根据jobId, 移出指定的后台任务
$ disown %2
$ disown -h %2
```

# du
用于显示目录或文件的大小, 无参数递归显示当前目录下所有文件的大小

### 语法
**`du [-hHs] [--max-depth=<number>] [directory]`**
* `-h` 以KB, MB, GB为单位
* `-H` 类似`-h`, 以1000为换算单位
* `-s` 仅显示总计

### 例子
```sh
# 显示当前目录的大小
$ du -hs

# 显示当前下目录下所有目录及文件的大小
$ du -hs *
```

# echo
### 语法
* `-e` 使反斜杠可以起到转义的作用

### 颜色表

字体颜色 | 背景色 | 颜色
-------- | ------ | ----
30       | 40     | 黑色
31       | 41     | 紅色
32       | 42     | 綠色
33       | 43     | 黃色
34       | 44     | 藍色
35       | 45     | 紫紅色
36       | 46     | 青藍色
37       | 47     | 白色

代码 | 效果
---- | ----
0    | 默认
1    | 加粗
3    | 斜体
4    | 下划线
5    | 闪烁
7    | 反色(字体和背景对掉)
8    | 不可见
9    | 字体中间横线

### 例子
```sh
# 字体颜色, 背景色, 效果没有先后之分
$ echo -e "\e[31;43;1m SomeWord \e[0m"
$ echo -e "\e[01;34m SomeWord \e[00m"
$ echo -e "\033[01;34m SomeWord \033[00m"
$ PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
```

# eval
会将命令执行一次之后再次执行

### 例子
```sh
$ echo "hello World" > file

$ test="cat file"

$ echo "$test"
cat file

$ eval "$test"
hello World
```

# export
输出环境变量, 当前shell进程和子进程都有效. 不接变量名输出所有环境变量

### 语法
**`export <variable>`**
**`export <variable>=<value>`**

# fallocate
创建空文件

# fdisk

# ffmpeg
### 例子
```sh
# 录屏
$ ffmpeg -video_size 1920x1080 -framerate 60 -f x11grab -i :0.0+0,0 output.mp4
```

# fg
将处于后台的进程恢复到前台运行, 需指定任务序号

# file
查看文件详细信息(主要用来查看编码)

### 例子
```sh
$ file shell.md
shell.md: exported SGML document, UTF-8 Unicode text
```

# fim
### 例子
```sh
# 查看图片
$ fim a.jpg

# 以ASCII码形式查看图片
$ fim -t a.jpg
```

# find
不设置查找范围参数, 则find命令将在当前目录下查找子目录与文件

### 语法
**`find [查找范围] [查找条件] [动作]`**
* `-name file_name` 根据名称进行查找, 大小写敏感
* `-iname file_name` 根据名称进行查找, 大小写不敏感
* `-type [d | f | c | b | l]` 根据文件类型进行查找
* `-amin | -atime` 根据文件被读取/执行的时间进行查找
* `-cmin | -ctime` 根据文件属性被修改的时间进行查找
* `-mmin | -mtime` 根据文件被修改的时间进行查找
* `-size` 根据文件的大小进行查找. 单位为: c(字节) k M G
* `-user uid | -group gid` 根据所属用户进行查找
* `-perm 访问权限` 根据访问权限进行查找
* `-inum <number>` 根据inode进行查找

### 例子
* 根据时间查找
```sh
# 七天前, 内容发生改变的文件
$ find / -mtime +7

# 四天前那天, 内容发生改变的文件
$ find / -mtime 4

# 七天之内, 内容发生改变的文件
$ find / -mtime -7
```

* 根据大小进行查找
```sh
# 查找小于3k的文件
$ find / -size -3k -ls

# 查找大小为10M的文件
$ find / -size 10M -ls

# 查找大于100字节的文件
$ find / -size +100c -ls
```

* 根据所属用户进行查找
```sh
# 在根目录下找到文件拥有者为root的文件
$ find / -user root -ls
$ find / -user 0 -ls
```

* 根据访问权限进行查找
```sh
# 找到制定权限的文件
$ find / -perm 754 -ls
```

* 多个条件 使用多个条件时, 要用圆括号, 且要使用\进行转义
    * `-a` 与
    * `-o` 或
    * `!` 非
```sh
$ find / \( -size +1k -a -size -10M -a -type f \) -ls;
```

* 动作选项
    * `-exec`表示动作的开始
    * `{}`表示查找到的文件
    * `\;`表示动作的结束
```sh
# 找到指定文件并删除
$ find / \( -size +1k -a -size -10M -a -type f \) -exec rm -rf {} \;

# 找到当前路径下损坏的符号链接并删除
$ find . -xtype l -exec rm {} \;
```

# free
* `-h` 以MB, GB为单位

# grep
### 语法
* `-A <number>` 除了当前行, 还输出当前行 **后面** number行
* `-B <number>` 除了当前行, 还输出当前行 **前面** number行
* `-C <number>` 除了当前行, 还输出当前行 **前后** number行
* `-E` `--extended-regexp` ERE, 参考[linux/regex.md](regex.md)
* `-G` `--basic-regexp` BRE
* `-P` `--perl-regexp` PCRE
* `-i` 忽略大小写
* `-o` 仅输出匹配的部分(默认输出匹配的行)
* `-r` 递归, 搜索目录
* `-v` `--invert-match` 对结果取反

# gzip
### 例子
```sh
# 解压文件
$ gzip -d test.gz

# 调节压缩比(默认为6. 9为最大压缩比, 压缩的文件最小)
$ gzip -9 test.txt
```

# hash
新开一个shell时, 就会初始化一个hash表, hash表会记录命令执行过的路径. 再次执行命令时, 会先去hash表中找, 找不到才会去找PATH

### 语法
* `hash -d <command>` 从hash表中删除某条命令
* `hash -l` 列出当前hash表
* `hash -p <command path> <alias>` 自定义命令的别名
* `hash -r` 清空hash表
* `hash -t <command>` 显示命令的路径, 相当与`hash -l | grep <command>`

# head
### 语法
* `-c <number>` 显示开头number个字节
* `-<number>` 显示开头number行
* `-n <number>` 显示开头number行
* `-n -<number>` 显示所有行除了最后number行


# ifconfig

# imagemagick
### 例子
```sh
# 获取图片信息
$ identify test.jpg

# 转化图片格式
$ convert  test.jpg  test.png

# 改变图像大小
$ convert -resize 1024x768 test.jpg test_modify.jpg

# 设置图像质量, 质量值为0-100之间的数值, 数字越大, 质量越好. 一般指定70-80
$ convert -resize 1024x768 -quality 75 test.jpg test_modify.jpg

# 缩放图片
$ convert -sample 50%x50% test.jpg test_modify.jpg
```

# jobs
查看处于后台的任务列表

# join

# jq
处理XMl

# kill
默认的信号为SIGTERM(15)

### 例子
```sh
# 强制杀死进程
$ kill -9 PID
```

# less
### 语法
* `-N` 显示行号
* `-m` 百分比
* `+F` 持续读取, 窗口被锁定无法上下滚动, 退出之后无残留信息

# ln
### 语法
**`ln [-s] [链接指向的文件] [链接名]`**

# local
定义局部变量, 使变量仅在函数内部有效. 且咯擦了只能在函数内使用

# locate
在数据库(/var/lib/mlocate/mlocate.db)中查找符合条件的文档, 更新数据库使用`updatedb`

# ls
### 语法
**`ls [-alhtAi] [name...]`**
* `-a` 列出所有文件, 包括`.`开头的
* `-A` 同`-a`, 但不列出`.`(目前目录)及`..`(父目录)
* `-F` 文件夹后会有`/`, 其他符号包括`* / = > @ |`
* `-i` 查看inode
* `-r` 将排序结果反向输出
* `-R` 递归, 列出所有文件包括文件夹中的文件
* `-S` 按大小排序, 大的在前
* `-t` 将文件依建立时间的先后次序列出

### 例子
文件类型
* `d` 目录文件
* `-` 普通文件
* `c` 字符设备文件
* `b` 块设备文件
* `l` 符号链接文件

```
类型和权限   文件硬链接数目   文件拥有者   文件从属用户组   文件大小   时间戳          文件名
drwxr-xr-x   2                ypl          ypl              4096       Jan 13 20: 04   Desktop
-rw-------   1                ypl          ypl              32         May 28 13: 53   .lesshst
-rw-r--r--   1                ypl          ypl              807        May 12 17: 54   .profile
drwx------   1                ypl          ypl              4096       May 12 18: 40   .ssh
```

# lsattr

# lsblk

# lsof
查看开启的套接字和文件

# man
### 分类

章节 | 说明                                         | Commment
---- | -------------------------------------------- | --------
1    | 普通的命令                                   | Executable programs or shell commands
2    | 系统调用,如open,write                        | System calls (functions provided by the kernel)
3    | 库函数,如printf,fread                        | Library calls (functions within program libraries)
4    | 特殊文件,即/dev下的各种设备文件              | Special files (usually found in /dev)
5    | 文件的格式, 如passwd                         | File formats and conventions eg /etc/passwd
6    | 游戏                                         | Games
7    | 附件和变量, 如全局变量environ                | Miscellaneous (including macro packages and conventions), e.g. man(7), groff(7)
8    | 系统管理用的命令, 只能由root使用, 如ifconfig | System administration commands (usually only for root)
9    | 跟kernel有关的文件                           | Kernel routines [Non standard]

### 语法
* `man <章节> <command>` 从指定章节查看手册
* `man -f <command>` 显示command在哪些章节中
* `man -w <command>` 显示手册所在的路径
* `man -aw command` 显示所有章节的手册路径
* `man -M <path> <command>` 从指定目录查看手册
* `man -p <program>` 指定分页程序, 如less more cat pager等

### 例子
```sh
# 查看sleep出现的章节
$ man -f sleep
sleep (1)            - delay for a specified amount of time
sleep (3)            - sleep for a specified number of seconds

$ man  -w sleep
/usr/share/man/man1/sleep.1.gz

$ man  -aw sleep
/usr/share/man/man1/sleep.1.gz
/usr/share/man/man3/sleep.3.gz

# 指定路径, 查看中文手册 (apt install manpages-zh)
$ man -M /usr/share/man/zh_CN/ ln

# 将man手册打印成pdf(apt install groff)
man -Tpdf bash > bash.pdf
```

# md5sum

# mkdir
### 语法
* `-m` 设置存取权限
* `-p` 确保目录名称存在, 不存在的就建一个(嵌套创建目录)

### 例子
```sh
$ mkdir -p -m 700 test
```

# mkfs

# mount

# ncdu
创建稀疏文件

# netstat
### 语法
* `-u` 
* `-l` 
* `-n` 
* `-t` 
* `-p` 

# nohub
nohup命令不会自动把进程变为后台任务, 使用时所以必须加上`&`符号

# pandoc
### 例子
```sh
# 将markdown转换为html
$ pandoc -s a.md -o a.html
```

# pgrep
### 语法
**`pgrep [-l] [-U username] [-t tty_name] <progress_name>`**
* `-l` 列出进程的名称
* `-U` 根据进程所属的用户名进行查找
* `-t` 根据进程所在的终端进行查找

### 例子
```sh
# 列出进程名
$ pgrep -l "log"

# 根据用户名列出进程
$ pgrep -l -U teacher -t tty1
```

# pkill
### 语法
* `-f` 

# ps
### 语法
**`ps -aux`**
* `a` 显示当前终端下的所有进程信息
* `u` 使用以用户为主的格式输出进程信息
* `x` 显示当前用户在所有终端下的进程信息

### 例子
**VSZ(Virtual Memory Size)`**:  It includes all memory that the process can access, including memory that is swapped out, memory that is allocated, but not used, and memory that is from shared libraries.  
**RSS(Resident Set Size)**: used to show how much memory is allocated to that process and is in RAM. It does not include memory that is swapped out.  

<br>

`STAT` 由两个字符组成的状态码, 用于表示当前进程的状态  
第一个字符如下:  

缩写 | 状态                              | 状态     | 说明
:--- | :-------------------------------- | :------- | :--
D    | uninterruptible sleep(usually IO) | 不可中断 | 收到信号不唤醒和不可运行, 进程必须等待直到有中断发生
R    | runnable(on run queue)            | 运行     | 正在运行或在运行队列中等待
S    | sleeping                          | 中断     | 休眠中, 受阻, 在等待某个条件的形成或接受到信号
T    | traced or stopped                 | 停止     | 进程收到SIGSTOP, SIGSTP, SIGTIN, SIGTOU信号后停止运行运行
Z    | zombie                            | 僵死     | 进程已终止, 但进程描述符存在, 直到父进程调用wait4()系统调用后释放

第二个字符如下:  

缩写 | 说明
:--- | :---
<    | 进程正以高优先级运行
N    | 进程正以低优先级运行
L    | 进程在内存中存在锁定页面
s    | 进程是会话领导者(session leader)
l    | 进程是多线程的
\+   | 进程正在前台运行

<br>

```
用户名  PID  CPU百分比  物理内存  虚拟内存  实际内存  控制终端  状态   被触发启动的时间  已执行时间
USER    PID  %CPU       %MEM      VSZ       RSS       TTY       STAT   START             TIME COMMAND
root     1   0.0        0.3       225384    9216      ?         Ss     Mar27             0: 03 /sbin/init auto noprompt
root     2   0.0        0.0       0         0         ?         S      Mar27             0: 00 [kthreadd]
```

# pstree
### 语法
* `-p` 列出进程的PID号
* `-u` 列出进程对应的用户名
* `-a` 列出进程对应的完整命令

### 例子
```sh
$ pstree -aup
init,1
    ├─acpid,2866
    ├─atd,3060
    ├─auditd,2516
    │    ├─python,2518 /sbin/audispd
    │    └─{auditd},2517
    ├─automount,2842
```

# rsync

# runlevel
### 运行级别
一共有7种运行级别
- 0: 关机状态
- 1: 单用户模式
- 2: 不支持网络的字符界面多用户模式
- 3: 字符界面的完整多用户模式
- 4: 未分配使用
- 5: 图形界面的多用户模式(Desktop版本默认级别)
- 6: 重新启动

### inittab文件
```sh
# inittab文件的结构
x  : 5         : respawn : /etc/X11/prefdm -nodaemon 
id : runlevels : action  : process
```
运行级别存在于 */etc/inittab* 文件中, 修改 initdefault 行即可修改默认运行级别
1. id 也称标记字段, 由1-4个字符组成, 用以区别于其他行的配置, 所以id标记字段必须是唯一的, 用于在inittab文件中唯一标识一个配置记录
2. runlevels 运行级别字段, 用于指定该记录在哪些运行级别中运行, 取值数字0-6
3. action 动作类型字段, 动作类型字段描述了该行配置所对应的操作类别, 一般为固定值, 较常用的类型如下: 
4. process 用于指定该行配置所对应的实际操作, 可以是具体的命令, 脚本程序等

字段        | 说明
----------  | ----
initdefault | 设置初始化系统后默认进入的运行级别
sysinit     | 设置系统初始化的操作脚本
wait        | init进程将等待该行配置所对应的脚本操作完成后, 再继续执行其他操作
ctrlaltdel  | 设置当用户按下Ctrl+Alt+Delete组合键后的操作
powerfail   | 设置当系统收到断电信号(使用不间断电源)时采取何种动作
powerokwait | 设置当系统收到恢复供电信号时采取何种动作
respawn     | 一旦该行配置所对应的进程被终止, 则重新启动该进程. 比如用户可以登陆退出, 再登陆再退出

### 语法
* `runlevel` 查看运行级别, 分别显示: `切换前的运行级别 当前运行级别`

### 例子
```sh
$ runlevel
N 5

$ init 3

$ runlevel
5 3
```

# scp
### 语法
**`scp [-pr] [-P port] [[user@]host1: ]file1 [...] [[user@]host2: ]file2`**
* `-C` 允许压缩
* `-p` 保留原文件的修改时间, 访问时间和访问权限
* `-P port` 指定端口
* `-r` 递归复制整个目录

### 例子
```sh
# 从远程复制到本地
$ scp username@ip: remote_file local_file

# 从本地复制到远程
$ scp local_file username@ip: remote_file
```

# sed
### 语法
**`sed [-nefri] [command] file`**
- 选项
    - `-n` 只有经过处理的行才显示, 否则全部显示
    - `-i` 直接操作文件而不是输出
    - `-E` ERE, 默认为BRE
- 常用命令
    - `a` 新增
    - `c` 取代
    - `d` 删除
    - `i` 插入
    - `p` 显示
    - `s` 查找和替换

### 例子
```sh
$ sed '1a drink tea' a.txt       #第一行后增加字符串"drink tea"
$ sed '1,3a drink tea' a.txt     #第一行到第三行每行后增加字符串"drink tea"

$ sed '1c Hi' a.txt            #第一行代替为Hi

$ sed '2d' a.txt        #删除第二行, 只输出到控制台, 不改变文件
$ sed -i '2d' a.txt     #删除第二行, 改变文件

$ sed -n '1p' a.txt        #显示第一行
$ sed -n '$p' a.txt        #显示最后一行
$ sed -n '2,4p' a.txt      #显示第二三四行
$ sed -n '2,$p' a.txt      #显示第二行到最后一行
$ sed -n '2p;$p' a.txt     #显示第二行和最后一行
$ sed -n '1~2p' a.txt      #从第一行开始每隔两行打印(打印1 3 5 7 9...行)
$ sed -n '/aa/p' a.txt     #输出符合aa的行, 斜线内是一个模式pattern

$ sed 's/ruby/bird/' a.txt       #将第一个匹配到的ruby替换为bird
$ sed 's/ruby/bird/2' a.txt      #将第二个匹配到的ruby替换为bird
$ sed 's/ruby/bird/g' a.txt      #将所有ruby替换为bird(g表示global, 全局替换)
$ sed '1s/ruby/bird/g' a.txt     #只将第一行的ruby替换为bird
```

# seq
从1开始输出, 在shell脚本中的某些情况下代替自增

### 语法
**`seq [-w] <number>`**
* `-w` 位数不足的补0, 使输出等宽

### 例子
```sh
$ seq 6
1
2
3
4
5
6
```

# shift
若脚本参数多于9个, 就需要通过shift函数, 让第一个参数出队, 队列中顺序左移, 第10个参数入队到$9中, 因此shift可以处理脚本超过10个参数的情况

### 例子
```sh
COUNT = 0
NUMBER = $1
while [ $COUNT –lt  $NUMBER ]; do
    COUNT=`expr $COUNT + 1`
    TOKEN='$' $COUNT

    shift # $2 become $1
done
```

# shopt
显示和设置shell中的行为选项

### 例子
* `shopt` 显示所有的行为及其状态
* `shopt -s <behavior>` 打开行为
* `shopt -u <behavior>` 关闭行为

### 具体行为
- **huponexit** 退出session时是否把SIGHUP信号发给后台任务, 默认为 `OFF` 不发送, 即退出session后台任务继续执行

# sort
### 语法
**`sort [-bcdfimMnr][-o<输出文件>][-t<分隔字符>][+<起始栏位>-<结束栏位>][文件]`**
* `-b` 忽略空格, 以第一个可见字符排序
* `-h` `--human-numeric-sort` 相当与`-h`的升级版, 还包括进制排序, 例如2K排在1G前面
* `-k F[.C][OPTS][,F[.C][OPTS]]` `--key` 指定字段进行排序, 如果不设置end部分则认定end为行尾
    - `n` 按照自然数值排序
    - `r` 降序
    - `b` 忽略空白
    - `f` 忽略大小写
    - `i` 忽略不可打印字符
* `-n` `--numeric-sort` 以自然数值排序(例如将5排在10前面)
* `-o <file path>` 将结果输出到文件
* `-r` `--reverse` 降序(默认升序)
* `-s` 稳定排序
* `-t` `--field-separator` 指定分隔符
* `-u` `--unique` 去掉重复行(即使不是相邻两行也可以)

### 例子
```sh
# 以冒号为分隔符, 根据第二个字段的自然数值进行排序
$ sort -n -k 2 -t ':' a.txt

# 根据第二个字段排序, 值相同的情况根据第三个字段排序
$ sort -t ':' -k 2 -k 3 a.txt

# 根据第三个字段降序排序, 值相同则根据第二个字段升序排序
$ sort -t ':' -k 3r -k 2 a.txt

# 根据第一个字段的第二个字符到第四个字符排序开始排序
$ sort -t ':' -k 1.2,1.4 a.txt

# 只根据地一个字段的第三个字符排序, 相同则根据第三个字段排序
$ sort -t ':' -k 1.3,1.3 -k 3 a.txt

# 以第二个域为主关键字, 第一个域为次关键字进行排序
$ sort -k1, 1 | sort -s -k2, 2
```

# source
在当前的shell环境执行脚本, `source file.sh`可缩写为`. file.sh`(脚本无需执行权限)  
执行脚本`./file.sh` `bash file.txt`是在子shell中执行, 不会影响到父shell  

# tail
### 语法
* `-c <number>` 显示最后number个字节
* `-f` 循环读取, 可以上下滚动查看内容, 退出之后有残留信息
* `-<number>` 显示文件最后number行
* `+<number>` 从第number行开始显示
* `-n <number>` 显示文件最后number行
* `-n +<number>` 从第number行开始显示
* `-n -<number>` 显示文件最后number行

# tar
### 语法
* `-c` 建立打包文件
* `-C` 指定解压路径
* `-f` 指定打包文件名
* `-j` 使用bz2压缩或解压
* `-J` 使用xz压缩或解压
* `-t` 列出打包文件的内容
* `-v` 显示指令执行过程
* `-x` 从打包文件中提取文件
* `-z` 使用gzip压缩或解压

### 例子
```sh
# 解压并指定路径
$ tar -zxvf jdk.tar.gz -C /opt/jdk/

# 创建压缩文件ziped_documents.tgz
$ tar -zcvf ziped_documents.tgz ~/Documents
```

# tee
从标准输入读取数据, 并将其输出到文件中  
对于输出重定向, 如果右边的文件存在的话就会清空文件再执行左边的命令将结果输出到文件, 可结合`tee`和管道解决此问题  
`test.sh |tee test.log`既能记录日志又能将日志输出到控制台  

### 语法
**`tee [-ai][文件...]`**
* `-a` 附加到文件的后面, 而非覆盖它
* `-i` 忽略中断信号

### 例子
```sh
# 将用户输入的数据同时保存到文件"file1"和"file2"中
$ tee file1 file2

# 将标准输入复制到文件
$ ls -al | tee file.txt
```

# top
* 按P键根据CPU占用情况对进程列表进行排序
* 按M键根据内存占用情况进行排序
* 按N键根据启动时间进行排序

### 例子
* `PR` 进程优先级
* `NI` 进程的 "nice value"(越高的nice value值表示优先级越低, 默认为0)
* `VIRT` 虚拟内存
* `RES` 驻留内存
* `SHR` 共享内存
* `S` 进程状态(D=可中断睡眠, R=运行中, S=睡眠, T=已跟踪或已停止, Z=僵死)
* `%CPU` 进程正在使用的CPU时间份额
* `%MEM` 进程正在使用的可用物理内存份额
* `TIME+` 进程启动后已经使用的总CPU时间(从启动到此时此刻)
* `COMMAND` 进程的命令行名称(已启动程序)

```sh
PID  用户名 优先级  NI 虚拟内存 物理内存 共享内存   状态 CPU 物理内存  运行时间    名称
PID  USER   PR    NI   VIRT    RES    SHR     S  %CPU %MEM    TIME+     COMMAND
3165 ypl    20    0   51320   4132   3392     R   6.2  0.1    0: 00.01  top
1    root   20    0  225528   9336   6740     S   0.0  0.3    0: 02.87  systemd
2    root   20    0       0      0      0     S   0.0  0.0    0: 00.02  kthreadd
```

# tr
只从输入流读取数据, 不读取文件

### 语法
* `tr <pattern1> <pattern2>` 使用pattern2取代pattern1
* `tr -s <pattern1> <pattern2>` 缩减连续重复的字符, 视为单个字符
* `tr -c <pattern1> <pattern2>` 反选, 使用pattern2取代非pattern1
* `tr -d <pattern>` 删除pattern

### 例子
```sh
# 小写转换为大写
$ echo Hello There | tr [:lower:] [:upper:]
$ echo Hello There | tr a-z A-Z

# 将CRLF转换为LF
$ tr '\r\n' '\n' file
$ tr -d '\r' file
```

# trap
### 语法
* `trap ' command' singal` 自定义进程收到系统发出的指定信号后, 将执行command, 而不会执行原操作
* `trap '' singal` 忽略信号的操作
* `trap '-' singal` 恢复原信号的操作

### 常用信号

信号    | 说明
------- | ----
SIGHUP  | 无须关闭进程而让其重读配置文件
SIGINT  | 中止正在运行的进程；相当于Ctrl+c
SIGQUIT | 相当于ctrl+\
SIGKILL | 强制杀死正在运行的进程
SIGTERM | 终止正在运行的进程（默认为15）
SIGCONT | 继续运行
SIGSTOP | 后台休眠

### 例子
```sh
# 打印0-9, ctrl+c不能终止, 而是输出指定的信息
trap 'echo press ctrl+c' 2
for ((i=0;i<10;i++));do
    sleep 1
    echo $i
done
```

# tree
### 语法
**`tree [-d] [-L n]`**
* `-d` 只列出目录
* `-L n` 递归深度

# truncate
创建稀疏文件

# type
判断命令到底是可执行文件, shell内置命令还是别名

### 语法
* `-f` 取消对函数的查找

### 例子
```sh
$ type cd
cd is a shell builtin

$ type find
find is /usr/bin/find

$ type git
git is hashed (/usr/bin/git)

$ type todo
todo is a function
todo ()
{
    . ~/todo.sh "$@"
}

$ type gst
gst is aliased to 'clear && git status -bs'
```

```sh
$ type -a pwd
pwd is a shell builtin
pwd is /bin/pwd
```

# ufw
### 例子
```sh
# 启用
$ sudo ufw enable

# 关闭
$ sudo ufw disable

# 查看防火墙状态
$ sudo ufw status

# 允许外部访问80端口
$ sudo ufw allow 80

# 禁止外部访问80 端口
$ sudo ufw delete allow 80

# 允许此IP访问所有的本机端口
$ sudo ufw allow from 192.168.1.1 
```

# uniq
检查及删除文本文件中重复出现的行列, **要求重复的行为相邻的行**

### 语法
**`uniq [-cdu] [输入文件] [输出文件]`**
* `-d, --repeated` 仅显示重复出现的行列
* `-u, --unique` 仅显示出一次的行列
* `-c, --count` 在每列旁边显示该行重复出现的次数
* `[输入文件]` 指定已排序好的文本文件. 如果不指定此项, 则从标准输入读取数据
* `[输出文件]` 指定输出的文件. 如果不指定此选项, 则将内容显示到标准输出设备

### 例子
```sh
# 对文本文件做集合交, 并, 差运算
$ sort a b | uniq > c      # a并b
$ sort a b | uniq -d > c   # a交b
$ sort a b | uniq -u > c   # a-b
```

```sh
# 去掉重复的行
$ uniq file

# 删除文件中重复出现的行, 并显示输出行重复的次数
$ uniq -c file
```

# uptime
### 例子
```sh
$ uptime
23:41:47 up  2:40,  1 user,  load average: 0.06, 0.31, 0.31
```

# whereis
whereis命令用于查找文件, 只能用于查找二进制文件, 源代码文件和man手册页

### 语法
**`whereis [-bfmsu][-B <目录>...][-M <目录>...][-S <目录>...][文件...]`**
* `-b` 只查找二进制文件
* `-B<目录>` 只在设置的目录下查找二进制文件
* `-m` 只查找说明文件
* `-M<目录>` 只在设置的目录下查找说明文件
* `-s` 只查找原始代码文件
* `-S<目录>` 只在设置的目录下查找原始代码文件

# xargs
可以控制每行参数个数(-L)和最大并行数(-P)

### 语法
* `-i` 

### 例子
如果你不确定它们是否会按你想的那样工作, 先使用 xargs echo 查看一下. 此外, 使用 -I{} 会很方便. 例如:
```
find . -name '*.py' | xargs grep some_function
    cat hosts | xargs -I{} ssh root@{} hostname
```

# xmlstarlet
处理XMl
