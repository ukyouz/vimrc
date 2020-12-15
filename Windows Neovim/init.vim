" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
let g:python3_host_prog=expand('C:\Users\johnny_cheng\AppData\Local\Programs\Python\Python38\python.exe')  " Python 3
call plug#begin('~/.vim/plugged')
""Make sure you use single quotes
" Plugin outside ~/.vim/plugged with post-update hook
" NVIM Enhance

Plug 'junegunn/fzf' ", { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf' | Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
" Plug 'preservim/tagbar'
Plug 'preservim/tagbar' | Plug 'mkalinski/vim-lightline_tagbar'
" Plug 'scrooloose/nerdtree'
Plug 'chazy/cscope_maps'
Plug 'kshenoy/vim-signature'
Plug 'Yggdroot/LeaderF' ", { 'do': './install.sh' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/vim-preview'

" Plug 'skywind3000/gutentags_plus'
" Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/denite.nvim' | Plug 'ozelentok/denite-gtags', {'for': ['c', 'cpp', 'h']}
" Plug 'Shougo/denite.nvim' | Plug 'chemzqm/denite-git'

Plug 'andymass/vim-matchup'
Plug 'michaeljsmith/vim-indent-object'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Plug 'christoomey/vim-system-copy'
"Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
"Plug 'drewtempelmeyer/palenight.vim'
" Plug 'easymotion/vim-easymotion'
"Plug 'bling/vim-bufferline'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'mhinz/vim-startify'
Plug 'lambdalisue/session.vim'
Plug 'vim-scripts/restore_view.vim'

" Color Theme
"Plug 'chriskempson/base16-vim'
"Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'ayu-theme/ayu-vim'
" Plug 'lifepillar/vim-solarized8'

""completion
Plug 'Shougo/deoplete.nvim' ", { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim' | Plug 'Shougo/deoplete-clangx', {'for': ['c', 'cpp', 'h']}
" Plug 'Shougo/deoplete.nvim' | Plug 'Shougo/neoinclude.vim', {'for': ['c', 'cpp', 'h']}
Plug 'Shougo/deoplete.nvim' | Plug 'zchee/deoplete-jedi', {'for': ['py', 'pyw']}

" Git Enhance
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'kdheepak/lazygit.nvim' ", { 'branch': 'nvim-v0.4.3' } 

" Syntax Enhance
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-python/python-syntax'
Plug 'luochen1990/rainbow'
" Initialize plugin system
call plug#end()

if !has('gui_running')
  set t_Co=256
endif

let mapleader=" "
map ; :
nnoremap <silent> <F5> :e!<CR>

""Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>
" NERDTree keymap
nnoremap <C-e> :NERDTreeToggle<CR>
" FZF
let $SHELL='cmd'
let g:fzf_layout = {'down': '~33%'}
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --threads 8 --column --line-number --no-heading -tc -tasm --type-add py:*.pyw -tpy --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   {'dir': getcwd()}, <bang>0)
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--color=always'
let g:fzf_preview_window = ''
nnoremap <Leader>p :Files<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>r :Rg<CR>
" nnoremap <Leader>f :BLines<CR>
"nnoremap <Leader><C-f> :Lines<CR>
" vnoremap <Leader>r y:Rg <C-R>=escape(tolower(@0), '/\.*$^~[]')<CR>
" vnoremap <Leader>t y:Tags <C-r>0
source D:/Applications/Neovim/config/fzf_cscope

" Move Cursor between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Resize splits
nnoremap <silent> <C-=> :vertical resize +7<CR>
nnoremap <silent> <C--> :vertical resize -7<CR>
nnoremap <silent> <C-.> :resize +3<CR>
nnoremap <silent> <C-,> :resize -3<CR>
nnoremap <silent> <C-0> <C-w>=
" Toggle serch highlight
nnoremap <silent> <F3> :noh<CR>
nnoremap <silent> <F12> <C-]>

inoremap <C-s> <Esc>:w<CR>a
nnoremap <C-s> :w<CR>
" Copy to system clipboard
vnoremap cp "*y<Esc>
nnoremap cv "*p
nnoremap cV "*P

" Git keymap
nnoremap <leader>gb :Git blame --date=short<CR>
nnoremap <leader>gs :Git<CR>

