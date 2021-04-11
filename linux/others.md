- [快捷键](#快捷键)
- [解决双显卡问题](#解决双显卡问题)
- [更新源](#更新源)
- [安装显卡](#安装显卡)
- [Software](#software)
- [忽略大小写](#忽略大小写)
- [输入法](#输入法)
- [安装插件](#安装插件)
- [Tweaks](#tweaks)
- [dconf](#dconf)
- [安装Java](#安装java)
- [固定idea到Dock](#固定idea到dock)
- [切换桌面环境](#切换桌面环境)
- [查看系统配置](#查看系统配置)


**********************************************************************************************



# 快捷键
Keymap                 | Description
---------------------- | -----------
Ctrl + U               | 删除整行
Ctrl + K               | 删除光标到行尾的字符
Alt + PrtScn           | 当前窗口截屏
Shift + PrtScn         | 自由选择矩形截屏
Ctrl + PrtScn          | 全屏截图
Ctrl + Alt + Shift + R | 录屏

# 解决双显卡问题
* **试用之前** 选中try ubuntu, 按e. 在`splash`和`---`之间加上 `nouveau.modeset=0`
* **安装完成之后** 选中ubuntu, 按e. 在`splash`和`---`之间加上 `nouveau.modeset=0`

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
deb http://archive.canonical.com/ubuntu bionic partner
```

```
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic universe
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates universe
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security universe
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security multiverse
deb http://archive.canonical.com/ubuntu bionic partner
```

# 安装显卡
* `ubuntu-drivers devices`
* `sudo ubuntu-drivers autoinstall`

# Software
* shadowsocks
* chrome-gnome-shell
* chromium-browser
* vim
* git
* htop
* tree
* net-tools
* dconf-editor
* gnome-tweak-toolf
* fcitx
* fcitx-googlepinyin

# 忽略大小写
编辑/etc/inputrc文件

```
set completion-ignore-case on
```

# 输入法
* 安装fcitx
* 选择输入法 `im-config`
* 安装输入法fcitx-googlepinyin
* 重启
* 添加输入法 `fcitx-config-gtk3`

# [安装插件](https://extensions.gnome.org)
* dash to panel
* dash to dock(Ubuntu Dock)
* Interner speed meter
* clipboard indicator
* user themes


# Tweaks
* 关闭动画 Appearance: Animation改为OFF
* 更换主题 Appearance -> Themes -> Applications: 改为Adwaita

# dconf
* **org -> gnome -> shell -> extension -> dash-to-dock**
    - 单击最小化 click-action改为minimize-or-overview
    - 更改Dock位置 dock-position改为BOTTOM
    - 多显示器分离 isolate-monitor改为ON
    - 多workspace分离 isolate-workspace改为ON
    - 所有显示器显示Dock mutil-monitor改为ON
    - 将All Application放在最左边 show-apps-at-top改为ON

# 安装Java
```sh
export  JAVA_HOME=/opt/jdk/jdk-11.0.2
export  CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
export  PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
export  JRE_HOME=$JAVA_HOME/jre
```

# 固定idea到Dock
1. `cd ~/.local/share/applications/`
2. `vim idea.desktop`
```
[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=IDEA
Exec=/opt/idea/idea-IU-191.7479.19/bin/idea.sh
Icon=/opt/idea/idea-IU-191.7479.19/bin/idea.svg
NoDisplay=false
StartupWMClass=sun-awt-X11-XFramePeer
```
3. 把刚生成的应用图标拖到Dock中
4. 启动应用
5. `xprop | grep WM_CLASS` 并将十字准心对准idea的界面, 会有如下信息
```sh
ypl@GL62M:~/.local/share/applications$ xprop |grep WM_CLASS
WM_CLASS(STRING) = "sun-awt-X11-XFramePeer", "jetbrains-idea"
```
6. 将第一个字符串赋给StartupWMClass
7. 保存退出, 重启应用

# 切换桌面环境
```sh
# ssdm表示KDE gdm3表示Gnome
sudo dpkg-reconfigure gdm3
```

# 查看系统配置
```sh
# 查看操作系统详细信息, issue比较简洁
ls /etc | grep release | xargs cat
ls /etc | grep issue | xargs cat
```

```sh
# 查看内核版本
uname -a
uname -r

# 查看CPU详细信息, 名称, 物理个数, 核心数, 线程数
lscpu
grep 'model name' /proc/cpuinfo | sort -u
grep 'physical id' /proc/cpuinfo | sort -u | wc -l
grep 'core id' /proc/cpuinfo | sort -u | wc -l
grep 'processor' /proc/cpuinfo | sort -u | wc -l
```
