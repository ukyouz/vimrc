nnoremap gr :set operatorfunc=GrepOperator<Cr>g@
vnoremap gr :<C-u>call GrepOperator(visualmode())<Cr>

function! GrepOperator(type)
    echo a:type
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    elseif a:type ==# 'line'
        return
    else
        return
    endif
    silent execute "grep! -F -s -w -e ".shellescape(@@)
    copen
endfunction

augroup grep_quick_fix_keymap
    autocmd!
    autocmd! FileType qf nnoremap <silent> <buffer> q :q<CR>
augroup END

set grepprg=rg\ --vimgrep
set grepformat=%f:%l:%c:%m
