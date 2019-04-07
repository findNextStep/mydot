" vim插件管理

" 自动下载vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    silent curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 加载插件设置
call plug#begin('~/.vim/plug')
" vim merge tool
Plug 'samoshkin/vim-mergetool'
" 后台运行
Plug 'https://github.com/skywind3000/asyncrun.vim'
" 颜色主题
Plug 'chriskempson/vim-tomorrow-theme'
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 自动保存当前状态
Plug 'findNextStep/vim-obsession'
Plug 'richq/vim-cmake-completion' , { 'for' : 'cmake' }
" 为了避免反复更新巨大的YCM
" Plug '~/.vim/plug/YouCompleteMe'
" ctags
Plug 'https://github.com/ludovicchabant/vim-gutentags'
" ycm和颜色高亮插件的自动完成
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" python自动补全
" Plug 'davidhalter/jedi-vim' ,{ 'for':'python'}
" Plug 'miyakogi/asyncjedi' ,{'for':'python'}
" 文件夹视图
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle','for':'netrw'}
" 结合git插件和文件夹视图
Plug 'Xuyuanp/nerdtree-git-plugin'
" vim特殊字符使用
Plug 'ryanoasis/vim-devicons'
" git插件
Plug 'airblade/vim-gitgutter'
" 注释
Plug 'scrooloose/nerdcommenter'
" fuzzy窗口
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" 缩进线
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'
" fuzzy 命令
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" {[(自动配对)]}
Plug 'jiangmiao/auto-pairs'
" doxygen
Plug 'vim-scripts/DoxygenToolkit.vim'
" 初始界面美化
Plug 'Carpetsmoker/startscreen.vim'
" ts支持
Plug 'leafgarland/typescript-vim'
" 可视化的窗口选择
Plug 't9md/vim-choosewin'
" zsh 补全
Plug 'tracyone/vim-zsh-completion',{'for': ['zsh','sh']}
" js
Plug 'yardnsm/vim-import-cost', { 'do': 'yarn install' }
" haskell自动补全
" Plug 'eagletmt/neco-ghc'
" 颜色显示
Plug 'ap/vim-css-color'
" vim-debug 需要
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'idanarye/vim-vebugger'
" 消除多余空格
Plug 'bronson/vim-trailing-whitespace'
" 光标下词语自动高亮
Plug 'RRethy/vim-illuminate'
" 颜色功能增强
" Plug 'jeaye/color_coded' , {
            " \ 'build': 'rm -f CMakeCache.txt && cmake . && make && make install',
            " \ 'autoload': { 'filetypes' : ['c', 'cpp', 'objc', 'objcpp'] },
            " \ 'build_commands' : ['cmake', 'make']
            " \}
" markdown预览
Plug 'iamcco/mathjax-support-for-mkdp',{'for':'markdown'}
Plug 'iamcco/markdown-preview.vim',{'for':'markdown'}
Plug 'easymotion/vim-easymotion'
Plug 'sheerun/vim-polyglot'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim', { 'do': 'pip3 install --user pynvim' }
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" deoplete plug
" 智能补全
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
" tagbar - lsp
Plug 'liuchengxu/vista.vim'
" vim 补全
Plug 'https://github.com/Shougo/neco-vim'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
"org-mod"
Plug 'jceb/vim-orgmode'
Plug 'mattn/calendar-vim'
Plug 'vim-scripts/speeddating.vim'

Plug 'joshdick/onedark.vim'
" 颜色显示插件
Plug 'RRethy/vim-hexokinase'
" theme pick up
Plug 'https://github.com/chxuan/change-colorscheme'
call plug#end()

" lsp
set hidden
let g:LanguageClient_serverCommands = {
            \'cpp' : ['/usr/local/bin/cquery',"--log-file","/tmp/cquery.log"],
            \'python' : ['pyls','--log-file',"/tmp/pyls.log"],
            \'haskell' : ['hie-wrapper', '--lsp', '-r', getcwd() ,'-d','-l','/tmp/hie.log'],
            \'rust' : ['rustup','run','stable','rls'],
            \}
