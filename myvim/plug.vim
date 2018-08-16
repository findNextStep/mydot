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
Plug '~/.vim/plug/YouCompleteMe'
Plug 'octol/vim-cpp-enhanced-highlight' ,{ 'for':'cpp'}
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'davidhalter/jedi-vim' ,{ 'for':'python'}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle','for':'netrw'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'powerline/powerline', {'rtp': '~/.vim/plug/powerline/powerline/bindings/vim/'}
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'Carpetsmoker/startscreen.vim'
Plug 't9md/vim-choosewin'
" haskell自动补全
Plug 'eagletmt/neco-ghc'
" 颜色显示
Plug 'ap/vim-css-color'
" 按词跳转,wb增强
Plug 'chaoren/vim-wordmotion'
" vim-debug 需要
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'idanarye/vim-vebugger'
" 消除多余空格
Plug 'bronson/vim-trailing-whitespace'
" 光标下词语自动高亮
Plug 'RRethy/vim-illuminate'
" 颜色功能增强
Plug 'jeaye/color_coded' , {
   \ 'build': {
     \   'unix': 'rm -f CMakeCache.txt && cmake . && make && make install',
   \ },
   \ 'autoload': { 'filetypes' : ['c', 'cpp', 'objc', 'objcpp'] },
   \ 'build_commands' : ['cmake', 'make']
 \}
" markdown预览
Plug 'iamcco/mathjax-support-for-mkdp',{'for':'markdown'}
Plug 'iamcco/markdown-preview.vim',{'for':'markdown'}
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



" LeaderF
noremap <C-p> :LeaderfFile<CR>
noremap <S-p> :LeaderfBufTag<CR>

" gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = 'c'
let g:gitgutter_sign_removed = '>'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = 'w'
set updatetime=100

" indentLine
let g:indentLine_color_term = 239

" nerdcommenter
let g:NERDSpaceDelims=1
filetype plugin on
" 这里实际上是<C-/>不过由于某些原因是这样
map <C-_>  <plug>NERDCommenterInvert


" 作者：韦易笑
" 链接：https://www.zhihu.com/question/47691414/answer/373700711
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
            \ 'c': ['cppcheck'],
            \ 'cpp': ['cppcheck'],
            \ 'python': ['flake8', 'pylint'],
            \ 'lua': ['luac'],
            \ 'go': ['go build', 'gofmt'],
            \ 'java': ['javac'],
            \ 'javascript': ['eslint'],
            \ }
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''


" YCM
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_confirm_extra_conf=0
set completeopt=menu,menuone
let g:ycm_python_binary_path = 'python'
let g:ycm_error_symbol = '✗'
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
nnoremap gd :YcmCompleter GoToDeclaration<CR>


noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ 'haskell' : ['re!\w{2}']
            \ }

highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "cmake":1,
            \ "objc":1,
            \ "sh":1,
            \ "zsh":1,
            \ "python":1,
            \ "zimbu":1,
            \ "haskell":1,
            \ }

colorscheme molokai
" colorscheme Tomorrow-Night
" set background=dark
let g:solarized_termcolors=256
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE

" set doctool
let g:DoxygenToolkit_briefTag_funcName = "yes"
" for C++ style, change the '@' to '\'
let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_briefTag_pre = "\\brief "
let g:DoxygenToolkit_templateParamTag_pre = "\\tparam "
let g:DoxygenToolkit_paramTag_pre = "\\param "
let g:DoxygenToolkit_returnTag = "\\return "
let g:DoxygenToolkit_throwTag_pre = "\\throw " " @exception is also valid
let g:DoxygenToolkit_fileTag = "\\file "
let g:DoxygenToolkit_dateTag = "\\date "
let g:DoxygenToolkit_authorTag = "\\author "
let g:DoxygenToolkit_versionTag = "\\version "
let g:DoxygenToolkit_blockTag = "\\name "
let g:DoxygenToolkit_classTag = "\\class "
let g:DoxygenToolkit_authorName = "findNextStep , findNextStep@gmail.com"
let g:doxygen_enhanced_color = 1
"let g:load_doxygen_syntax = 1
let g:DoxygenToolKit_startCommentBlock = "/// "
let g:DoxygenToolKit_interCommentBlock = "/// "


" start page change
function! T()
    " wecome界面不需要缩进线
    IndentLinesToggle
    read ~/.myvim/start.txt
    " Some margin for readability
    :silent %>>
    " Go to line 1
    :1
    echo "welcome theNext"
endfun
let g:Startscreen_function = function('T')

nmap gw  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

" 添加创建terminal的指令
nnoremap <C-j> :terminal ++hidden screen x-terminal-emulator<CR>


" RRethy / vim-illuminate
let g:Illuminate_delay = 20
let g:Illuminate_ftblacklist = ['nerdtree']


" fzf command
nnoremap ;<space> :Commands<CR>
let g:fzf_layout = {'up' : '~40%'}

" markdown预览
nnoremap gv :MarkdownPreview<CR>
nnoremap gk :MarkdownPreviewStop<CR>

" haskell自动补全
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse = 1
