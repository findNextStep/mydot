map <C-i> :call FormatCode()<CR>
func! FormatCode()
    "取得当前光标所在行号
    let lineNum = line(".")
    exec "w"

    if &filetype == 'c' || &filetype == 'h'
        silent !astyle --style=java -U -p -xn -xc -xl -k3 -j  % --suffix=none
        redraw!
    elseif &filetype == 'cpp' || &filetype == 'cc' || &filetype == 'hpp'
        silent !astyle --style=java -U -p -xn -xc -xl -k3 -j  % --suffix=none
        redraw!
    elseif &filetype == 'py'|| &filetype == 'python'
        silent "!autopep8 --in-place --aggressive %"
        redraw!
    elseif &filetype == 'java'
        silent !astyle --style=java -U -p -xn -xc -xl -k3 -j  % --suffix=none
        redraw!
    elseif &filetype == 'jsp'
        silent !astyle --style=java -U -p -xn -xc -xl -k3 -j  % --suffix=none
        redraw!
    else
        call <SNR>39_FixWhitespace(0,line("$"))
    endif

    exec lineNum
endfunc

" set equalprg=astyle\ --style=java\ -U\ -p\ -xn\ -xc\ -xl\ -k3\ -j
" elseif &filetype == 'python'
" set equalprg=yapf
" endif

if &filetype == 'c' || &filetype == 'h'
    set equalprg=astyle\ --style=java\ -U\ -p\ -xn\ -xc\ -xl\ -k3\ -j
elseif &filetype == 'cpp' || &filetype == 'cc' || &filetype == 'hpp'
    set equalprg=astyle\ --style=java\ -U\ -p\ -xn\ -xc\ -xl\ -k3\ -j
elseif &filetype == 'py'|| &filetype == 'python'
    set equalprg=autopep8 --in-place --aggressive
elseif &filetype == 'java'
    set equalprg=astyle\ --style=java\ -U\ -p\ -xn\ -xc\ -xl\ -k3\ -j
elseif &filetype == 'jsp'
    set equalprg=astyle\ --style=java\ -U\ -p\ -xn\ -xc\ -xl\ -k3\ -j
endif
