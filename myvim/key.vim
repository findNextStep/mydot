" 原生按键重定义
" 鼠标操作设定
set mouse=a

" https://github.com/avelino/vim-bootstrap
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" 定义leader键
let mapleader=" "
map <leader> :
map <leader>wq :wq<CR>
map <leader>q :q<CR>
map <leader>aq :qa<CR>
map <leader>noh :noh<CR>

" 定义常规快捷键
noremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>i
nnoremap גּk :m .-1-<count><CR>
nnoremap גּj :m .+<count><CR>

" 从新定义好用的esc
inoremap jj <ESC>
cnoremap jj <ESC>

" jk 移动按照显示的行使用
nnoremap j gj
nnoremap k gk

" 使用tab做直接缩进调整
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" 使用系统剪贴板
vnoremap p "+p
nnoremap p "+p
vnoremap y "+y
vnoremap x "+x

" ctrl+x剪切当前行
nnoremap <C-x> V"+ydd

" ctrl+n创建新窗口Alt+n创建新标签
nnoremap <C-n> :tabnew<CR>
nnoremap <C-k> :sp<CR>
nnoremap <C-L> :vsp<CR>

" 撤销和反撤销
nnoremap U <C-r>

" 插入模式下的删除
inoremap <C-j> <BS>

" tab快速切换
nmap גּa :tabnext 1<CR>
nmap גּs :tabnext 2<CR>
nmap גּd :tabnext 3<CR>
nmap גּf :tabnext 4<CR>
