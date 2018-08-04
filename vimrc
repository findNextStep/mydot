set encoding=utf-8
set ruler
set cursorline
set number
set showmode
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 高亮显示搜索结果
set hlsearch

filetype on
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

set autoread

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

source ~/.myvim/install.vim 
