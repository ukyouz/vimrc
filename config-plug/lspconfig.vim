lua << EOF
require'lspconfig'.jedi_language_server.setup{}
require'lspconfig'.clangd.setup{}
---require'lspconfig'.clangd.setup{on_attach=require'completion'.on_attach}
require'lsp_signature'.setup({
    floating_window=false,
    floating_window_above_cur_line=false,
    always_trigger=false,
    hint_enable=true,
    hint_prefix='💡 ',
    toggle_key='<M-x>',
})
EOF

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" let g:completion_trigger_keyword_length = 0 " default = 1

" Use completion-nvim in every buffer
" autocmd BufEnter * lua require'completion'.on_attach()

lua << EOF
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {'clangd', 'jedi_language_server'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
  },
}
EOF

