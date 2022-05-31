let g:Illuminate_delay = 0
let g:Illuminate_highlightUnderCursor = 0
let g:Illuminate_ftwhitelist = ['c', 'cpp', 'python']

augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
augroup END
