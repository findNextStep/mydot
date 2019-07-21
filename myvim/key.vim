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
vnoremap גּk :'<,'>m .-1-<count><CR>
vnoremap גּj :'<.'>m .+<count><CR>

" 从新定义好用的esc
inoremap jj <ESC>
cnoremap jj <ESC>

" jk 移动按照显示的行使用
nnoremap j gj
nnoremap k gk

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
nmap <leader>a :tabnext 1<CR>
nmap <leader>s :tabnext 2<CR>
nmap <leader>d :tabnext 3<CR>
nmap <leader>f :tabnext 4<CR>


nmap גּj <C-w>j
nmap גּh <C-w>h
nmap גּk <C-w>k
nmap גּl <C-w>l

set foldmethod=syntax
set foldlevel=99
nnoremap <TAB> za
