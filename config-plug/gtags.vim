" gtags
let $GTAGSLABEL = 'native-pygments'
" let $GTAGSCONF = 'D:/Applications/glo663wb/share/gtags/gtags.conf'
let g:gutentags_exclude_filetypes = ['vim']
" enable gtags module
let g:gutentags_modules = []
if executable('ctags')
  let g:gutentags_modules += ['ctags']
endif
" if executable('cscope')
"   let g:gutentags_modules += ['cscope']
" endif
if executable('gtags')
  let g:gutentags_modules += ['gtags_cscope']
endif
" config project root markers.
let g:gutentags_project_root = ['.root', '.git', '.svn']
" generate datebases in my cache directory, prevent gtags files polluting my project
let s:vim_tags = expand('~/.LfCache/gtags')
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_file_list_command = 'rg --files'
let g:gutentags_ctags_extra_args = ['--langmap=Python:.py.pyw']
let g:gutentags_ctags_extra_args+= ['--languages=-JavaScript', '--languages=-Tcl']
let g:gutentags_ctags_extra_args+= ['--if0=yes', '--excmd=number']
let g:gutentags_ctags_extra_args+= ['--fields=+nS']
let g:gutentags_ctags_extra_args = ['--exclude=@.gitignore']
" let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
" let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
let g:gutentags_define_advanced_commands = 1
let g:gutentags_plus_nomap = 1

" cscope
if has("cscope")
    set csto=0
    " set cscopetag
    set cscopeprg='gtags-cscope'
    " set cscopeverbose
endif
" function! LoadCscope()
"   let db = findfile("cscope.out", ".;")
"   if (!empty(db))
"     let path = strpart(db, 0, match(db, "/cscope.out$"))
"     set nocscopeverbose " suppress 'duplicate connection' error
"     exe "cs add " . db . " " . path
"     set cscopeverbose
"   " else add the database pointed to by environment variable 
"   elseif $CSCOPE_DB != "" 
"     cs add $CSCOPE_DB
"   endif
" endfunction
" au BufEnter /* call LoadCscope()
