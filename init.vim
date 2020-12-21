filetype plugin on
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" let g:python3_host_prog=expand('D:/Applications/Neovim/bin/python.exe') " Python 3
let g:python3_host_prog=expand('C:/Users/johnny_cheng/AppData/Local/Programs/Python/Python38/python.exe') " Python 3
call plug#begin('~/.vim/plugged')
""Make sure you use single quotes
" Plugin outside ~/.vim/plugged with post-update hook
" NVIM Enhance

Plug 'junegunn/fzf' ", { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf' | Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/tagbar' | Plug 'mkalinski/vim-lightline_tagbar'
" Plug 'scrooloose/nerdtree'
" Plug 'chazy/cscope_maps'
Plug 'Yggdroot/LeaderF' ", { 'do': './install.sh' }
Plug 'kshenoy/vim-signature'
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
Plug 'machakann/vim-highlightedyank'

" Plug 'christoomey/vim-system-copy'
" Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" Plug 'drewtempelmeyer/palenight.vim'
" Plug 'easymotion/vim-easymotion'
" Plug 'bling/vim-bufferline'
Plug 'mhinz/vim-startify'
" Plug 'lambdalisue/session.vim'
Plug 'vim-scripts/restore_view.vim'

" Color Theme
Plug 'rakr/vim-one'
" Plug 'ayu-theme/ayu-vim'
" Plug 'lifepillar/vim-solarized8'

""completion
Plug 'neoclide/coc.nvim' ", {'branch': 'release'}
" Plug 'Shougo/deoplete.nvim', {'for': ['c', 'python']} ", { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/deoplete.nvim' | Plug 'Shougo/deoplete-clangx', {'for': ['c']}
" Plug 'Shougo/deoplete.nvim' | Plug 'deoplete-plugins/deoplete-clang', {'for': ['c']}
" Plug 'Shougo/deoplete.nvim' | Plug 'Shougo/neoinclude.vim', {'for': ['c', 'cpp', 'h']}
" Plug 'Shougo/deoplete.nvim' | Plug 'deoplete-plugins/deoplete-jedi', {'for': ['python']}

" Git Enhance
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Plug 'kdheepak/lazygit.nvim' ", { 'branch': 'nvim-v0.4.3' } 

" Syntax Enhance
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp', 'h']}
Plug 'jackguo380/vim-lsp-cxx-highlight', {'for': ['c', 'cpp', 'h']}
Plug 'vim-python/python-syntax', {'for': ['python', 'py', 'pyw']}
Plug 'luochen1990/rainbow'
" Initialize plugin system
call plug#end()

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
inoremap <silent> <C-v> <Esc>"*pa
vnoremap <silent> <C-c> "*y

" Terminal
" open termianl on the 80px-width split
nnoremap <silent> <C-`> :80vs \| terminal<CR>a
if has("nvim")
    au TermOpen * tnoremap <Esc> <C-\><C-n>
    au FileType fzf tunmap <Esc>
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
set expandtab
set nowrapscan
set mouse=a
"set clipboard+=unnamedplus
set list listchars=tab:\┊\ ,trail:·,extends:?,precedes:?,nbsp:×
set title
set titlestring=%{expand(\"%:p:h\")}\ %a%r%m

" Turn backup off
set nobackup nowb noswapfile
set hidden

" toggle linenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" disable python style auto settings being overridden
" let g:python_recommended_style = 1

""restore_view
set viewoptions=cursor,folds,slash,unix

source $LOCALAPPDATA/nvim/config-plug/vim-sneak.vim
source $LOCALAPPDATA/nvim/config-plug/vim-commentary.vim
source $LOCALAPPDATA/nvim/config-plug/vim-extended-surround-block-element.vim
source $LOCALAPPDATA/nvim/config-plug/vim-highlightedyank.vim
" source $LOCALAPPDATA/nvim/config-plug/nerdtree.vim
" source $LOCALAPPDATA/nvim/config-plug/ctrlp.vim
source $LOCALAPPDATA/nvim/config-plug/fzf.vim
source $LOCALAPPDATA/nvim/config-plug/coc.vim
" source $LOCALAPPDATA/nvim/config-plug/deoplete.vim
source $LOCALAPPDATA/nvim/config-plug/gtags.vim
" source $LOCALAPPDATA/nvim/cconfig-plug/denite.vim
source $LOCALAPPDATA/nvim/config-plug/vim-preview.vim
source $LOCALAPPDATA/nvim/config-plug/leaderf.vim
source $LOCALAPPDATA/nvim/config-plug/startify.vim
source $LOCALAPPDATA/nvim/config-plug/git-enhance.vim
source $LOCALAPPDATA/nvim/config-plug/style-syntax.vim
" source $LOCALAPPDATA/nvim/config-plug/gen_tags.vim
" source $LOCALAPPDATA/nvim/config-plug/session.vim

source $LOCALAPPDATA/nvim/config-plug/python-syntax.vim