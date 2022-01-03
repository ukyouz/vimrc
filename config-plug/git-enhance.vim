" gitgutter config
set signcolumn=yes
set updatetime=300
let g:gitgutter_sign_added              = '▌'
let g:gitgutter_sign_modified           = '▌'
let g:gitgutter_sign_modified_removed   = '▌'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_removed            = '▁'
command! Gqf GitGutterQuickFix | copen

" vim-fugitive
nnoremap <leader>gb :Git blame --date=short<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gd :Gdiffsplit<CR>

" lazygit.nvim
let g:lazygit_floating_window_scaling_factor = 1
nnoremap <leader>gg :LazyGit<CR>