let g:LanguageClient_rootMarkers = {
            \ 'cpp': ['compile_commands.json', 'build'],
            \ 'c': ['compile_commands.json', 'build'],
            \ 'haskell': ['*.cabal', 'stack.yaml'],
            \ 'rust': ['Cargo.lock'],
            \ }
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_selectionUI = 'quickfix'
let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_diagnosticsList = v:null
let g:LanguageClient_hoverPreview = 'Never'
let g:LanguageClient_settingsPath ="~/.lsp_setting.json"
let g:LanguageClient_autoStart = 1

" show where it define
noremap <leader>gd :call LanguageClient#textDocument_definition()<cr>
" show where it used
noremap <leader>gr :call LanguageClient#textDocument_references()<cr>
" show what it is
noremap <leader>gv :call LanguageClient#textDocument_hover()<cr>
" formatting "
noremap <Leader>gf :call LanguageClient#textDocument_formatting()<cr>
noremap <Leader>ga :call LanguageClient#textDocument_codeAction()<CR>
noremap <Leader>gs :call LanguageClient#textDocument_documentSymbol()<CR>

" 补全设置
" 自启动
let g:deoplete#enable_at_startup = 1
" smart case不解释
let g:deoplete#enable_smart_case = 1

" 使用tab在补全中找选项
" https://zhuanlan.zhihu.com/p/54586480
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<tab>"
inoremap <expr><c-j> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><c-k> pumvisible() ? "\<c-p>" : "\<tab>"

" 用户输入至少两个字符时再开始提示补全
call deoplete#custom#source('LanguageClient', 'min_pattern_length', 1)

" 补全结束或离开插入模式时，关闭预览窗口
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" 为每个语言定义completion source
" 是的vim script和zsh script都有，这就是deoplete
call deoplete#custom#option('sources', {
            \ 'cpp': ['tabnine','LanguageClient'],
            \ 'c': ['tabnine','LanguageClient'],
            \ 'python': ['tabnine','LanguageClient'],
            \ 'haskell': ['tabnine','LanguageClient'],
            \ 'rust':['LanguageClient'],
            \ 'vim': ['tabnine','vim'],
            \ 'zsh': ['tabnine','zsh']
            \})

" 忽略一些没意思的completion source。
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer', 'around']
" 把Server的补全API提交给Vim
" 一般有deoplete就可以用了，加上一条以防万一。
set completefunc=LanguageClient#complete
" 把Server的格式化API提交给Vim
set formatexpr=LanguageClient_textDocument_rangeFormatting()

"vista
noremap P :Vista!!<CR>
" 跳转后自动关闭
let g:vista_close_on_jump = 1
let g:vista_stay_on_open = 1
let g:vista_blink = [0, 100]
let g:vista_icon_indent = ["ﲒ ", "ﲖ "]

" nerdtree 设置
nnoremap <C-e> :NERDTreeToggle<CR>

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


" LeaderF
noremap <C-p> :LeaderfFile<CR>

" gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = 'c'
let g:gitgutter_sign_removed = '>'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = 'w'
set updatetime=100

"ctags
set tags=./.tags;,.tags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

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
let g:ycm_python_binary_path = 'python'
let g:ycm_error_symbol = '✗'
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'


noremap <c-z> <NOP>


highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "objc":1,
            \ "sh":1,
            \ "zsh":1,
            \ "zimbu":1,
            \ "haskell":1,
            \ }


" jedi
let g:jedi#auto_initialization = 1
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 1

" nnoremap <silent> <F9> :PreviousColorScheme<cr>
" inoremap <silent> <F9> <esc> :PreviousColorScheme<cr>
" nnoremap <silent> <F10> :NextColorScheme<cr>
" inoremap <silent> <F10> <esc> :NextColorScheme<cr>
" nnoremap <silent> <F11> :RandomColorScheme<cr>
" inoremap <silent> <F11> <esc> :RandomColorScheme<cr>
" nnoremap <silent> <F12> :ShowColorScheme<cr>
" inoremap <silent> <F12> <esc> :ShowColorScheme<cr>
colorscheme Tomorrow-Night-Bright
" colorscheme onedark
" colorscheme Tomorrow-Night
" set background=dark
let g:solarized_termcolors=256
" hi Normal guibg=NONE ctermbg=NONE
" hi LineNr guibg=NONE ctermbg=NONE

