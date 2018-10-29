let g:last_mode = ""
function! Mode()
  let l:mode = mode()

  if l:mode !=# g:last_mode "Mode change
    let g:last_mode = l:mode
    if     mode ==# "n"  | hi User2 ctermfg=28  ctermbg=22  cterm=bold | hi User3 ctermfg=22  ctermbg=236
    elseif mode ==# "i"  | hi User2 ctermfg=23  ctermbg=231 cterm=bold | hi User3 ctermfg=231 ctermbg=236
    elseif mode ==# "R"  | hi User2 ctermfg=231 ctermbg=160 cterm=bold | hi User3 ctermfg=160 ctermbg=236
    elseif mode ==? "v"  | hi User2 ctermfg=160 ctermbg=208 cterm=bold | hi User3 ctermfg=208 ctermbg=236
    elseif mode ==# "^V" | hi User2 ctermfg=160 ctermbg=208 cterm=bold | hi User3 ctermfg=208 ctermbg=236
    endif
  endif

  if     mode ==# "n"  | return "  NORMAL  "
  elseif mode ==# "i"  | return "  INSERT  "
  elseif mode ==# "R"  | return "  REPLACE "
  elseif mode ==# "v"  | return "  VISUAL  "
  elseif mode ==# "V"  | return "  V·LINE  "
  elseif mode ==# "^V" | return "  V·BLOCK "
  else                 | return l:mode
  endif
endfunc

hi link User1 Statusline
hi Statusline cterm=NONE
hi User1 ctermfg=231 ctermbg=236 cterm=NONE

hi User4 ctermfg=238 ctermbg=236 cterm=bold
hi User5 ctermfg=76  ctermbg=236 cterm=bold
hi User6 ctermfg=196 ctermbg=236 cterm=bold

set laststatus=2 "Always show statusline
set statusline=%2*%{Mode()}%3*⮀%1*%=%{&enc}\ ⮃\ %{&ff}\ ⮃\ [%5*%{tolower(&ft)}%1*
set statusline+=,%6*%{&mod?'+':''}%1*%{&mod?'':'-'}
set statusline+=%{&ro?',':''}%6*%{&ro?'⭤':''}%1*]\ [⭡\ %03l:%4*%03v%1*]

