" gitgutter config
set signcolumn=yes
set updatetime=200
let g:gitgutter_sign_added              = '▌'
let g:gitgutter_sign_modified           = '▌'
let g:gitgutter_sign_modified_removed   = '▌'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_removed            = '▁'


" vim-fugitive
nnoremap <leader>gb :Git blame --date=short<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gd :Gdiffsplit<CR>
