- [彩色输出](#彩色输出)
    - [示例](#示例)
    - [颜色表](#颜色表)
    - [字体效果表](#字体效果表)
- [解决显卡问题](#解决显卡问题)
- [更新源](#更新源)
- [忽略大小写](#忽略大小写)
- [Java](#java)



******************************************************************************************
******************************************************************************************



# 彩色输出
字体颜色, 背景色, 效果没有先后之分

### 示例
```sh
echo -e "\e[31;43;1m SomeWord \e[0m"
echo -e "\e[01;34m SomeWord \e[00m"
echo -e "\033[01;34m SomeWord \033[00m"
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
```

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

### 字体效果表
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

# 解决显卡问题
* 试用之前
    * 选中try ubuntu, 按e. 在`splash`和`---`之间加上 `nouveau.modeset=0`
* 安装完成之后
    * 选中ubuntu, 按e. 在`splash`和`---`之间加上 `nouveau.modeset=0`
* 安装显卡
    * `ubuntu-drivers devices`
    * `sudo ubuntu-drivers autoinstall`

# 更新源
编辑 /etc/apt/sources.list  
```
deb http://ftp.sjtu.edu.cn/ubuntu/ bionic main restricted
deb http://ftp.sjtu.edu.cn/ubuntu/ bionic-updates main restricted
deb http://ftp.sjtu.edu.cn/ubuntu/ bionic universe
deb http://ftp.sjtu.edu.cn/ubuntu/ bionic-updates universe
deb http://ftp.sjtu.edu.cn/ubuntu/ bionic multiverse
deb http://ftp.sjtu.edu.cn/ubuntu/ bionic-updates multiverse
deb http://ftp.sjtu.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb http://ftp.sjtu.edu.cn/ubuntu/ bionic-security main restricted
deb http://ftp.sjtu.edu.cn/ubuntu/ bionic-security universe
deb http://ftp.sjtu.edu.cn/ubuntu/ bionic-security multiverse
```

# 忽略大小写
编辑/etc/inputrc文件
```
set completion-ignore-case on
```

# Java
```sh
# 编辑/etc/profile文件
export  JAVA_HOME=/opt/jdk/jdk-11.0.2
export  CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
export  PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
export  JRE_HOME=$JAVA_HOME/jre
```