" Terminal
" open termianl on the 80px-width split
nnoremap <silent> <C-`> :80vs \| terminal<CR>a
if has("nvim")
    au TermOpen * tnoremap <Esc> <C-\><C-n>
    au FileType fzf tunmap <Esc>
endif

" colorscheme
set background=dark
" colorscheme base16-eighties
let g:one_allow_italics = 1 " I love italic for comments
colorscheme one
" colorscheme solarized8
call one#highlight('VertSplit', '4c5363', '4c5363', 'none')
call one#highlight('Comment', '6A748C', 'none', 'none')
call one#highlight('vimLineComment', '6A748C', 'none', 'none')
call one#highlight('pythonSpaceError', 'E06256', 'E06256', 'none')
"let ayucolor="mirage"   " for dark version of theme
"colorscheme ayu

function! s:syntax_query() abort
    for id in synstack(line("."), col("."))
        echo synIDattr(id, "name")
    endfor
endfunction
command! SyntaxQuery call s:syntax_query()

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif


" show linenumber cursorline highlightsearch nowrap
set shortmess+=at
set number cursorline hlsearch nowrap
set linespace=3
set scrolloff=0
set autoread
set autoindent
set formatoptions-=tc
set splitright splitbelow
set tabstop=4 softtabstop=4 shiftwidth=4
set noexpandtab
set nowrapscan
set mouse=a
"set clipboard+=unnamedplus
set list listchars=tab:\┊\ ,trail:·,extends:?,precedes:?,nbsp:×

" Turn backup off
set nobackup nowb noswapfile
set hidden

" toggle linenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set title
set titlestring=%{expand(\"%:p:h\")}\ %a%r%m

let g:python_recommended_style = 0

" gtags
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = 'D:/Applications/glo663wb/share/gtags/gtags.conf'
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
let g:gutentags_project_root = ['.root', '.git', '.svn', '.vscode']
" generate datebases in my cache directory, prevent gtags files polluting my project
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_ctags_extra_args = ['--langmap=python:.py,.pyw']
let g:gutentags_ctags_extra_args+= ['--languages=-JavaScript', '--languages=-Tcl']
let g:gutentags_ctags_extra_args+= ['--if0=yes', '--excmd=number']
let g:gutentags_ctags_extra_args = ['--fields=+nS']
" let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
" let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
" let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
let g:gutentags_define_advanced_commands = 1
let g:gutentags_plus_nomap = 1

" cscope
if has("cscope")
    set csto=0
    set cscopetag
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

" vim-preview
" noremap <silent><F4> :PreviewTag<CR>
noremap <silent><m-u> :PreviewScroll -1<cr>
noremap <silent><m-d> :PreviewScroll +1<cr>
inoremap <silent><m-u> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <silent><m-d> <c-\><c-o>:PreviewScroll +1<cr>
noremap  <silent><F2> :PreviewSignature!<cr>
inoremap <silent><F2> <c-\><c-o>:PreviewSignature!<cr>
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

""restore_view
set viewoptions=cursor,folds,slash,unix

" Python Syntax
let g:python_highlight_all = 1
au BufNewFile,BufRead *.py,*.pyw setf python

" coc
let g:coc_global_extensions = [
  \ 'coc-clangd',
  \]

" LeaderF
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'bottom'
let g:Lf_WindowHeight = 0.33
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_PreviewWidth = 0
let g:Lf_PreviewHeight = 0
let g:Lf_PreviewResult = { 'BufTag': 1, 'Function': 1, 'Colorscheme': 1 }
let g:Lf_RgHighlightInPreview = 1
let g:Lf_StlColorscheme = 'one'
let g:Lf_DefaultExternalTool = 'rg'
let g:Lf_RgConfig = ['--glob=!git/*', '--hidden', '--threads', '8', '-S', '-tasm', '-tc', '--type-add', 'py:*.pyw', '-tpy']
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:Lf_ReverseOrder = 1
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_GtagsGutentags = 1
let g:Lf_CacheDirectory = expand('~')
let g:gutentags_cache_dir = expand(g:Lf_CacheDirectory.'/.LfCache/gtags')
let g:Lf_GtagsSkipUnreadable = 1
" let g:Lf_GtagsAutoUpdate = 1
let g:Lf_HighlightIndividual = 1
let g:Lf_WildIgnore = {
    \ 'dir': ['.svn','.git','.hg','.*','debug_launch_configuration','sata'],
    \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]','*.launch','*.xml']
    \}
let g:Lf_RootMarkers = ['.root', '.git', '.svn', '.vscode']
let g:Lf_GtagsGutentags = s:vim_tags

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>p :LeaderfFile<CR>
" noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
" noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" noremap <Leader>r :Leaderf rg<CR>
noremap <Leader>ff :Leaderf rg<CR>
noremap <Leader>fb :Leaderf rg --current-buffer<CR>
" noremap <Leader>f :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>
noremap <Leader>j :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
" search visually selected text literally
xnoremap <Leader>j :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR><CR>
" restore latest search
noremap <Leader>u :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>t :Leaderf gtags<CR>
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fu :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <F4>       :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <S-F4>     :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

noremap \ :LeaderfRgInteractive<CR>

" ctrlp
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_working_path_mode=0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|metadata|vscode)$',
  \ 'file': '\v\.(exe|so|dll|o)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --glob ""'
  let g:ctrlp_use_caching = 0
else
  let g:ctrlp_clear_cache_on_exit = 0
endif

" Startify
let g:startify_change_to_dir = 0

" Denite
" let b:denite_gtags_db_path=s:vim_tags
" call denite#custom#source('_', 'matchers', ['matcher/fuzzy'])
" call denite#custom#map('_', '<Esc>', '<denite:quit>q', 'noremap')
" call denite#custom#var('file/rec', 'command', ['rg', '-S', '--files', '--glob', '!.git'])
" call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])
" call denite#custom#source('file_rec', 'matchers', ['matcher/fuzzy'])
" call denite#custom#option('default', 'prompt', 'λ')
" call denite#custom#option('default', 'split', 'horizontal')
" call denite#custom#option('default', 'highlight_filter_background', 'DeniteFilter')
" call denite#custom#var('tag', 'command', ['rg'])
" call denite#custom#var('grep', 'command', ['rg', '--threads', '8', '-S', '-tasm', '-tc', '--type-add', 'py:*.pyw', '-tpy'])
" call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading', '-S'])
" call denite#custom#var('grep', 'recursive_opts', [])
" " call denite#custom#var('grep', 'pattern_opt', [])
" call denite#custom#var('grep', 'separator', ['--'])
" call denite#custom#var('grep', 'final_opts', [])
" call denite#custom#source('grep', 'matchers', ['matcher/substring'])
" call denite#custom#source('gtags_ref', 'matchers', ['matcher/substring'])
" call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
"       \ [ '.git/', '.metadata/*', '.ropeproject/', '__pycache__/*', '*.pyc', 'node_modules/',
"       \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/', '*.png', '*.launch'])
" " nmap <leader>r :DeniteCursorWord -winheight=30 -immediately-1 gtags_ref<cr>
" nmap <c-n> :Denite -resume -cursor-pos=+1 -immediately<cr>
" nmap <c-p> :Denite -resume -cursor-pos=-1 -immediately<cr>
" nmap <leader>u :Denite -resume<cr>
" " nmap <LEADER>p :Denite -no-empty -start-filter file/rec<CR>
" nmap <LEADER>b :Denite buffer<CR>
" " nnoremap <leader>g :<C-u>Denite grep:. -no-empty -preview-height=25<CR>
" nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -preview-height=25<CR>
" nnoremap \ :Denite grep:. -no-empty -preview-height=25<CR>

" autocmd FileType denite call s:denite_my_settings()
" function! s:denite_my_settings() abort
"   nnoremap <silent><buffer><expr> <CR>    denite#do_map('do_action')
"   nnoremap <silent><buffer><expr> d       denite#do_map('do_action', 'delete')
"   nnoremap <silent><buffer><expr> p       denite#do_map('do_action', 'preview')
"   nnoremap <silent><buffer><expr> q       denite#do_map('quit')
"   nnoremap <silent><buffer><expr> i       denite#do_map('open_filter_buffer')
"   nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
" endfunction
" autocmd FileType denite-filter call s:denite_filter_my_settings()
" function! s:denite_filter_my_settings() abort
"   imap <silent><buffer> <Esc>     <Plug>(denite_filter_quit)
" endfunction

" Sneak
let g:sneak#label = 1
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1

" lightline config
set noshowmode
set laststatus=2
" printf-compatible string that accepts a single value - the name of the tag.
let g:lightline_tagbar#format = '%s'
" Flags argument passed to tagbar#currenttag. See documentation of that
" function for details.
let g:lightline_tagbar#flags = ''

let g:lightline={
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'filename', 'tagbar' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'gitbranch', 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'mode': 'LightlineMode',
  \   'filename': 'LightlineFilename',
  \   'gitbranch': 'FugitiveHead',
  \   'tagbar': 'LightlineTagBar',
  \ },
  \ }
function! LightlineMode()
  return expand('%:t') =~# '^__Tagbar__' ? 'Tagbar':
  \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
  \ expand('%:t') ==# 'NERD_tree_1' ? 'NERDT' :
  \ &filetype ==# 'unite' ? 'Unite' :
  \ &filetype ==# 'denite-filter' ? 'Denite' :
  \ &filetype ==# 'vimfiler' ? 'VimFiler' :
  \ &filetype ==# 'vimshell' ? 'VimShell' :
  \ lightline#mode()
endfunction
function! LightlineFilename()
    let filename = expand('%:t') !=# '' ? @% : '[No Name]'
    let modified = &modified ? ' +' : ''
    return filename . modified
endfunction
function! LightlineTagBar()
    let filename = expand('%:t') !=# '' ? @% : ''
	let tag = ''
    if filename != ''
		let tag = lightline_tagbar#component()
	endif
    return tag
endfunction

" gitgutter config
set signcolumn=yes
set updatetime=300
let g:gitgutter_sign_added              = '▌'
let g:gitgutter_sign_modified           = '▌'
let g:gitgutter_sign_modified_removed   = '▌'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_removed            = '▁'

" rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['#1E90FF', '#E06256', '#98AC58', '#E5A959', '#469BEF', '#C678DD', 'SeaGreen', 'Brown'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,\|&&\|||_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold'],
\   'separately': {
\       '*': {},
\       'c': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'h': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}


" cpp-enhanced-highlight config
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=1
let g:cpp_experimental_template_highlight=1

" airline config
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 0

" gen_tags
let g:loaded_gentags#ctags = 1
let g:loaded_gentags#gtags = 1
let g:gen_tags#gtags_opts = []
let g:gen_tags#gtags_auto_gen = 1
let g:gen_tags#gtags_default_map = 0 
let g:gen_tags#use_cache_dir = 1
let g:gen_tags#gtags_bin = expand('D:\Applications\glo663wb\bin\gtags.exe')
let g:gen_tags#global_bin = expand('D:\Applications\glo663wb\bin\global.exe')
" nnoremap <F5> :GenGTAGS<cr>
" nnoremap <C-F5> :ClearGTAGS<cr>:!del GTAGS GRTAGS GPATH<cr>:GenGTAGS<cr>

""deoplete
" call deoplete#enable_logging('DEBUG', 'D:/johnny_cheng/Desktop/deoplete.log')
let g:deoplete#enable_at_startup = 1
let g:deoplete#buffer#require_same_filetype = 0
call deoplete#custom#var('enable_buffer_path', v:true)
call deoplete#custom#option('enable_smart_case', v:true)
call deoplete#custom#option('auto_complete', v:true)
call deoplete#custom#option('auto_complete_delay', 0)
call deoplete#custom#option('sources', {
    \ '_': ['file', 'buffer'],
    \ 'python': ['jedi', 'file'],
    \})
" \ 'c': ['clangx', 'buffer'],
" \ 'cpp': ['clangx', 'buffer'],
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
call deoplete#custom#source('_', 'sorters', ['sorter_rank'])
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ?  "\<TAB>" :
    \ deoplete#manual_complete()
inoremap <silent><expr> <S-Tab> pumvisible() ?  "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <CR> pumvisible() ?  deoplete#close_popup() : "\<CR>"

""deoplete-clangx
" call deoplete#custom#var('clangx', 'clang_binary', expand('D:/Applications/Neovim/bin/clang.exe'))
" call deoplete#custom#var('clangx', 'default_c_options', '')
" call deoplete#custom#var('clangx', 'default_cpp_options', '')

" session.vim
let g:session_dir = '.session'
nnoremap <F6> :SessionList<CR>
nnoremap <S-F6> :SessionSave! 
