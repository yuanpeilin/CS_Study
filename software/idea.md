# Keymap

path                                        | shortcut           | comment
:------------------------------------------ | :----------------- | :------
Editor actions -> Duplicate entire lines    | Alt + Shift + Down | 
Main menu -> Edit -> Find -> Find In Path   | Ctrl + H           | 全局查找
Main menu -> View -> Parameter info         | Ctrl + Alt + /     | 提示某个方法参数的类型
Main menu -> View -> Quick documentation    | F2                 | 查看文档
Main menu -> View -> Recent files           | Ctrl + E           | 最近使用的文件
Main menu -> Code -> Folding -> Expand all  | Ctrl + [           | 
Main menu -> Navigate -> Go To File         | Ctrl + Shift + R   | 
Main menu -> Navigate -> Back & Forward     | Alt + Left         | 返回上次编辑的地方
Main menu -> Navigate -> File structure     | Ctrl + O           | 查看类结构(方法, 变量等)
Main menu -> Navigate -> Method hierarchy   | Ctrl + Alt + H     | 查看方法在哪被调用
Main menu -> Code -> Generate               | Alt + Insert       | 
Main menu -> Run -> Run                     | F9                 | 
Main menu -> Run -> Debug                   | F10                | 
Main menu -> VCS -> Commit                  | ALT + C            | 
Main menu -> Refactor -> Rename             | Alt + Shift + R    | 
Main menu -> Window -> Editor tabs -> Close | Ctrl + W           | 
Tool Windows -> Terminal                    | Ctrl + \`          | 
Plug-ins -> UML -> Show uml popup           | Ctrl + U           | 
Other -> Second basic completion            | Alt + /            | 

# Settings
* Appearance & Behavior
    * Appearance 勾选show memory indicator
    * System Settings 取消勾选Reopen last project on startup
* Editor
    * General 勾选Change font size with Ctrl+Mouse Wheel
        * Auto import 在Insert import on paste选择ask, 勾选Add unambiguous imports onthe fly和optimize imports on the fly
        * Appearance 勾选Show method separators
        * Code completing 取消勾选Match case
        * Editor tabs 取消勾选Show tabs in one row
    * Font
        * 设置字体
    * Color Scheme
        * General 在Text -> Default Text中设置背景
        * Console font 设置控制台等字体
    * Code Style
        * Java 取消勾选Use tab character
    * File and code templates
        * 设置javadoc注释
    * File Encoding
        * 设置UTF-8编码
    * Live Template
        ```java
        // syso
        System.out.println($END$);
        ```
        ```java
        // time
        long _past = System.currentTimeMillis();
        $END$
        long _now = System.currentTimeMillis();
        System.out.println(_now - _past);
        ```
* Build Execution Deploymnt
    * Compiler 勾选Build project automatically
* Tools
    * Terminal Shell Path改为 Git\\bin\\bash.exe

# tomcat乱码
* Help -> Edit Custom VM Options添加`-Dfile.encoding=UTF-8`
* Edit Configurations(Tomcat)的Server标签中的VM options添加`-Dfile.encoding=UTF-8`
* $IDEA_HOME/bin/idea64.exe.vmoptions添加`-Dfile.encoding=UTF-8`
* Edit Configurations(Tomcat)的Start Up/Connection标签中添加`JAVA_TOOL_OPTIONS:-Dfile.encoding=UTF-8`键值对
