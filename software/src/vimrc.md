```vimrc
" +----------------------------------+
" |              快捷键              |
" +----------------------------------+
nmap H 10h
nmap J 10j
nmap K 10k
nmap L 10l

let mapleader=" "
nmap <Leader>W :w<CR>:q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <leader>Q :q!<CR>

" 定义快捷键在结对符之间跳转
nmap <Leader>m %

" 查找
nmap <Leader>f *
nmap <Leader>F #
" 折叠
nmap <Leader>] zM
nmap <Leader>[ zR
nmap <Leader>a za
" 多窗口
nnoremap <Leader>e <C-W><C-W>
nnoremap <Leader>h <C-W>h
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>l <C-W>l
" 移动屏幕
nnoremap <Leader>H <C-W>H
nnoremap <Leader>J <C-W>J
nnoremap <Leader>K <C-W>K
nnoremap <Leader>L <C-W>L
" 缩放屏幕
nnoremap <Leader>= <C-W>=
nnoremap <Leader>+ <C-W>+
nnoremap <Leader>- <C-W>-

" +----------------------------------+
" |               基本               |
" +----------------------------------+
set encoding=utf-8
" 光标遇到括号时, 自动高亮对应的另一个大括号
set noshowmatch
" 不与 Vi 兼容
set nocompatible
" 打开语法高亮。自动识别代码, 使用多种颜色显示 自动开启
syntax on
" 启用256色
set t_Co=256
" 载入与文件对应的缩进规则
filetype indent on

" +----------------------------------+
" |               外观               |
" +----------------------------------+
" 显示行号
set number
" 显示光标所在的当前行的行号, 其他行都为相对于该行的相对行号
set relativenumber
" 光标所在的当前行高亮
set cursorline
" 在底部显示, 当前处于命令模式还是插入模式
set showmode
" 在状态栏底部显示光标的当前位置(位于哪一行哪一列)
set ruler
" 命令模式下, 在底部显示当前键入的指令
set showcmd

" +----------------------------------+
" |               搜索               |
" +----------------------------------+
" 搜索时, 高亮显示匹配结果
set hlsearch
" 输入搜索模式时, 每输入一个字符, 就自动跳到第一个匹配的结果
set incsearch
" 搜索时忽略大小写
set ignorecase
" 如果同时打开了ignorecase, 那么对于只有一个大写字母的搜索词, 将大小写敏感; 其他情况都是大小写不敏感
set smartcase

" +----------------------------------+
" |               缩进               |
" +----------------------------------+
" 按下Tab键时, Vim显示的空格数(此时tab还是制表符, 只不过长度为两个空格)
set tabstop=4
" 自动将Tab转为空格
set expandtab
" Tab转为多少个空格, 和上面两句等价
" set softtabstop=4
" 按下回车键后, 下一行的缩进会自动跟上一行的缩进保持一致
set autoindent
" 在文本上按下>>(增加一级缩进)、<<(取消一级缩进)或者==(取消全部缩进)时, 每一级的字符数
set shiftwidth=4
" 只有遇到指定的符号(比如空格、连词号和其他标点符号), 才发生折行. 也就是说, 不会在单词内部折行
set linebreak

" +----------------------------------+
" |               折叠               |
" +----------------------------------+
" za, 打开或关闭当前折叠; zM, 关闭所有折叠; zR, 打开所有折叠
" 基于缩进进行代码折叠
" set foldmethod=indent
" 基于语法进行代码折叠
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" +----------------------------------+
" |             vim-plug             |
" +----------------------------------+
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'preservim/NERDTree'
call plug#end()
" |------------ lightline ------------|
set laststatus=2
set noshowmode
```