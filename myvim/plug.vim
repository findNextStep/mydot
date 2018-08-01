" vim插件管理

" 自动下载vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 加载插件设置
call plug#begin('~/.vim/plug')
	" 为了避免反复更新巨大的YCM
	Plug '~/.vim/plug/YouCompleteMe',{ 'for':['cpp','c'] }
	Plug 'octol/vim-cpp-enhanced-highlight' ,{ 'for':'cpp'}
	Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
    Plug 'octol/vim-cpp-enhanced-highlight' 
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle','for':'netrw'}
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'powerline/powerline', {'rtp': '~/.vim/plug/powerline/powerline/bindings/vim/'}
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'majutsushi/tagbar'
	Plug 'nathanaelkane/vim-indent-guides'
call plug#end()

" nerdtree 设置
nnoremap <C-S-e> :NERDTreeToggle<CR>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" powerline设置
set rtp+=~/.vim/plug/powerline/powerline/bindings/vim
set laststatus=2
set t_Co=256

" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1

" FZF
noremap <C-p> :FZF<CR>

" tagbar 设置
nnoremap <C-s-p> :TagbarToggle<CR>
