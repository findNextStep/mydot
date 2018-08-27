" 原生按键重定义

" 定义leader键
let mapleader=';'

" 定义常规快捷键
noremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>i

" 从新定义好用的esc
noremap <space> <ese>
inoremap jj <ESC>
cnoremap jj <ESC>
nnoremap <space> <ESC>
vnoremap <space> <ESC>

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

" ctrl+x剪切当前行
nnoremap <C-x> V"+ydd

" ctrl+n创建新窗口Alt+n创建新标签
nnoremap <C-n> :tabnew<CR>
nnoremap <C-k> :sp<CR>
nnoremap <C-L> :vsp<CR>
nnoremap <C-i> :tabnext<CR>

" 撤销和反撤销
nnoremap <C-z> u
nnoremap <C-Y> <C-r>
nnoremap U <C-r>

" 插入模式下的删除
inoremap <C-j> <BS>

" tab快速切换
nnoremap <M-q> :tabnext 1<CR>
nnoremap <M-w> :tabnext 2<CR>
nnoremap <M-e> :tabnext 3<CR>
nnoremap <M-r> :tabnext 4<CR>
nnoremap <M-t> :tabnext 5<CR>