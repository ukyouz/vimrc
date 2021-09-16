" NERDTree keymap
nnoremap <Leader>e :NERDTreeToggle<CR>
autocmd VimEnter * call NERDTreeAddKeyMap({ 'key': 'h', 'callback': 'NTreeMapCloseDir' })
autocmd VimEnter * call NERDTreeAddKeyMap({ 'key': 'l', 'callback': 'NTreeMapOpenDir' })
function! NTreeMapCloseDir()
    let n = g:NERDTreeFileNode.GetSelected()
    if n != {} && !n.isRoot()
        if !n.path.isDirectory || !n.isOpen
            let p = n.parent
            call p.close()
            call b:NERDTree.render()
            call p.putCursorHere(0,0)
        else " if the node is a opened dir
            call n.close()
            call b:NERDTree.render()
        endif
    endif
endfunction
function! NTreeMapOpenDir()
    let n = g:NERDTreeFileNode.GetSelected()
    if n != {}
        if n.path.isDirectory
            call n.open()
            call b:NERDTree.render()
        endif
    endif
endfunction
