- [解决显卡问题](#解决显卡问题)
- [更新源](#更新源)
- [忽略大小写](#忽略大小写)
- [Java](#java)



******************************************************************************************
******************************************************************************************



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
