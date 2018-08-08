" 原生按键重定义

" 定义leader键
let mapleader=';'

" 定义常规快捷键
noremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>i

" 从新定义好用的esc
inoremap jj <ESC>
cnoremap jj <ESC>
nnoremap <space> <ESC>
vnoremap n <ESC>

" 使用tab做直接缩进调整
nnoremap <tab> V>
nnoremap <s-tab> V<
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" 使用系统剪贴板
vnoremap p "+p
nnoremap p "+p
vnoremap y "+y

" 使用空格触发命令
nnoremap <space> :
vnoremap <space> :

" ctrl+x剪切当前行
nnoremap <C-x> V"+ydd

" ctrl+n创建新窗口Alt+n创建新标签
nnoremap <C-n> :tabnew<CR>
nnoremap <C-k> :sp<CR>
nnoremap <C-L> :vsp<CR>
nnoremap <C-i> :tabnext<CR>
