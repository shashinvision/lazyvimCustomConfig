return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- or latte, frappe, macchiato
        transparent_background = true, -- disables setting the background color.
        term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
          },
        },
        highlight_overrides = {
          mocha = function(colors)
            return {
              ["@keyword"] = { fg = colors.pink, bold = true, italic = true },
              ["@keyword.return"] = { fg = colors.mauve, bold = true },
              ["@keyword.function"] = { fg = colors.blue, bold = true },
              Keyword = { fg = colors.pink, bold = true },
            }
          end,
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
