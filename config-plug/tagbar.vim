nmap <F8> :TagbarToggle f<CR>

nnoremap <silent><F3> :echo lightline_tagbar#component()<cr>
inoremap <silent><F3> <c-\><c-o>:echo lightline_tagbar#component()<cr>

" go current tag
function! CurrentTagSearch()
    let curr_tags = split(lightline_tagbar#component(), '(')
    if len(curr_tags) ==# 0
        echo "No tag found."
        return
    endif
    let l:tag = curr_tags[0]
    let l:search_term = l:tag
    if &filetype ==# 'c'
        " void main()
        " static void main()
        " ICODE static void main()
        " static void __attribute__ ((unused)) main()
        let l:search_term = '^\([!-~]\+\s\+\)\+'.l:tag
    elseif &filetype ==# 'python'
        " def __init__():
        let l:search_term = '^\s*def\s\+'.l:tag
    endif
    " push current cursor position to jump list
    let l:cursor_pos = getpos('.')
    execute "normal " . l:cursor_pos[1] . "G" . (l:cursor_pos[2]-1) . "|"
    " echo l:search_term
    call search(l:search_term, 'cb')
    call search(l:tag, 'c', line('.'))
endfunction
nnoremap <silent> <Leader>gt :call CurrentTagSearch()<CR>

