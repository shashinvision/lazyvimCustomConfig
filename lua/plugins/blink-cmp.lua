return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "moyiz/blink-emoji.nvim",
      "ray-x/cmp-sql",
      "zbirenbaum/copilot.lua",
      "Exafunction/windsurf.vim", -- Codeium
      "dcampos/nvim-emmet-completion", -- Add this dependency
    },
    version = "*", -- "1.*"
    lazy = true,
    opts = {

      keymap = {
        preset = "enter",
        mappings = {
          ["<Up>"] = "select_prev_item",
          ["<Down>"] = "select_next_item",
          ["<C-Space>"] = "complete",
          ["<C-e>"] = "close",
          ["<CR>"] = "accept",
        },
      },

      appearance = {
        nerd_font_variant = "normal",
      },

      completion = { documentation = { auto_show = true } },
      signature = { enabled = true },

      sources = {
        default = { "lsp", "path", "snippets", "buffer", "emoji", "sql", "copilot", "codeium" },
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
          sql = {
            name = "sql",
            module = "blink.compat.source",
            score_offset = -3,
            opts = {},
            should_show_items = function()
              return vim.tbl_contains({ "sql" }, vim.o.filetype)
            end,
          },
          copilot = {
            name = "copilot",
            module = "blink.compat.source",
            score_offset = 5, -- Adjust as needed
            opts = {},
          },
          codeium = {
            name = "codeium",
            module = "blink.compat.source",
            score_offset = 5, -- Adjust as needed
            opts = {},
          },
          emmet = { -- Add this new provider
            name = "emmet",
            module = "blink.compat.source",
            score_offset = 10, -- Adjust as needed
            opts = {},
            should_show_items = function()
              return vim.tbl_contains({
                "html",
                "css",
                "javascript",
                "javascriptreact",
                "typescriptreact",
                "svelte",
                "vue",
                "blade",
                "php",
                "xml",
              }, vim.o.filetype)
            end,
          },
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
}
