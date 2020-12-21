" Denite
let b:denite_gtags_db_path=s:vim_tags
call denite#custom#source('_', 'matchers', ['matcher/fuzzy'])
call denite#custom#map('_', '<Esc>', '<denite:quit>q', 'noremap')
call denite#custom#var('file/rec', 'command', ['rg', '-S', '--files', '--glob', '!.git'])
call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])
call denite#custom#source('file_rec', 'matchers', ['matcher/fuzzy'])
call denite#custom#option('default', 'prompt', 'λ')
call denite#custom#option('default', 'split', 'horizontal')
call denite#custom#option('default', 'highlight_filter_background', 'DeniteFilter')
call denite#custom#var('tag', 'command', ['rg'])
call denite#custom#var('grep', 'command', ['rg', '--threads', '8', '-S', '-tasm', '-tc', '--type-add', 'py:*.pyw', '-tpy'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading', '-S'])
call denite#custom#var('grep', 'recursive_opts', [])
" call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#source('grep', 'matchers', ['matcher/substring'])
call denite#custom#source('gtags_ref', 'matchers', ['matcher/substring'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.metadata/*', '.ropeproject/', '__pycache__/*', '*.pyc', 'node_modules/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/', '*.png', '*.launch'])
" nmap <leader>r :DeniteCursorWord -winheight=30 -immediately-1 gtags_ref<cr>
nmap <c-n> :Denite -resume -cursor-pos=+1 -immediately<cr>
nmap <c-p> :Denite -resume -cursor-pos=-1 -immediately<cr>
nmap <leader>u :Denite -resume<cr>
" nmap <LEADER>p :Denite -no-empty -start-filter file/rec<CR>
nmap <LEADER>b :Denite buffer<CR>
" nnoremap <leader>g :<C-u>Denite grep:. -no-empty -preview-height=25<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -preview-height=25<CR>
nnoremap \ :Denite grep:. -no-empty -preview-height=25<CR>
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>    denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d       denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p       denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q       denite#do_map('quit')
  nnoremap <silent><buffer><expr> i       denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <Esc>     <Plug>(denite_filter_quit)
endfunction