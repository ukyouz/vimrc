" vim-preview
" noremap <silent><F4> :PreviewTag<CR>
noremap <silent><m-u> :PreviewScroll -1<cr>
noremap <silent><m-d> :PreviewScroll +1<cr>
inoremap <silent><m-u> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <silent><m-d> <c-\><c-o>:PreviewScroll +1<cr>
noremap  <silent><F2> :PreviewSignature!<cr>
inoremap <silent><F2> <c-\><c-o>:PreviewSignature!<cr>
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>