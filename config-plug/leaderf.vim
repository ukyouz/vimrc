" LeaderF
" don't show the help in normal mode
" let $GTAGSCONF = 'D:/Applications/glo663wb/share/gtags/gtags.conf'
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 1
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 0
" popup mode
let g:Lf_WindowPosition = 'bottom'
let g:Lf_WindowHeight = 0.33
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_PreviewWidth = 0
let g:Lf_PreviewHeight = 0
let g:Lf_PreviewResult = { 'BufTag': 1, 'Function': 1, 'Colorscheme': 1 }
let g:Lf_StlColorscheme = 'one'
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:Lf_DisableStl = 0
let g:Lf_DefaultExternalTool = 'rg'
let g:Lf_RgHighlightInPreview = 1
let g:Lf_RgConfig = ['--glob=!git/*', '--threads', '8']
augroup rg_config_specify_setting
    autocmd!
    autocmd FileType c,cpp  let g:Lf_RgConfig += ['-tasm', '-tc']
    autocmd FileType python let g:Lf_RgConfig += ['--type-add', 'py:*.pyw', '-tpy']
augroup END
let g:Lf_ReverseOrder = 1
let g:Lf_ShowDevIcons = 0
" let g:Lf_DevIconsFont = 'Fira Mono for Powerline'
let g:Lf_ShowRelativePath = 1
let g:Lf_DefaultMode = 'NameOnly'
let g:Lf_NeedCacheTime = 1
" let g:Lf_Gtagsconf = $GTAGSCONF

let g:Lf_CacheDirectory = expand('~')
let g:gutentags_cache_dir = expand(g:Lf_CacheDirectory.'/.LfCache/gtags')
let g:Lf_CtagsFuncOpts = {
  \ 'c': '-languages=-JavaScript --languages=-Tcl --if0=yes --excmd=number --fields=+nS',
  \ 'python': '--langmap=Python:.py.pyw --languages=-JavaScript --languages=-Tcl --if0=yes --excmd=number --fields=+nS',
  \}
let g:Lf_GtagsGutentags = 1
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_GtagsAutoUpdate = 0

let g:Lf_GtagsSkipUnreadable = 1
let g:Lf_HighlightIndividual = 1
let g:Lf_WildIgnore = {
    \ 'dir': ['.svn','.git','.hg','.*','debug_launch_configuration'],
    \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]','*.launch','*.xml']
    \}
let g:Lf_RootMarkers = ['.root', '.git', '.svn']
let g:Lf_JumpToExistingWindow = 0

let g:Lf_NormalMap = {
    \ "_":      [["<C-j>", "j"],
    \            ["<C-k>", "k"]
    \           ],
    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
    \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
    \ "Gtags":  [["<ESC>", ':exec g:Lf_py "gtagsExplManager.quit()"<CR>']],
    \ "BufTag": [["<ESC>", ':exec g:Lf_py "bufTagExplManager.quit()"<CR>']],
    \ "Function": [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
    \ "Rg":     [["<ESC>", ':exec g:Lf_py "rgExplManager.quit()"<CR>']],
    \ "Line":   [["<ESC>", ':exec g:Lf_py "lineExplManager.quit()"<CR>']],
    \ "History":[["<ESC>", ':exec g:Lf_py "historyExplManager.quit()"<CR>']],
    \ "Help":   [["<ESC>", ':exec g:Lf_py "helpExplManager.quit()"<CR>']],
    \ "Self":   [["<ESC>", ':exec g:Lf_py "selfExplManager.quit()"<CR>']],
    \ "Colorscheme": [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']]
\}

let g:Lf_ShortcutF = "<leader>ff"
nnoremap <leader>b :LeaderfBuffer<CR><Tab>
nnoremap <leader>p :LeaderfFile<CR>
" noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
" noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
nnoremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
nnoremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" noremap <Leader>r :Leaderf rg<CR>
nnoremap <Leader>ff :Leaderf rg<CR>
nnoremap <Leader>fb :Leaderf rg --current-buffer<CR>
" noremap <Leader>f :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>
nnoremap <Leader>j :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
nnoremap <Leader>k :<C-U><C-R>=printf("Leaderf! rg -s -w -e %s ", expand("<cword>"))<CR><CR>
" search visually selected text literally
xnoremap <Leader>j :<C-U><C-R>=printf("Leaderf! rg -e %s ", leaderf#Rg#visual())<CR><CR>
xnoremap <Leader>k :<C-U><C-R>=printf("Leaderf! rg -s -w -e %s ", leaderf#Rg#visual())<CR><CR>
" restore latest search
nnoremap <Leader>u :<C-U>Leaderf! rg --recall<CR>
noremap <F4>      :<C-U>Leaderf! rg --next<CR>
noremap <S-F4>    :<C-U>Leaderf! rg --prev<CR>

" should use `Leaderf gtags --update` first
let g:Lf_Gtagslabel = 'native-pygments'
nnoremap <leader>t :Leaderf gtags<CR>
nnoremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
nnoremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
" nnoremap <C-]>      :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
nnoremap <leader>fu :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
" nnoremap <F4>       :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
" nnoremap <S-F4>     :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

nnoremap \ :LeaderfRgInteractive<CR>

