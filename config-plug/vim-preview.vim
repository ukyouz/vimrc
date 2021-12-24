" vim-preview
let g:preview#preview_position = 'bottom'
let g:preview#preview_size = '13'
nnoremap <silent><m-u> :PreviewScroll -1<cr>
nnoremap <silent><m-d> :PreviewScroll +1<cr>
inoremap <silent><m-u> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <silent><m-d> <c-\><c-o>:PreviewScroll +1<cr>
nnoremap <silent><c-p> :PreviewTag<CR>
nnoremap <silent><c-z> :PreviewClose<CR>
" nnoremap <silent><F2> :PreviewSignature!<cr>
" inoremap <silent><F2> <c-\><c-o>:PreviewSignature!<cr>
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