" set doctool
let g:DoxygenToolkit_briefTag_funcName = "yes"
" let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_briefTag_pre = "@brief "
let g:DoxygenToolkit_templateParamTag_pre = "@tparam "
let g:DoxygenToolkit_paramTag_pre = "@param "
let g:DoxygenToolkit_returnTag = "@return "
let g:DoxygenToolkit_throwTag_pre = "@throw " " @exception is also valid
let g:DoxygenToolkit_fileTag = "@file "
let g:DoxygenToolkit_dateTag = "@date "
let g:DoxygenToolkit_authorTag = "@author findNextStep"
let g:DoxygenToolkit_versionTag = "@version "
let g:DoxygenToolkit_blockTag = "@name "
let g:DoxygenToolkit_classTag = "@class "
let g:DoxygenToolkit_authorName = "findNextStep , findNextStep@gmail.com"
let g:doxygen_enhanced_color = 1
let g:load_doxygen_syntax = 1
" let g:DoxygenToolKit_startCommentBlock = "/// "
" let g:DoxygenToolKit_interCommentBlock = "/// "

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

" RRethy / vim-illuminate
let g:Illuminate_delay = 20
let g:Illuminate_ftblacklist = ['nerdtree']


" fzf command
nnoremap ;<space> :Commands<CR>
let g:fzf_layout = {'up' : '~40%'}

" markdown预览
nnoremap <leader>mv :MarkdownPreview<CR>
nnoremap <leader>mk :MarkdownPreviewStop<CR>

" haskell自动补全
" let g:haskellmode_completion_ghc = 0
" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" let g:necoghc_enable_detailed_browse = 1

let g:cmake_map_keys = 0

" VBG debug
nnoremap <leader>sp         :VBGtoggleBreakpointThisLine<CR>
nnoremap <leader>sd         :VBGstartGDB
nnoremap <leader>s<space>   :VBGcontinue<CR>

let g:airline#extensions#tabline#enabled = 1
set laststatus=2 "Always show statusline
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'
function! CMakeStat()
    let l:cmake_build_dir = get(g:, 'cmake_build_dir', 'build')
    let l:build_dir = finddir(l:cmake_build_dir, '.;')


    let l:retstr = ""
    if l:build_dir != ""
        if filereadable(build_dir . '/CMakeCache.txt')
            let cmcache = readfile(build_dir . '/CMakeCache.txt')
            for line in cmcache
                if line =~ "CMAKE_BUILD_TYPE"
                    let value = reverse(split(line, '='))[0]
                    let retstr = retstr . value . " "
                elseif line =~ "RUN_TESTS"
                    let value = reverse(split(line, '='))[0]
                    let retstr = retstr . "T" . value . " "
                endif
            endfor
        endif
    endif
    return substitute(retstr, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction
call airline#parts#define('cmake', {'function': 'CMakeStat'})

let g:airline_section_b = airline#section#create_left(['cmake'])

let g:obsession_file_name=".Session.vim"
if filereadable(g:obsession_file_name)
    silent execute 'source '.g:obsession_file_name
    " execute 'Obsession'
endif

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.

" nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <Leader>l <Plug>(easymotion-lineforward)
nmap t <Plug>(easymotion-s2)
nmap <Leader>h <Plug>(easymotion-linebackward)
nmap / <Plug>(easymotion-sn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

let g:jedi#completions_enabled = 1

" git merge tool
let g:mergetool_layout = 'mbr'
let g:mergetool_prefer_revision = 'local'

" use ture color
if has("termguicolors")
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

nnoremap <leader>sc :HexokinaseToggle<CR>

let g:Hexokinase_ftAutoload = ['css']
let g:Hexokinase_signIcon = ''
