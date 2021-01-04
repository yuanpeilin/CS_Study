# 模式
insert模式(i)
normal模式(esc)
visual模式(v, 移动光标复制或删除)

# 可视模式

Symbol  | DESCRIPTION
------- | -----------
`J`     | 把所有的行连接起来变成一行
`<` `>` | 左右缩进
`=`     | 自动缩进

# normal模式快捷键
### 插入模式

Symbol | DESCRIPTION
------ | -----------
`a`    | 在光标后插入
`i`    | 在光标前插入
`o`    | 在当前行后插入一个新行
`O`    | 在当前行前插入一个新行

### 光标移动

Symbol | DESCRIPTION
------ | -----------
`0`    | 到行头(数字零)
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

### 复制删除

Symbol  | DESCRIPTION
------- | -----------
`x`     | 删当前光标所在的一个字符
`dd`    | 删除当前行, 并把删除的行存到剪贴板里
`cw`    | 删除光标所在位置到行尾的字符, 并复制到剪贴板里
`u`     | undo
`<C-r>` | redo
`p`     | 粘贴
`yy`    | 复制当前行

### 其他

Symbol | DESCRIPTION
------ | -----------
`gU`   | 变大写
`gu`   | 变小写

# 命令

Command | Description
------- | -----------
`:e` | <FILE_PATH> 打开一个文件
`:saveas <FILE_PATH>` | 另存为 <FILE_PATH>
`:bn` | 切换下一个文件
`:bp` | 切换上一个文件
`:.` | (小数点)可以重复上一次的命令
`N<command>` | 重复某个命令N次

# 浏览目录
使用`:E`浏览目录, 在此界面可执行以下命令:  

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

# 分屏
### 启动分屏
垂直分屏, 左右各一半(n代表屏幕个数):  
```sh
vim -On file1 file2 ...
```
```vim
`:vsp FILE_NAME`
```

<br>

水平分屏:  
```sh
vim -on file1 file2 ...
```
```vim
`:sp FILE_NAME`
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
g         | global, 不询问全部替换
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