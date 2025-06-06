return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "moyiz/blink-emoji.nvim",
      -- "Exafunction/windsurf.vim", -- Codeium
    },
    version = "*", -- "1.*"
    lazy = true,
    opts = {
      completion = {
        menu = {
          winblend = vim.o.pumblend,
        },
      },
      signature = {
        window = {
          winblend = vim.o.pumblend,
        },
      },

      keymap = {
        preset = "enter",
        mappings = {
          ["<C-p>"] = "select_prev_item",
          ["<C-n>"] = "select_next_item",
          ["<C-Space>"] = "complete",
          ["<C-e>"] = "close",
          ["<CR>"] = "accept",
        },
      },

      appearance = {
        nerd_font_variant = "normal", -- "normal", "mono"
      },

      sources = {
        -- default = { "lsp", "path", "snippets", "buffer", "emoji", "sql", "codeium" },
        default = { "lsp", "path", "snippets", "buffer", "emoji" },
        providers = {
          emoji = {
            module = "blink-emoji",
            name = "Emoji",
            score_offset = 15,
            opts = { insert = true },
            should_show_items = function()
              return vim.tbl_contains({ "gitcommit", "markdown" }, vim.o.filetype)
            end,
          },
          -- codeium = {
          --   name = "codeium",
          --   module = "blink.compat.source",
          --   score_offset = 5, -- Adjust as needed
          --   opts = {},
          -- },
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
}
