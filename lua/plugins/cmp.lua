return {
  "hrsh7th/nvim-cmp", -- Ensure this is the correct plugin
  event = "InsertEnter", -- You can adjust this based on your LazyVim setup
  config = function()
    local cmp = require("cmp")

    -- Define the configuration directly in cmp.setup
    cmp.setup({
      -- Completion sources
      sources = {
        { name = "copilot", group_index = 2 },
        { name = "codeium", group_index = 2 },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "path" },
      },

      -- Key mappings for completion
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      }),

      -- Enable experimental features like ghost text
      experimental = {
        ghost_text = true,
      },
    })
  end,
}
