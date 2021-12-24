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
    " refer to rg --help
    silent execute "grep! --fixed-strings --case-sensitive --word-regexp --regexp ".shellescape(@@)
    copen
endfunction

augroup myvimrc
    " open quickfix windows automatically after grep, lgrep, make, etc commands
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END

augroup grep_quick_fix_keymap
    autocmd!
    autocmd! FileType qf nnoremap <silent> <buffer> q :q<CR>
    autocmd! FileType qf nnoremap <silent> <buffer> <Esc> :q<CR>
augroup END

set grepprg=rg\ --vimgrep
set grepformat=%f:%l:%c:%m
