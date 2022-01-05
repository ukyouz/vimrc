" LeaderF
" don't show the help in normal mode
" let $GTAGSCONF = 'D:/Applications/glo663wb/share/gtags/gtags.conf'
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 1
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 0
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_WindowHeight = 0.33
let g:Lf_PopupHeight = 0.33
let g:Lf_PopupWidth = 0.8
let g:Lf_PopupPosition = [1, 0]
let g:Lf_PopupPreviewPosition = 'bottom'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_PreviewWidth = 0
let g:Lf_PreviewHeight = 0
let g:Lf_PreviewResult = {
    \ 'File': 0,
    \ 'Buffer': 0,
    \ 'Mru': 1,
    \ 'Tag': 1,
    \ 'BufTag': 1,
    \ 'Function': 1,
    \ 'Line': 0,
    \ 'Colorscheme': 1,
    \ 'Rg': 0,
    \ 'Gtags': 1,
\}
let g:Lf_StlColorscheme = 'one'
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
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
   \ 'python': '--langmap=Python:.py.pyw',
\}
let g:Lf_GtagsGutentags = 1
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_GtagsAutoUpdate = 0

let g:Lf_GtagsSkipUnreadable = 1
let g:Lf_HighlightIndividual = 1
let g:Lf_WildIgnore = {
    \ 'dir': ['.svn','.git','.hg','.*','debug_launch_configuration'],
    \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]','*.launch','*.xml','*.db']
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
nnoremap <silent> <leader>l  :LeaderfSelf<CR>
nnoremap <silent> <leader>lb :LeaderfBuffer<CR><Tab>
nnoremap <silent> <leader>p :LeaderfFile<CR>
" noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
" noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
nnoremap <silent> <leader>bt :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
nnoremap <silent> <leader>bf :LeaderfFunction<CR>
nnoremap <silent> <leader>gt :LeaderfFunction!<CR>
nnoremap <silent> <leader>ll :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

nnoremap <silent> <Leader>lf :Leaderf rg<CR>
" nnoremap <silent> <Leader>lb :Leaderf rg --current-buffer<CR>
" noremap <Leader>f :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>
nnoremap <silent> <Leader>j :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
nnoremap <silent> <Leader>k :<C-U><C-R>=printf("Leaderf! rg -s -w -e %s ", expand("<cword>"))<CR><CR>
" search visually selected text literally
xnoremap <silent> <Leader>j :<C-U><C-R>=printf("Leaderf! rg -e %s ", leaderf#Rg#visual())<CR><CR>
xnoremap <silent> <Leader>k :<C-U><C-R>=printf("Leaderf! rg -s -w -e %s ", leaderf#Rg#visual())<CR><CR>
" restore latest search
nnoremap <silent> <Leader>u :<C-U>Leaderf! rg --recall<CR>
noremap <silent> <F4>      :<C-U>Leaderf! rg --next<CR>
noremap <silent> <S-F4>    :<C-U>Leaderf! rg --prev<CR>

" should use `Leaderf gtags --update` first
let g:Lf_Gtagslabel = 'native-pygments'
nnoremap <silent> <leader>t :Leaderf gtags<CR>
nnoremap <silent> <leader>lt :LeaderfTag<CR>
nnoremap <silent> <leader>lr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
nnoremap <silent> <leader>ld :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
" nnoremap <silent> <C-]>      :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
nnoremap <silent> <leader>lu :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
" nnoremap <silent> <F4>       :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
" nnoremap <silent> <S-F4>     :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

nnoremap <silent> <leader>\ :LeaderfRgInteractive<CR>

