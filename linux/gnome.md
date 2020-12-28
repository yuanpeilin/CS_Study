# 安装初始软件
* dconf
* gnome-tweak-tool
* chrome-gnome-shell

# [安装插件](https://extensions.gnome.org)
* dash to panel
* dash to dock(Ubuntu Dock)
* Interner speed meter
* clipboard indicator
* extensions
* user themes

# Tweaks
* 关闭动画
    * Appearance: Animation改为OFF
* 更换主题
    * Appearance -> Themes -> Applications: 改为Adwaita

# dconf
* 将All Application放在最左边
    * `org -> gnome -> shell -> extension -> dash-to-dock` show-apps-at-top改为ON
* 单击最小化
    * `org -> gnome -> shell -> extension -> dash-to-dock` click-action改为minimize-or-overview

# 固定idea到Dock
1. `cd \~/.local/share/applications/`
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