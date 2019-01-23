set completeopt=menu,menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
augroup complete
  autocmd!
  autocmd CompleteDone * pclose
augroup end
