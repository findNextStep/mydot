" vim插件管理

" 自动下载vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 加载插件设置
call plug#begin('~/.vim/plug')
" 后台运行
Plug 'https://github.com/skywind3000/asyncrun.vim'
" airline
Plug 'vim-airline/vim-airline'
" 自动保存当前状态
Plug 'findNextStep/vim-obsession'
" vim特殊字符使用
Plug 'ryanoasis/vim-devicons'
" git插件
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" 注释
Plug 'scrooloose/nerdcommenter'
" 缩进线
Plug 'Yggdroot/indentLine'
" fuzzy 命令
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" doxygen
Plug 'vim-scripts/DoxygenToolkit.vim'
" 可视化的窗口选择
Plug 't9md/vim-choosewin'
" zsh 补全
Plug 'tracyone/vim-zsh-completion',{'for': ['zsh','sh']}
" js
Plug 'yardnsm/vim-import-cost', { 'do': 'yarn install' }
" 颜色显示
Plug 'ap/vim-css-color'
" vim-debug 需要
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'idanarye/vim-vebugger'
" 消除多余空格
Plug 'bronson/vim-trailing-whitespace'
" 光标下词语自动高亮
Plug 'RRethy/vim-illuminate'
" markdown预览
Plug 'iamcco/mathjax-support-for-mkdp',{'for':'markdown'}
Plug 'iamcco/markdown-preview.vim',{'for':'markdown'}
" coc
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'clangd/coc-clangd', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
" 智能高亮需要coc.nvim
Plug 'jackguo380/vim-lsp-cxx-highlight'
" ccls加强
Plug 'm-pilia/vim-ccls'
" 颜色显示插件
Plug 'RRethy/vim-hexokinase'
" theme pick up
Plug 'chxuan/change-colorscheme'
" file manager
Plug 'philip-karlsson/bolt.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'puremourning/vimspector'
" 搜索多个目标
Plug 'https://github.com/lfv89/vim-interestingwords'
" DAP
Plug 'puremourning/vimspector' , { 'do' : './install_gadget.py --all --disable-tcl'}
" 内建终端功能的增强
Plug 'skywind3000/vim-terminal-help'
call plug#end()

nmap <C-u> :call TerminalToggle()<cr>
if has('nvim') == 0
    tmap <C-u> <c-_>:call TerminalToggle()<cr>
else
    tmap <C-u> <c-\><C-n>:call TerminalToggle()<cr>
endif
let g:terminal_close = 1
let g:terminal_cwd=2

" 使用tab在补全中找选项
" https://zhuanlan.zhihu.com/p/54586480
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<tab>"
inoremap <expr><c-j> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><c-k> pumvisible() ? "\<c-p>" : "\<tab>"

let g:vimspector_enable_mappings = 'HUMAN'
sign define vimspectorBP text=🔴 texthl=Normal
sign define vimspectorBPDisabled text=🔵 texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad

noremap <C-p> :Files<CR>
nnoremap ;<space> :Commands<CR>
noremap <C-j> :BTags<CR>

" gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = 'c'
let g:gitgutter_sign_removed = '>'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = 'w'
noremap <silent> <leader>gia :!Git add %<CR>
noremap <silent> <C-b> :AsyncRun make -C ./build/Debug -j6<CR>
set updatetime=100


" indentLine
let g:indentLine_color_term = 239

" nerdcommenter
let g:NERDSpaceDelims=1
filetype plugin on
" 这里实际上是<C-/>不过由于某些原因是这样
map <C-_>  <plug>NERDCommenterInvert

noremap <c-z> <NOP>

" jedi
let g:jedi#auto_initialization = 1
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 1

nnoremap <silent> <F9> :PreviousColorScheme<cr>
inoremap <silent> <F9> <esc> :PreviousColorScheme<cr>
nnoremap <silent> <F10> :NextColorScheme<cr>
inoremap <silent> <F10> <esc> :NextColorScheme<cr>
nnoremap <silent> <F11> :RandomColorScheme<cr>
inoremap <silent> <F11> <esc> :RandomColorScheme<cr>
nnoremap <silent> <F12> :ShowColorScheme<cr>
inoremap <silent> <F12> <esc> :ShowColorScheme<cr>
colorscheme desert
let g:solarized_termcolors=256

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

nmap <leader>gw  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

" RRethy / vim-illuminate
let g:Illuminate_delay = 20



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

