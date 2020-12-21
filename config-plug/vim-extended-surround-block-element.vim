let brackets = split('( ) [ ] { } < >')
for b in brackets
    execute "onoremap \<silent> in".b." :<C-u>normal! f".b."vi".b."\r"
    execute "xnoremap \<silent> in".b." :<C-u>normal! f".b."vi".b."\r"
    execute "onoremap \<silent> an".b." :<C-u>normal! f".b."va".b."\r"
    execute "xnoremap \<silent> an".b." :<C-u>normal! f".b."va".b."\r"
endfor

function! s:inParameter(isInner)
    let l:lineNr = line('.')
    " search the next boundary
    if (!search('[,)]', 'ce', l:lineNr))
        return
    endif
    if (a:isInner || !search(',', 'ce', l:lineNr))
        normal! h
    endif
    normal! v
    if (!a:isInner)
        normal! h
    endif
    " search the current argument begining
    if (!search('[(,]', 'cb', l:lineNr))
        return
    endif
    normal! l
endfunction
onoremap <silent> ia :<C-u>call <sid>inParameter(1)<CR>
xnoremap <silent> ia :<C-u>call <sid>inParameter(1)<CR>
onoremap <silent> aa :<C-u>call <sid>inParameter(0)<CR>
xnoremap <silent> aa :<C-u>call <sid>inParameter(0)<CR>
