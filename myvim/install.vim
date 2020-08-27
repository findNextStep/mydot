source ~/.myvim/key.vim
source ~/.myvim/plug.vim
source ~/.myvim/myfunction.vim
source ~/.myvim/completion.vim


if filereadable($HOME . '/.local.vim')
    exec 'source ~/.local.vim'
endif
if filereadable(getcwd() . '/.vim/local.vim')
    exec 'source ' . getcwd() . '/.vim/local.vim'
endif
