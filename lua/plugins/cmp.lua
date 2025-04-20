return {
  "hrsh7th/nvim-cmp", -- Ensure this is the correct plugin
  event = "InsertEnter", -- You can adjust this based on your LazyVim setup
  config = function()
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Define the configuration directly in cmp.setup
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
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
      mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            -- cmp.select_next_item()
            cmp.confirm({ select = true })
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
      },

      -- Enable experimental features like ghost text
      experimental = {
        ghost_text = true,
      },
    })
  end,
}
