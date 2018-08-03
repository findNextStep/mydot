map <C-S-i> :call FormatCode()<CR>
func! FormatCode()
    "取得当前光标所在行号
    let lineNum = line(".")
    exec "w"
    
    if &filetype == 'c' || &filetype == 'h'
        exec "!astyle --style=java -U -p -xn -xc -xl -k3 -j % --suffix=none"
    elseif &filetype == 'cpp' || &filetype == 'cc' || &filetype == 'hpp'
        exec "!astyle --style=java -U -p -xn -xc -xl -k3 -j  % --suffix=none"
    elseif &filetype == 'perl'
        exec "!astyle --style=java -U -p -xn -xc -xl -k3 -j % --suffix=none"
    elseif &filetype == 'py'|| &filetype == 'python'
        exec "!autopep8 --in-place --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java -U -p -xn -xc -xl -k3 -j % --suffix=none"
    elseif &filetype == 'jsp'
        exec "!astyle --style=java -U -p -xn -xc -xl -k3 -j % --suffix=none"
    elseif &filetype == 'xml'
        exec "!astyle --style=java -U -p -xn -xc -xl -k3 -j % --suffix=none"
    else
        exec "normal gg=G"
        return
    endif

    exec lineNum 
endfunc

