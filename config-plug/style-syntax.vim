"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
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
endif
" colorscheme
set background=dark
" colorscheme base16-eighties
let g:one_allow_italics = 1 " I love italic for comments
colorscheme one
" colorscheme solarized8
" call one#highlight('name', 'Foreground', 'Background', 'none')
call one#highlight('VertSplit', '4c5363', '4c5363', 'none')
call one#highlight('Comment', '6A748C', 'none', 'none')
call one#highlight('vimLineComment', '6A748C', 'none', 'none')
call one#highlight('pythonSpaceError', 'E06256', 'E06256', 'none')

" " Fork Style
" let s:visual_grey = 'DDDDDD'
" let s:dark_red    = '633F3E'
" let s:light_red   = '9F4247'
" let s:dark_yellow = '525C3A'
" let s:dark_green  = '3A5C3F'
" let s:light_green = '388442'

" VS Code Style
let s:visual_grey = 'B8BFCC'
let s:dark_red    = '53232A'
let s:light_red   = '751C22'
let s:dark_yellow = '203D49'
let s:dark_green  = '204944'
let s:light_green = '23657A'

call one#highlight('DiffAdd'    , s:visual_grey, s:dark_green , 'none')
call one#highlight('DiffChange' , s:visual_grey, s:dark_yellow, 'none')
call one#highlight('DiffDelete' , s:dark_red   , s:dark_red   , 'none')
call one#highlight('DiffText'   , s:visual_grey, s:light_green, 'none')
call one#highlight('DiffLine'   , s:visual_grey, s:dark_green , 'none')
call one#highlight('DiffAdded'  , s:visual_grey, s:light_green, 'none')
call one#highlight('DiffRemoved', s:visual_grey, s:light_red  , 'none')
"let ayucolor="mirage"   " for dark version of theme
"colorscheme ayu

" vim-lsp-cxx-highlight
let g:lsp_cxx_hl_use_text_props = 1

if !has('gui_running')
  set t_Co=256
endif

function! s:syntax_query() abort
    for id in synstack(line("."), col("."))
        echo synIDattr(id, "name")
    endfor
endfunction
command! SyntaxQuery call s:syntax_query()


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


" airline config
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 0


" cpp-enhanced-highlight config
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=1
let g:cpp_experimental_template_highlight=1
