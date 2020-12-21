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
	\ 'python': ['jedi', 'tag', 'file'],
	\ 'c': ['clangx', 'tag', 'buffer', 'file'],
	\ 'cpp': ['clangx', 'tag', 'buffer', 'file'],
\})
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
call deoplete#custom#source('_', 'sorters', ['sorter_rank'])
function! s:check_back_space() abort
 let col = col('.') - 1
 return !col || getline('.')[col - 1]  =~ '\s'
endfunction
" inoremap <silent><expr> <TAB>
"  \ pumvisible() ? "\<C-n>" :
"  \ <SID>check_back_space() ?  "\<TAB>" :
"  \ deoplete#manual_complete()
" inoremap <silent><expr> <S-Tab> pumvisible() ?  "\<C-p>" : "\<S-Tab>"
" inoremap <silent><expr> <CR> pumvisible() ?  deoplete#close_popup() : "\<CR>"

"deoplete-clangx
call deoplete#custom#var('clangx', 'clang_binary', expand('D:/Applications/Neovim/bin/clang.exe'))
call deoplete#custom#var('clangx', 'default_c_options', '')
call deoplete#custom#var('clangx', 'default_cpp_options', '')


