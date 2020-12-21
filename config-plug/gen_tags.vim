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