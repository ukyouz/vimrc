lua << EOF
require'lspconfig'.jedi_language_server.setup{}
require'lspconfig'.clangd.setup{}
--- require'lspconfig'.clangd.setup{on_attach=require'completion'.on_attach}
EOF

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
