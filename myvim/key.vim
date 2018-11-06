" 原生按键重定义
" 鼠标操作设定
set mouse=a

" 添加alt键映射
" a-z
for i in range(97,122)
  let c = nr2char(i)
  exec "map \e".c." <M-".c.">"
  exec "map! \e".c." <M-".c.">"
endfor
" 0-9
for i in range(48,57)
  let c = nr2char(i)
  exec "map \e".c." <M-".c.">"
  exec "map! \e".c." <M-".c.">"
endfor
" 定义leader键
let mapleader=" "
map <leader>wq :wq<CR>
map <leader>q :q<CR>

" 定义常规快捷键
noremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>i
nnoremap <A-k> :m .-1-<count><CR>
nmap <A-j> :m .+<count><CR>

" 从新定义好用的esc
inoremap jj <ESC>
cnoremap jj <ESC>
nnoremap <space> <ESC>
vnoremap <space> <ESC>

" 使用tab做直接缩进调整
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" 使用系统剪贴板
vnoremap p "+p
nnoremap p "+p
vnoremap y "+y

" ctrl+x剪切当前行
nnoremap <C-x> V"+ydd

" ctrl+n创建新窗口Alt+n创建新标签
nnoremap <C-n> :tabnew<CR>
nnoremap <C-k> :sp<CR>
nnoremap <C-L> :vsp<CR>

" 撤销和反撤销
nnoremap <C-z> u
nnoremap <C-Y> <C-r>
nnoremap U <C-r>

" 插入模式下的删除
inoremap <C-j> <BS>

" tab快速切换
nnoremap <M-5> :tabnext 5<CR>
for c in range(1,9)
  exec "nnoremap <M-".c."> :tabnext ".c."<CR>"
endfor
