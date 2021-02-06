# 目录
* **a** [`at`](#at)
* **b** [`bg`](#bg)
* **c** [`cat`](#cat) [`chattr`](#chattr) [`chgrp`](#chgrp) [`chkconfig`](#chkconfig) [`chmod`](#chmod) [`chown`](#chown) [`corntab`](#corntab) [`cp`](#cp) [`cut`](#cut)
* **d** [`df`](#df) [`disown`](#disown) [`du`](#du)
* **e** [`echo`](#echo) [`egrep`](#egrep) [`export`](#export)
* **f** [`fallocate`](#fallocate) [`fdisk`](#fdisk) [`fg`](#fg) [`file`](#file) [`fim`](#fim) [`find`](#find) [`free`](#free)
* **g** [`grep`](#grep) [`gzip`](#gzip)
* **h** [`head`](#head)
* **i** [`ifconfig`](#ifconfig) [`imagemagick`](#imagemagick)
* **j** [`jobs`](#jobs) [`join`](#join) [`jq`](#jq)
* **k** [`kill`](#kill)
* **l** [`less`](#less) [`ln`](#ln) [`locate`](#locate) [`ls`](#ls) [`lsattr`](#lsattr) [`lsblk`](#lsblk) [`lsof`](#lsof)
* **m** [`md5sum`](#md5sum) [`mkdir`](#mkdir) [`mkfs`](#mkfs) [`mount`](#mount)
* **n** [`ncdu`](#ncdu) [`netstat`](#netstat) [`nohub`](#nohub)
* **p** [`pandoc`](#pandoc) [`pgrep`](#pgrep) [`pkill`](#pkill) [`ps`](#ps) [`pstree`](#pstree)
* **r** [`rsync`](#rsync) [`runlevel`](#runlevel)
* **s** [`scp`](#scp) [`sed`](#sed) [`shopt`](#shopt) [`sort`](#sort) [`ssh`](#ssh)
* **t** [`tail`](#tail) [`tar`](#tar) [`tee`](#tee) [`top`](#top) [`tree`](#tree) [`truncate`](#truncate) [`type`](#type)
* **u** [`ufw`](#ufw) [`uniq`](#uniq)
* **w** [`whereis`](#whereis)
* **x** [`xargs`](#xargs) [`xmlstarlet`](#xmlstarlet)



*****************************************************************************
*****************************************************************************



# at
定时启动任务, 属于一次性计划任务, 位于 */etc/init.d/atd*

### 语法
`at [HH:MM] [yyyy-mm-dd]`
* `-c <number>` 显示任务详情
* `-d <number>` 删除一个任务, 相当于`atrm`
* `-l` 列出当前任务, 相当于`atq`

### 例子
```sh
# 命令输入完成后使用Ctrl+D提交任务
at 23:45
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
`chkconfig [--add][--del][--list]<service_name>`
* `--add <service_name>` 增加httpd服务
* `--del <service_name>` 删除httpd服务
* `--list` 列出所有的系统服务
* `--list <service_name` 列出服务设置情况

<br>

`chkconfig [--level <等级代号>][系统服务][on/off/reset]`
* `--level <service_name> <runlevel> <on|off>` 设置服务的运行级别为on或off

### 例子
```sh
chkconfig --list network
network         0:关闭  1:关闭  2:启用  3:启用  4:启用  5:启用  6:关闭
```

```sh
chkconfig --list
acpid           0:关闭  1:关闭  2:关闭  3:启用  4:启用  5:启用  6:关闭
anacron         0:关闭  1:关闭  2:启用  3:关闭  4:启用  5:关闭  6:关闭
apmd            0:关闭  1:关闭  2:启用  3:启用  4:启用  5:启用  6:关闭
```

```sh
chkconfig --level 35 mysqld on
```

```sh
chkconfig --level httpd 2345 on
```

```sh
chkconfig --add httpd
```

# chmod
### 语法
* `-R` 对目前目录下的所有文件与子目录进行相同的权限变更

# chown
新文件所有者和新文件所属组可以省略一个, 但是冒号不能省

### 语法
`chown [新文件所有者]:[新文件所属组] FILE_NAME`
* `-R` 递归

# corntab
配置文件位于 */etc/init.d/crond*, RHEL将任务存储在 */var/spool/cron/用户名* , Debian将任务存储在 */var/spool/cron/crontabs/用户名* 

### 说明
不使用`*`则不会重复执行, 例如`1 * * * *`只会在每个小时的第一分钟执行, `1/* * * * *`才表示每分钟执行一次
* `*` 表示该范围内的任意时间, 表示间隔的多个不连续时间点
* `-` 表示一个连续的时间范围,如`1-4`表示整数1,2,3,4
* `/` 指定间隔的时间频率,如在日期字段中的`*/3`表示每隔3天

```
分钟  小时   天    月  星期    命令
0     17      *    *   1-5     周一到周五每天17: 00
30    8       *    *   1,3,5   每周一、三、五的8点30分
0     8-18/2  *    *   *       8点到18点之间每隔2小时
0     *       */3  *   *       每隔3天
```

```sh
cat /etc/crontab

SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root
HOME=/
# run-parts
01 * * * * root run-parts /etc/cron.hourly
02 4 * * * root run-parts /etc/cron.daily
22 4 * * 0 root run-parts /etc/cron.weekly
42 4 1 * * root run-parts /etc/cron.monthly
```

### 语法
* `crontab  -e  [-u  用户名]` 编辑计划任务(会自动编辑 */var/spool/cron/用户名* 文件)
* `crontab  -l  [-u  用户名]` 查看计划任务
* `crontab  -r  [-u  用户名]` 删除计划任务

# cp
### 语法
* `-r` 复制该目录下所有的子目录和文件
* `-p` 原封不动的拷贝权限、时间戳等, 前提是用户对文件有写权限
* `-d` 复制是链接文件的话, 复制此链接. 否则不加此参数的话, 复制的是链接指向的文件
* `-a` 相当与`-dpr`

# cut
### 语法
* `-d` 指定分隔符, 默认分隔符为tab键
* `-c 范围` 显示范围的字符
* `-f 范围` 显示范围的字段
* `--complement` 显示指定字段/字符/字节之外的列

### 例子
```sh
# 显示第2, 3列
cut -d " " -f 2,3 file

# 显示第2列及之后内容
cut -d " " -f 2- file

# 显示除了第2列及之后的内容(只显示第一列)
cut -d " " -f 2- --complement file
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
使一个后台进程持续运行

# du
用于显示目录或文件的大小, 无参数递归显示当前目录下所有文件的大小

### 语法
`du [-hHs] [--max-depth=<number>] [directory]`
* `-h` 以KB, MB, GB为单位
* `-H` 类似`-h`, 以1000为换算单位
* `-s` 仅显示总计

### 例子
```sh
# 显示当前目录的大小
du -hs

# 显示当前下目录下所有目录及文件的大小
du -hs *
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
echo -e "\e[31;43;1m SomeWord \e[0m"
echo -e "\e[01;34m SomeWord \e[00m"
echo -e "\033[01;34m SomeWord \033[00m"
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
```

# egrep
### 语法
* `-i` 
* `-o` 
* `-v` 
* `-A` 
* `-B` 
* `-C` 

# export
输出环境变量, 不接变量名输出所有环境变量, 仅当前session有效

### 语法
`export <variable name>`

# fallocate
创建空文件

# fdisk

# fg
将处于后台的进程恢复到前台运行, 需指定任务序号

# file
查看文件详细信息(主要用来查看编码)

### 例子
```sh
file shell.md

shell.md: exported SGML document, UTF-8 Unicode text
```

# fim
### 例子
```sh
# 查看图片
fim a.jpg

# 以ASCII码形式查看图片
fim -t a.jpg
```

# find
不设置查找范围参数, 则find命令将在当前目录下查找子目录与文件

### 语法
`find [查找范围] [查找条件] [动作]`
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
find / -mtime +7

# 四天前那天, 内容发生改变的文件
find / -mtime 4

# 七天之内, 内容发生改变的文件
find / -mtime -7
```

* 根据大小进行查找
```sh
# 查找小于3k的文件
find / -size -3k -ls

# 查找大小为10M的文件
find / -size 10M -ls

# 查找大于100字节的文件
find / -size +100c -ls
```

* 根据所属用户进行查找
```sh
# 在根目录下找到文件拥有者为root的文件
find / -user root -ls
find / -user 0 -ls
```

* 根据访问权限进行查找
```sh
# 找到制定权限的文件
find / -perm 754 -ls
```

* 多个条件 使用多个条件时, 要用圆括号, 且要使用\进行转义
    * `-a` 与
    * `-o` 或
    * `!` 非
```sh
find / \( -size +1k -a -size -10M -a -type f \) -ls;
```

* 动作选项
    * `-exec`表示动作的开始
    * `{}`表示查找到的文件
    * `\;`表示动作的结束
```sh
# 找到指定文件并删除
$ find / \( -size +1k -a -size -10M -a -type f \) -exec rm -rf {} \;
```

# free
* `-h` 以MB, GB为单位

# grep
### 语法
* `-i` 忽略大小写
* `-r` 递归, 搜索目录
* `-E` extended regexp
* `-v` `--invert-match` 对结果取反
`-o` 
`-A` 
`-B` 
`-C` 

# gzip
### 例子
```sh
# 解压文件
gzip -d test.gz

# 调节压缩比(默认为6. 9为最大压缩比, 压缩的文件最小)
gzip -9 test.txt
```

# head
### 语法
* `-c<数目>` 显示的字节数
* `-n<行数>` 显示的行数


# ifconfig

# imagemagick
### 例子
```sh
# 获取图片信息
identify test.jpg

# 转化图片格式
convert  test.jpg  test.png

# 改变图像大小
convert -resize 1024x768 test.jpg test_modify.jpg

# 设置图像质量, 质量值为0-100之间的数值, 数字越大, 质量越好. 一般指定70-80
convert -resize 1024x768 -quality 75 test.jpg test_modify.jpg

# 缩放图片
convert -sample 50%x50% test.jpg test_modify.jpg
```

# jobs
查看处于后台的任务列表

### 例子
```sh
jobs

[1]-  Stopped   cp /dev/cdrom mycd.iso
[2]+  Stopped   top
```

# join

# jq
处理XMl

# kill
默认的信号为SIGTERM(15)

### 例子
```sh
# 强制杀死进程
kill -9 PID
```

# less
### 语法
* `-N` 显示行号
* `-m` 百分比
* `+F` 持续读取, 窗口被锁定无法上下滚动, 退出之后无残留信息

# ln
### 语法
`ln [-s] [链接指向的文件] [链接名]`

# locate
在数据库(/var/lib/mlocate/mlocate.db)中查找符合条件的文档, 更新数据库使用`updatedb`

# ls
### 语法
`ls [-alhtAi] [name...]`
* `-i` 查看inode
* `-t` 将文件依建立时间的先后次序列出
* `-A` 同\-a, 但不列出`.`(目前目录)及`..`(父目录)
* `-r` 将排序结果反向输出
* `-R` 递归, 列出所有文件包括文件夹中的文件
* `-F` 文件夹后会有`/`

### 例子
文件类型
* d 目录文件
* \- 普通文件
* c 字符设备文件
* b 块设备文件
* l 符号链接文件

```
类型和权限 : 文件硬链接数目 : 文件拥有者 : 文件从属用户组 : 文件大小 : 时间戳 :        文件名
drwxr-xr-x   2                ypl          ypl              4096       Jan 13 20: 04   Desktop
-rw-------   1                ypl          ypl              32         May 28 13: 53   .lesshst
-rw-r--r--   1                ypl          ypl              807        May 12 17: 54   .profile
drwx------   1                ypl          ypl              4096       May 12 18: 40   .ssh
```

# lsattr

# lsblk

# lsof
查看开启的套接字和文件

### 例子
```sh
netstat -lntp
```

# md5sum

# mkdir
### 语法
* `-m` 设置存取权限
* `-p` 确保目录名称存在, 不存在的就建一个(嵌套创建目录)

### 例子
```sh
mkdir -p -m 700 test
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

# pandoc
Markdown, HTML, 以及所有文档格式之间的转换

# pgrep
### 语法
`pgrep [-l] [-U username] [-t tty_name] <progress_name>`
* `-l` 列出进程的名称
* `-U` 根据进程所属的用户名进行查找
* `-t` 根据进程所在的终端进行查找

### 例子
```sh
# 列出进程名
pgrep -l "log"

# 根据用户名列出进程
pgrep -l -U teacher -t tty1
```

# pkill
### 语法
* `-f` 

# ps
### 语法
`ps -aux`
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
pstree -aup

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
* 0: 关机状态
* 1: 单用户模式
* 2: 不支持网络的字符界面多用户模式
* 3: 字符界面的完整多用户模式
* 4: 未分配使用
* 5: 图形界面的多用户模式(Desktop版本默认级别)
* 6: 重新启动

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
4. process 用于指定该行配置所对应的实际操作, 可以是具体的命令、脚本程序等

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
runlevel
N 5

init 3

runlevel
5 3
```

# scp
### 语法
`scp [-pr] [-P port] [[user@]host1: ]file1 [...] [[user@]host2: ]file2`
* `-p` 保留原文件的修改时间, 访问时间和访问权限
* `-r` 递归复制整个目录

### 例子
```sh
# 从远程复制到本地
scp username@ip: remote_file local_file

# 从本地复制到远程
scp local_file username@ip: remote_file
```

# sed
### 语法
**`sed [-nefri] [command] file`**
* 选项
    - `-n` 只有经过处理的行才显示, 否则全部显示
    - `-i` 直接操作文件而不是输出
* 常用命令
    - `a` 新增
    - `c` 取代
    - `d` 删除
    - `i` 插入
    - `p` 显示
    - `s` 查找和替换

### 例子
```sh
sed '1a drink tea' a.txt       #第一行后增加字符串"drink tea"
sed '1,3a drink tea' a.txt     #第一行到第三行每行后增加字符串"drink tea"

sed '1c Hi' a.txt            #第一行代替为Hi

sed '2d' a.txt        #删除第二行, 只输出到控制台, 不改变文件
sed -i '2d' a.txt     #删除第二行, 改变文件

sed -n '1p' a.txt        #显示第一行
sed -n '$p' a.txt        #显示最后一行
sed -n '2,4p' a.txt      #显示第二三四行
sed -n '2,$p' a.txt      #显示第二行到最后一行
sed -n '2p;$p' a.txt     #显示第二行和最后一行
sed -n '1~2p' a.txt      #从第一行开始每隔两行打印(打印1 3 5 7 9...行)
sed -n '/aa/p' a.txt     #输出符合aa的行, 斜线内是一个模式pattern

sed 's/ruby/bird/' a.txt       #将第一个匹配到的ruby替换为bird
sed 's/ruby/bird/2' a.txt      #将第二个匹配到的ruby替换为bird
sed 's/ruby/bird/g' a.txt      #将所有ruby替换为bird(g表示global, 全局替换)
sed '1s/ruby/bird/g' a.txt     #只将第一行的ruby替换为bird
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

# sort
### 语法
`sort [-bcdfimMnr][-o<输出文件>][-t<分隔字符>][+<起始栏位>-<结束栏位>][文件]`
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
sort -n -k 2 -t ':' a.txt

# 根据第二个字段排序, 值相同的情况根据第三个字段排序
sort -t ':' -k 2 -k 3 a.txt

# 根据第三个字段降序排序, 值相同则根据第二个字段升序排序
sort -t ':' -k 3r -k 2 a.txt

# 根据第一个字段的第二个字符到第四个字符排序开始排序
sort -t ':' -k 1.2,1.4 a.txt

# 只根据地一个字段的第三个字符排序, 相同则根据第三个字段排序
sort -t ':' -k 1.3,1.3 -k 3 a.txt

# 以第二个域为主关键字, 第一个域为次关键字进行排序
sort -k1, 1 | sort -s -k2, 2
```

# ssh
### 语法
`-t` 分配TTY, 执行远程命令使用

### 配置
配置文件位于 */etc/ssh/sshd_config*
```sh
PermitRootLogin no # 禁止root登录
ClientAliveInterval 600 # 断线重连时间
MaxAuthTries 3 # 最大尝试次数
PasswordAuthentication no # 禁止密码登录
PermitEmptyPasswords no # 禁止空白密码登录
PubkeyAuthentication yes # 使用密钥登录
```

# tail
### 语法
`-f` 循环读取, 可以上下滚动查看内容, 退出之后有残留信息
`-n <行数>` 显示文件的尾部 n 行内容
`-c <数目>` 显示的字节数

### 例子
```sh
# 显示文件 notes.log 的内容, 从第 20 行至文件末尾
tail +20 notes.log

# 显示文件 notes.log 的最后 10 个字符
tail -c 10 notes.log
```

# tar
### 语法
* `-f` 指定打包文件名
* `-z` 通过gzip指令处理打包文件
* `-j` 通过bz2指令处理打包文件
* `-c` 建立打包文件
* `-x` 从打包文件中还原文件
* `-v` 显示指令执行过程
* `-t` 列出打包文件的内容
* `-A` 合并打包文件
* `-r` 向打包文件中增加文件
* `-C` 指定解压路径
* `--delete` 从打包文件中删除指定的文件

### 例子
```sh
# 多个文件打包成一个文件
tar -cf test.tar test1.txt test2.txt test3.txt

# 查看打包文件的内容
tar -tf test.tar

# 删除打包文件中的指定文件
tar -f test.tar --delete test3.txt

# 将test01.tar合并到test.tar中
tar -f test.tar -A test01.tar

# 向打包文件中增加文件
tar -f test.tar -r test4.txt
```

# tee
从标准输入读取数据, 并将其输出到文件中. 对于重定向`>`, 如果右边的文件存在的话就会清空文件再执行左边的命令将结果输出到文件, 可结合`tee`和管道解决此问题

### 语法
`tee [-ai][文件...]`
* `-a` 附加到文件的后面, 而非覆盖它
* `-i` 忽略中断信号

### 例子
```sh
# 将用户输入的数据同时保存到文件"file1"和"file2"中
tee file1 file2

# 将标准输入复制到文件
ls -al | tee file.txt
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

# tree
### 语法
`tree [-d] [-L n]`
* `-d` 只列出目录
* `-L n` 递归深度

# truncate
创建稀疏文件

# type
判断命令到底是可执行文件、shell内置命令还是别名

### 例子
```sh
type mv

mv is /bin/mv
```

```sh
type ls

ls is aliased to `ls --color=auto'
```

# ufw
### 例子
```sh
# 启用
sudo ufw enable

# 关闭
sudo ufw disable

# 查看防火墙状态
sudo ufw status

# 允许外部访问80端口
sudo ufw allow 80

# 禁止外部访问80 端口
sudo ufw delete allow 80

# 允许此IP访问所有的本机端口
sudo ufw allow from 192.168.1.1 
```

# uniq
检查及删除文本文件中重复出现的行列, **要求重复的行为相邻的行**

### 语法
`uniq [-cdu] [输入文件] [输出文件]`
* `-d, --repeated` 仅显示重复出现的行列
* `-u, --unique` 仅显示出一次的行列
* `-c, --count` 在每列旁边显示该行重复出现的次数
* `[输入文件]` 指定已排序好的文本文件. 如果不指定此项, 则从标准输入读取数据
* `[输出文件]` 指定输出的文件. 如果不指定此选项, 则将内容显示到标准输出设备

### 例子
```sh
# 对文本文件做集合交、并、差运算
sort a b | uniq > c      # a并b
sort a b | uniq -d > c   # a交b
sort a b | uniq -u > c   # a-b
```

```sh
# 去掉重复的行
uniq file

# 删除文件中重复出现的行, 并显示输出行重复的次数
uniq -c file
```

# whereis
whereis命令用于查找文件, 只能用于查找二进制文件、源代码文件和man手册页

### 语法
`whereis [-bfmsu][-B <目录>...][-M <目录>...][-S <目录>...][文件...]`
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
