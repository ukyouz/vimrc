" FZF
let $SHELL='cmd'
let g:fzf_layout = {'down': '~33%'}
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --threads 8 --column --line-number --no-heading -tc -tasm --type-add py:*.pyw -tpy --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   {'dir': getcwd()}, <bang>0)
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--color=always --pretty=short1 --date=short'
let g:fzf_preview_window = ''
nnoremap <Leader>p :Files<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>r :Rg<CR>
nnoremap <Leader>c :Commits<CR>
" nnoremap <Leader>f :BLines<CR>
" nnoremap <Leader><C-f> :Lines<CR>
" vnoremap <Leader>r y:Rg <C-R>=escape(tolower(@0), '/\.*$^~[]')<CR>
" vnoremap <Leader>t y:Tags <C-r>0
" source D:/Applications/Neovim/config/fzf_cscope

