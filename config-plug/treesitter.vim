lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true, },
  incremental_selection = {
    enable = true,
    keymaps = {
      --- init_selection = "gnn",
      node_incremental = "g]",
      --- scope_incremental = "grc",
      node_decremental = "g[",
    },
  },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = { ["<leader>a"] = "@parameter.inner", },
      swap_previous = { ["<leader>A"] = "@parameter.inner", },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = { ["]f"] = "@function.outer", ["]j"] = "@loop.outer" },
      goto_next_end = { ["]F"] = "@function.outer", },
      goto_previous_start = { ["[f"] = "@function.outer", ["[j"] = "@loop.outer" },
      goto_previous_end = { ["[F"] = "@function.outer", },
    },
  },
  refactor = {
    highlight_definitions = { enable = false },
    highlight_current_scope = { enable = false },
    smart_rename = {
      enable = true,
      keymaps = { smart_rename = "grr", },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "<a-)>", --- alt-shift-0
        goto_next_usage = "<a-*>", --- alt-shift-8
        goto_previous_usage = "<a-#>", --- alt-shlft-3
      }
    }
  },
}
EOF

" go current tag
function! CurrentTagSearch()
    execute "normal [f"
    call search('(', 'c', line('.'))
    execute "normal B"
endfunction
nnoremap <silent> <Leader>gt :call CurrentTagSearch()<CR>

