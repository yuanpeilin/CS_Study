- [模式](#模式)
    - [normal模式](#normal模式)
    - [insert模式](#insert模式)
    - [command模式](#command模式)
    - [visual模式](#visual模式)
- [分屏](#分屏)
    - [启动分屏](#启动分屏)
    - [分屏快捷键](#分屏快捷键)
- [分页](#分页)
    - [启动分页](#启动分页)
    - [分页快捷键](#分页快捷键)
- [查找替换](#查找替换)
    - [查找](#查找)
    - [替换](#替换)
- [初始配置](#初始配置)
    - [需要的插件](#需要的插件)
    - [手动安装插件](#手动安装插件)
    - [自动安装插件(vim-plug)](#自动安装插件vim-plug)
    - [vimrc](#vimrc)



******************************************************************************************************



# 模式
* normal模式(esc)
* insert模式(i)
* command模式(:)
* visual模式(v字符选取, V行选取)

### normal模式
* 光标移动

Symbol | DESCRIPTION
------ | -----------
`0`    | 到行头
`$`    | 到行尾
`^`    | 到行头(到本行头第一个不是blank字符的位置)
`g_`   | 到行尾(到本行尾最后一个不是blank字符的位置)
`gg`   | 到第一行
`G`    | 到最后一行
`NG`   | 到第N行
`%`    | 匹配括号
`w`    | 到下一个单词的开头
`e`    | 到下一个单词的结尾
`*`    | 匹配光标当前所在的单词, 下一个匹配单词
`#`    | 匹配光标当前所在的单词, 上一个匹配单词
`H`    | 将光标移动到当前显示页的第一行
`L`    | 将光标移动到当前显示页的最后一行


* 翻页

Symbol  | DESCRIPTION
------- | -----------
`<C-d>` | 向下半页(down)
`<C-u>` | 向上半页(up)
`<C-f>` | 向下整页(forward)
`<C-b>` | 向上整页(back)
`zt`    | 翻页到光标位于屏幕开始(不移动光标, 只翻页)
`zz`    | 翻页到光标位于屏幕中间(不移动光标, 只翻页)
`zb`    | 翻页到光标位于屏幕末尾(不移动光标, 只翻页)

* 复制删除

Symbol  | DESCRIPTION
------- | -----------
`x`     | 删当前光标所在的一个字符
`dd`    | 删除当前行, 并把删除的行存到剪贴板里
`cw`    | 删除光标所在位置到行尾的字符, 并复制到剪贴板里
`u`     | undo
`<C-r>` | redo
`p`     | 粘贴
`yy`    | 复制当前行

* 查找

Symbol       | DESCRIPTION
------------ | -----------
`f <letter>` | 到下一个以letter开头单词的位置(find)
`t <letter>` | 到下一个以letter开头单词的前一格(to)

* 其他

Symbol | DESCRIPTION
------ | -----------
`gU`   | 变大写
`gu`   | 变小写

### insert模式

Symbol | DESCRIPTION
------ | -----------
`a`    | 在光标后插入
`i`    | 在光标前插入
`o`    | 在当前行后插入一个新行
`O`    | 在当前行前插入一个新行

### command模式
* 文件操作

Command               | Description
--------------------- | -----------
`:e <FILE_PATH>`      | 打开一个文件
`:e .`                | 打开当前目录
`:saveas <FILE_PATH>` | 另存为
`:bn`                 | 切换下一个文件
`:bp`                 | 切换上一个文件
`:.`                  | (小数点)可以重复上一次的命令
`N<command>`          | 重复某个命令N次

* 浏览目录 使用`:E`浏览目录, 在此界面可执行以下命令

Command           | Description
----------------- | -----------
`:cd <dir>`       | 进入某个目录
`:pwd`            | 查看当前目录
`:ls`             | 查看缓冲区列表
`bufferN`         | 切换到缓冲区第N个文件
`:bnext` `bn`     | 
`:bprevious` `bp` | 
`:blast` `bl`     | 
`:bfirst` `bf`    | 

### visual模式

Symbol  | DESCRIPTION
------- | -----------
`J`     | 把所有的行连接起来变成一行
`<` `>` | 左右缩进
`=`     | 自动缩进

# 分屏
### 启动分屏
```sh
# 垂直分屏, 左右各一半(n代表屏幕个数)
vim -On file1 file2 ...
:vsp FILE_NAME

# 水平分屏
vim -on file1 file2 ...
:sp FILE_NAME
```

### 分屏快捷键
* `<C-W><C-W>` 切换窗口
* `<C-W> h` 移动光标到左边的屏幕
* `<C-W> H` 移动屏幕到左边
* `<C-W> q` 关闭当前窗口，如果只剩最后一个了，则退出Vim

<br>

* `<C-W> =` 让所有的屏都有一样的高度
* `<C-W> +` 增加高度
* `<C-W> -` 减少高度

<br>

* `<C-W> s` 上下分割当前打开的文件
* `<C-W> v` 左右分割当前打开的文件
* `:sp FILE_NAME` 上下分割，并打开一个新的文件
* `:vsp FILE_NAME` 左右分割，并打开一个新的文件

# 分页
### 启动分页
* `:tabe <FILE_PATH>` 分页
* `:tabe .`

### 分页快捷键
* `gt` 下一页
* `gT` 上一页

# 查找替换
### 查找
在normal模式下按下`/`, 后面加要搜索的内容, 可以是正则表达式  
按`n`查找下一个, `N`查找上一个  
输入`:noh`(no highlight search)取消高亮  

### 替换
`:[range]s/pattern/string/[c,e,g,i]`

Parameter | Description
--------- | -----------
range     | 表示范围. `1,7`指一至七行, `1,$`值一至最后一行
pattern   | 要被替换的字符串, 可以是正则表达式
string    | string将取代pattern
c         | confirm, 每次替换前会询问
e         | error, 不显示错误
g         | global, 全局替换, 默认替换第一个
i         | ignore, 不区分大小写

# 初始配置
### 需要的插件
* nathanaelkane/vim-indent-guides
* itchyny/lightline.vim
* preservim/NERDTree

### 手动安装插件
Vim启动时会查找包含在`pack/*/start`中的插件  
从GitHub中直接下载到此目录

### 自动安装插件(vim-plug)
1. `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
2. 在~/.vimrc中设置插件; 输入`:PlugInstall`安装插件  
    ```vim
    " +----------------------------------+
    " |             vim-plug             |
    " +----------------------------------+
    call plug#begin()
    Plug 'preservim/NERDTree'
    call plug#end()
    ```

### vimrc
[vimrc](src/vimrc)