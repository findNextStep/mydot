map <C-S-i> :call FormatCode()<CR>
func! FormatCode()
    exec "w"
    if &filetype == 'c' || &filetype == 'h'
        exec "!astyle --style=java -U -p -xn -xc -xl -k3 -j %"
    elseif &filetype == 'cpp' || &filetype == 'cc' || &filetype == 'hpp'
        exec "!astyle --style=java -U -p -xn -xc -xl -k3 -j  %"
    elseif &filetype == 'perl'
        exec "!astyle --style=java -U -p -xn -xc -xl -k3 -j %"
    elseif &filetype == 'py'|| &filetype == 'python'
        exec "!autopep8 --in-place --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java -U -p -xn -xc -xl -k3 -j %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=java -U -p -xn -xc -xl -k3 -j %"
    elseif &filetype == 'xml'
        exec "!astyle --style=java -U -p -xn -xc -xl -k3 -j %"
    else
        exec "normal gg=G"
        return
    endif
endfunc