let g:airline_powerline_fonts=1
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
" call airline#parts#define('cmake', {'function': 'CMakeStat'})

" let g:airline_section_b = airline#section#create_left(['cmake'])

let g:obsession_file_name=".Session.vim"
if filereadable(g:obsession_file_name)
    silent execute 'source '.g:obsession_file_name
    " execute 'Obsession'
endif


" use ture color
if has("termguicolors")
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

nnoremap  גּc :HexokinaseToggle<CR>

let g:Hexokinase_ftAutoload = ['css']
let g:Hexokinase_signIcon = ''

" coc
autocmd FileType json syntax match Comment +\/\/.\+$+
nnoremap <leader>gf :CocCommand clangd.switchSourceHeader<CR>
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" highlight Pmenu    guibg=darkgrey  guifg=black
" highlight PmenuSel guibg=lightgrey guifg=black
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gn <Plug>(coc-rename)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <C-k> <Plug>(coc-format)
xmap <silent> <C-k> <Plug>(coc-format-selected)
" set updatetime=300
" au CursorHold * sil call CocActionAsync('highlight')
" au CursorHoldI * sil call CocActionAsync('showSignatureHelp')
highlight CocErrorHighlight ctermbg=Red  guibg=#ff0000
highlight CocWarningHighlight guibg=#ffff00

" use lsp to highlight cxx
let g:lsp_cxx_hl_use_text_props = 1
" Change skipped regions to Dark Gray
highlight LspCxxHlSkippedRegion ctermfg=DarkGray guifg=DarkGray
set cursorline
highlight LspCxxHlSymMethod guifg=#e5b124
highlight LspCxxHlSymClass guifg=#729de3 gui=bold
highlight LspCxxHlSymStruct guifg=#729de3 gui=bold
highlight LspCxxHlSymParameter guifg=#306b72
highlight LspCxxHlSymMacro guifg=#8f5daf gui=bold
highlight LspCxxHlSymClassMethod gui=underline guifg=#e5b124
highlight LspCxxHlSymClassMethodStatic gui=standout guifg=#e5b124
highlight LspCxxHlSymFunction guifg=#e5b124
highlight LspCxxHlSymVariable guifg=#26cdca
" 全局变量
highlight LspCxxHlSymNamespaceVariable guifg=#8f5daf gui=bold
" 成员变量
highlight LspCxxHlSymField gui=underline guifg=#7ca6b7
highlight LspCxxHlSymNamespace guifg=#00d780 gui=bold
highlight LspCxxHlSymEnumMember guifg=#397797 gui=bold
highlight LspCxxHlSymEnum guifg=#729de3 gui=bold
highlight Statement guifg=#569cd6
highlight Type guifg=#569cd6
highlight Normal guibg=#000000 guifg=white
highlight Comment guifg=#7ca668
highlight String guifg=#ce9178
highlight Constant guifg=#b5cea8
highlight LspCxxHlSymUnknownNone ctermfg=Red guifg=#FF0000 cterm=bold gui=bold
autocmd FileType cpp,cxx setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
" black, brown酒红, grey, blue, green, cyan, magenta, yellow, white
" bold、underline、reverse、italic或standout

" packadd! vimspector
nnoremap <leader>dl :call vimspector#Launch()<CR>
nnoremap <leader>dg :call vimspector#Continue()<CR>
nnoremap <leader>dk :call vimspector#Stop()<CR>
nnoremap <leader>dp :call vimspector#ToggleBreakpoint()<CR>

" 补全中使用回车确认使用snippet
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 同时高亮多个词
nnoremap <silent> <leader>k :call InterestingWords('n')<cr>

" coc airline
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#error_symbol = 'E:'
let g:airline#extensions#coc#warning_symbol = 'W:'
"解决coc.nvim大文件卡死状况
let g:trigger_size = 0.5 * 1048576

augroup hugefile
  autocmd!
  autocmd BufReadPre *
        \ let size = getfsize(expand('<afile>')) |
        \ if (size > g:trigger_size) || (size == -2) |
        \   echohl WarningMsg | echomsg 'WARNING: altering options for this huge file!' | echohl None |
        \   exec 'CocDisable' |
        \ else |
        \   exec 'CocEnable' |
        \ endif |
        \ unlet size
augroup END

highlight Pmenu    guibg=darkgrey  guifg=black
highlight PmenuSel guibg=lightgrey guifg=black

nnoremap <leader> :

